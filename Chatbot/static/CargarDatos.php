<?php
include 'database.php'; // Conexión a la base de datos

// Ruta al archivo CSV
$csvFile = 'canasta_basica_urbana_PREPROCESADO.csv';

// Abrir el archivo CSV
if (($handle = fopen($csvFile, 'r')) !== false) {
    // Saltar la primera fila (encabezados)
    fgetcsv($handle);

    // Preparar la consulta para insertar los datos en la tabla
    $stmt = $conn->prepare("INSERT INTO CanastaBasicaUrbana (producto, categoria, precio, fecha) VALUES (:producto, :categoria, :precio, :fecha)");

    // Leer las filas del CSV y insertarlas en la base de datos
    while (($data = fgetcsv($handle, 1000, ',')) !== false) {
        $producto = $data[0];
        $categoria = $data[1];
        $precio = $data[2];
        $fecha = $data[3];

        // Ejecutar la consulta con los datos de la fila
        $stmt->execute([
            'producto' => $producto,
            'categoria' => $categoria,
            'precio' => $precio,
            'fecha' => $fecha
        ]);
    }

    // Cerrar el archivo
    fclose($handle);

    echo "Datos cargados exitosamente en la base de datos.";
} else {
    echo "Error al abrir el archivo CSV.";
}
?>
