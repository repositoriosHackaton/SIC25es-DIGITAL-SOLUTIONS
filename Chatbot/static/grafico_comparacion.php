<?php
header("Content-Type: image/png");

// Ruta del archivo CSV
$archivo_csv = "canasta_basica_urbana_PREPROCESADO.csv";

// Verificar si el archivo existe
if (!file_exists($archivo_csv)) {
    die("Error: No se encontró el archivo CSV.");
}

// Leer el archivo CSV
$datos = array_map("str_getcsv", file($archivo_csv));
array_shift($datos); // Eliminar la primera fila (encabezados)

// Variables para almacenar datos
$productos = [];
$precios = [];

// Extraer datos del CSV
foreach ($datos as $fila) {
    $productos[] = $fila[0]; // Producto
    $precios[] = floatval($fila[1]); // Precio
}

// Crear imagen
$ancho = 700;
$alto = 400;
$imagen = imagecreate($ancho, $alto);

// Colores
$blanco = imagecolorallocate($imagen, 255, 255, 255);
$negro = imagecolorallocate($imagen, 0, 0, 0);
$rojo = imagecolorallocate($imagen, 255, 0, 0);

// Dibujar ejes
imageline($imagen, 50, 350, 650, 350, $negro);
imageline($imagen, 50, 50, 50, 350, $negro);

// Dibujar barras
$puntos = count($precios);
$espacio = 600 / $puntos;
$maxPrecio = max($precios);

for ($i = 0; $i < $puntos; $i++) {
    $altura = ($precios[$i] / $maxPrecio) * 300;
    imagefilledrectangle(
        $imagen,
        50 + $i * $espacio,
        350 - $altura,
        50 + ($i + 1) * $espacio - 5,
        350,
        $rojo
    );
}

// Agregar etiquetas
imagestring($imagen, 5, 300, 10, "Comparacion de Productos", $negro);
imagestring($imagen, 5, 10, 350, "Precios", $negro);

// Enviar la imagen al navegador
imagepng($imagen);
imagedestroy($imagen);
?>
