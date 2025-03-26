import matplotlib.pyplot as plt
import mysql.connector
import sys

# Conectar a la base de datos MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="tu_usuario",
    password="tu_contraseña",
    database="tu_base_de_datos"
)
cursor = conn.cursor()

# Recibir parámetros desde PHP (por ejemplo, año o artículo)
tipo = sys.argv[1]  # 'promedio' o 'precio'
parametro = sys.argv[2]  # Año o artículo

# Consulta SQL según el tipo de gráfico solicitado
if tipo == "promedio":
    query = "SELECT articulo, AVG(precio) FROM CanastaBasicaUrbana WHERE anio = %s GROUP BY articulo"
elif tipo == "precio":
    query = "SELECT mes, precio FROM CanastaBasicaUrbana WHERE articulo = %s ORDER BY mes"

cursor.execute(query, (parametro,))
data = cursor.fetchall()

# Extraer datos para la gráfica
x = [row[0] for row in data]
y = [row[1] for row in data]

# Crear gráfica
plt.figure(figsize=(8, 5))
plt.bar(x, y, color='blue')
plt.xlabel("Mes" if tipo == "precio" else "Artículo")
plt.ylabel("Precio")
plt.title(f"Gráfico de {'precios' if tipo == 'precio' else 'promedio de precios'} de {parametro}")
plt.xticks(rotation=45)
plt.tight_layout()

# Guardar imagen
plt.savefig("graficos/grafica.png")
plt.close()

# Cerrar conexión
cursor.close()
conn.close()
