<?php
header("Content-Type: image/png");

// Ruta del archivo CSV
$archivo_csv = "canasta_basica_urbana_PREPROCESADO.csv";

// Verificar si el archivo existe
if (!file_exists($archivo_csv)) {
    die("Error: No se encontró el archivo CSV.");
}

// Abrir el archivo CSV
$datos = array_map("str_getcsv", file($archivo_csv));
array_shift($datos); // Eliminar la primera fila (encabezados)

// Variables para almacenar datos
$productos = [];
$precios = [];

// Extraer datos del CSV (asumiendo que el primer campo es el producto y el segundo el precio)
foreach ($datos as $fila) {
    $productos[] = $fila[0]; // Nombre del producto
    $precios[] = floatval($fila[1]); // Precio
}

// Crear la imagen del gráfico
$ancho = 700;
$alto = 400;
$imagen = imagecreate($ancho, $alto);

// Colores
$blanco = imagecolorallocate($imagen, 255, 255, 255);
$negro = imagecolorallocate($imagen, 0, 0, 0);
$azul = imagecolorallocate($imagen, 0, 0, 255);
$rojo = imagecolorallocate($imagen, 255, 0, 0);

// Dibujar ejes
imageline($imagen, 50, 350, 650, 350, $negro);
imageline($imagen, 50, 50, 50, 350, $negro);

// Dibujar datos como una línea
$puntos = count($precios);
$espacio = 600 / ($puntos - 1);

for ($i = 0; $i < $puntos - 1; $i++) {
    imageline(
        $imagen,
        50 + $i * $espacio,
        350 - $precios[$i] * 2,
        50 + ($i + 1) * $espacio,
        350 - $precios[$i + 1] * 2,
        $azul
    );
}

// Agregar etiquetas
imagestring($imagen, 5, 300, 10, "Grafico de Precios", $rojo);
imagestring($imagen, 5, 10, 350, "Precios", $negro);

// Enviar la imagen al navegador
imagepng($imagen);
imagedestroy($imagen);
?>
