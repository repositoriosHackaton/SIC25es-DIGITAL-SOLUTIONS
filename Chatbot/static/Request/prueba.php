<?php
include 'database.php';

$stmt = $conn->query("SELECT * FROM InformacionCanastaBasica LIMIT 1");
$result = $stmt->fetch();

if ($result) {
    echo "✅ Datos encontrados: " . print_r($result, true);
} else {
    echo "❌ No se encontraron datos.";
}
?>
