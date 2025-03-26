import matplotlib.pyplot as plt
import pandas as pd

# Ejemplo de datos sobre precios de productos
data = {
    'Producto': ['Arroz', 'Frijoles', 'Aceite', 'Azúcar', 'Café'],
    'Precio': [1.2, 2.5, 3.4, 1.8, 2.0]
}

df = pd.DataFrame(data)

# Crear gráfico
plt.bar(df['Producto'], df['Precio'])
plt.title('Precios de Productos')
plt.xlabel('Producto')
plt.ylabel('Precio')

# Guardar el gráfico en la carpeta del proyecto
plt.savefig('/ruta/a/tu/proyecto/graficos/grafico_precios.png')
plt.close()
