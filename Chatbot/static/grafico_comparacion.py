import matplotlib.pyplot as plt
import pandas as pd

# Ejemplo de datos para comparación de precios entre productos
data = {
    'Producto': ['Arroz', 'Frijoles', 'Aceite', 'Azúcar', 'Café'],
    'Enero': [1.2, 2.5, 3.4, 1.8, 2.0],
    'Febrero': [1.1, 2.6, 3.3, 1.9, 2.1],
    'Marzo': [1.3, 2.4, 3.5, 1.7, 2.2]
}

df = pd.DataFrame(data)

# Crear gráfico de comparación
df.set_index('Producto', inplace=True)  # Establecer "Producto" como índice para que sea más fácil graficar
df.plot(kind='bar', figsize=(10, 6))

# Personalizar el gráfico
plt.title('Comparación de Precios de Productos en Diferentes Meses')
plt.xlabel('Producto')
plt.ylabel('Precio')
plt.xticks(rotation=45)

# Guardar el gráfico generado
plt.savefig('/ruta/a/tu/proyecto/graficos/grafico_comparacion.png')
plt.close()
