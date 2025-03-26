<?php
include 'database.php'; // Conexión a la base de datos

if (isset($_POST["message"])) {
    $mensaje = strtolower(trim($_POST["message"])); // Convertir a minúsculas y limpiar espacios

    // Agregar la lista de meses
    $meses = [
        'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio',
        'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'
    ];

    // 🔹 Consulta sobre categorías de la canasta básica
    if (strpos($mensaje, "categorías de la canasta básica") !== false || strpos($mensaje, "categoría de la canasta básica") !== false) {
        $stmt = $conn->prepare("SELECT DISTINCT categoria FROM InformacionCanastaBasica");
        $stmt->execute();
        $result = $stmt->fetchAll();

        if ($result) {
            echo "Las categorías disponibles en la canasta básica son:<br>";
            foreach ($result as $row) {
                echo "✅ " . $row['categoria'] . "<br>";
            }
        } else {
            echo "❓ No se encontraron categorías en la canasta básica.";
        }
    }
    // 🔹 Consulta sobre los artículos por categoría
    elseif (strpos($mensaje, "artículos de la categoría") !== false) {
        preg_match('/categoría "([^"]+)"/', $mensaje, $categoriaMatch);
        $categoria = isset($categoriaMatch[1]) ? $categoriaMatch[1] : null;

        if ($categoria) {
            $stmt = $conn->prepare("SELECT * FROM InformacionCanastaBasica WHERE categoria = :categoria");
            $stmt->execute(['categoria' => $categoria]);
            $result = $stmt->fetchAll();

            if ($result) {
                echo "Los artículos en la categoría '$categoria' son:<br>";
                foreach ($result as $row) {
                    echo "✅ Artículo: " . $row['articulo'] . "<br>";
                    echo "✅ Descripción: " . $row['descripcion'] . "<br>";
                    echo "✅ Unidad de medida: " . $row['unidad_medida'] . "<br>";
                    echo "✅ Porcentaje de composición: " . $row['porcentaje_composicion'] . "%<br>";
                    echo "✅ Tipo de artículo: " . $row['tipo_articulo'] . "<br><br>";
                }
            } else {
                echo "❓ No se encontraron artículos en la categoría '$categoria'.";
            }
        } else {
            echo "❓ No se especificó la categoría. ¿Puedes intentar de nuevo?";
        }
    }
    // 🔹 Consulta sobre los gráficos
    elseif (strpos($mensaje, "gráfica") !== false || strpos($mensaje, "grafico") !== false) {
        if (strpos($mensaje, "promedio de precios") !== false) {
            preg_match('/\d{4}/', $mensaje, $matches);
            $anio = isset($matches[0]) ? $matches[0] : null;

            if ($anio) {
                exec("python3 generar_grafica.py promedio $anio");

                echo "📊 Aquí tienes la gráfica del promedio de precios en $anio:<br>";
                echo "<img src='graficos/grafica.png' alt='Gráfico de Precios'>";
            } else {
                echo "❗ Por favor, proporciona un año para generar la gráfica.";
            }
        } elseif (strpos($mensaje, "precio de") !== false) {
            $articulo = trim(str_replace("precio de", "", $mensaje));

            if ($articulo) {
                exec("python3 generar_grafica.py precio \"$articulo\"");

                echo "📊 Aquí tienes la gráfica de precios de $articulo:<br>";
                echo "<img src='graficos/grafica.png' alt='Gráfico de Precios'>";
            } else {
                echo "❗ Por favor, proporciona un artículo para generar la gráfica.";
            }
        } else {
            echo "❓ ¿Sobre qué quieres ver una gráfica? Puedes preguntar por el 'promedio de precios en [año]' o 'precio de [artículo]'.";
        }
    }
    // 🔹 Promedio de precios por año
    elseif (strpos($mensaje, "promedio de precios") !== false) {
        preg_match('/\d{4}/', $mensaje, $matches);
        $anio = isset($matches[0]) ? $matches[0] : null;

        if ($anio) {
            $stmt = $conn->prepare("SELECT articulo, ROUND(AVG(precio),2) AS promedio_precio FROM CanastaBasicaUrbana WHERE anio = :anio GROUP BY articulo");
            $stmt->execute(['anio' => $anio]);
            $result = $stmt->fetchAll();

            if ($result) {
                echo "📈 El promedio de precios en $anio es:<br>";
                foreach ($result as $row) {
                    echo "✅ " . $row['articulo'] . ": $" . $row['promedio_precio'] . "<br>";
                }
            } else {
                echo "❌ No se encontraron datos para el año $anio.";
            }
        } else {
            echo "❗ Por favor, proporciona un año para calcular el promedio de precios.";
        }
    }
    // 🔹 Consulta detallada del promedio por artículo
    elseif (strpos($mensaje, "promedio detallado por artículo") !== false) {
        preg_match('/\d{4}/', $mensaje, $matches);
        $anio = isset($matches[0]) ? $matches[0] : null;

        if ($anio) {
            // Consulta SQL para obtener el promedio de los precios por artículo en el año especificado
            $stmt = $conn->prepare("
                SELECT articulo, 
                    AVG(enero) AS promedio_enero, 
                    AVG(febrero) AS promedio_febrero, 
                    AVG(marzo) AS promedio_marzo, 
                    AVG(abril) AS promedio_abril, 
                    AVG(mayo) AS promedio_mayo, 
                    AVG(junio) AS promedio_junio, 
                    AVG(julio) AS promedio_julio, 
                    AVG(agosto) AS promedio_agosto, 
                    AVG(septiembre) AS promedio_septiembre, 
                    AVG(octubre) AS promedio_octubre, 
                    AVG(noviembre) AS promedio_noviembre, 
                    AVG(diciembre) AS promedio_diciembre
                FROM CanastaBasicaUrbana
                WHERE anio = :anio
                GROUP BY articulo");
            $stmt->execute(['anio' => $anio]);
            $result = $stmt->fetchAll();

            if ($result) {
                echo "✅ Consulta realizada con éxito.<br>";
                echo "El promedio de precios de los productos en el año $anio es:<br>";
                foreach ($result as $row) {
                    echo "- " . $row['articulo'] . ":<br>";
                    echo "  Enero: $" . number_format($row['promedio_enero'], 2) . "<br>";
                    echo "  Febrero: $" . number_format($row['promedio_febrero'], 2) . "<br>";
                    echo "  Marzo: $" . number_format($row['promedio_marzo'], 2) . "<br>";
                    echo "  Abril: $" . number_format($row['promedio_abril'], 2) . "<br>";
                    echo "  Mayo: $" . number_format($row['promedio_mayo'], 2) . "<br>";
                    echo "  Junio: $" . number_format($row['promedio_junio'], 2) . "<br>";
                    echo "  Julio: $" . number_format($row['promedio_julio'], 2) . "<br>";
                    echo "  Agosto: $" . number_format($row['promedio_agosto'], 2) . "<br>";
                    echo "  Septiembre: $" . number_format($row['promedio_septiembre'], 2) . "<br>";
                    echo "  Octubre: $" . number_format($row['promedio_octubre'], 2) . "<br>";
                    echo "  Noviembre: $" . number_format($row['promedio_noviembre'], 2) . "<br>";
                    echo "  Diciembre: $" . number_format($row['promedio_diciembre'], 2) . "<br>";
                }
            } else {
                echo "⚠️ No se encontraron productos para el año $anio.";
            }
        } else {
            echo "❌ Error: No proporcionaste un año válido.";
        }
    }
    // 🔹 Promedio detallado del artículo por año (nuevo)
    elseif (strpos($mensaje, "promedio detallado del artículo") !== false) {
        preg_match('/\d{4}/', $mensaje, $matches);
        $anio = isset($matches[0]) ? $matches[0] : null;
        preg_match('/"([^"]+)"/', $mensaje, $articuloMatch);
        $articulo = isset($articuloMatch[1]) ? $articuloMatch[1] : null;

        if ($anio && $articulo) {
            // Consulta SQL para obtener el promedio del artículo específico en el año
            $stmt = $conn->prepare("
                SELECT articulo, 
                    AVG(enero) AS promedio_enero, 
                    AVG(febrero) AS promedio_febrero, 
                    AVG(marzo) AS promedio_marzo, 
                    AVG(abril) AS promedio_abril, 
                    AVG(mayo) AS promedio_mayo, 
                    AVG(junio) AS promedio_junio, 
                    AVG(julio) AS promedio_julio, 
                    AVG(agosto) AS promedio_agosto, 
                    AVG(septiembre) AS promedio_septiembre, 
                    AVG(octubre) AS promedio_octubre, 
                    AVG(noviembre) AS promedio_noviembre, 
                    AVG(diciembre) AS promedio_diciembre
                FROM CanastaBasicaUrbana
                WHERE anio = :anio AND articulo = :articulo
                GROUP BY articulo");
            $stmt->execute(['anio' => $anio, 'articulo' => $articulo]);
            $result = $stmt->fetch();

            if ($result) {
                echo "✅ Consulta realizada con éxito.<br>";
                echo "El promedio de precios del artículo '$articulo' en el año $anio es:<br>";
                echo "  Enero: $" . number_format($result['promedio_enero'], 2) . "<br>";
                echo "  Febrero: $" . number_format($result['promedio_febrero'], 2) . "<br>";
                echo "  Marzo: $" . number_format($result['promedio_marzo'], 2) . "<br>";
                echo "  Abril: $" . number_format($result['promedio_abril'], 2) . "<br>";
                echo "  Mayo: $" . number_format($result['promedio_mayo'], 2) . "<br>";
                echo "  Junio: $" . number_format($result['promedio_junio'], 2) . "<br>";
                echo "  Julio: $" . number_format($result['promedio_julio'], 2) . "<br>";
                echo "  Agosto: $" . number_format($result['promedio_agosto'], 2) . "<br>";
                echo "  Septiembre: $" . number_format($result['promedio_septiembre'], 2) . "<br>";
                echo "  Octubre: $" . number_format($result['promedio_octubre'], 2) . "<br>";
                echo "  Noviembre: $" . number_format($result['promedio_noviembre'], 2) . "<br>";
                echo "  Diciembre: $" . number_format($result['promedio_diciembre'], 2) . "<br>";
            } else {
                echo "⚠️ No se encontró información para el artículo '$articulo' en el año $anio.";
            }
        } else {
            echo "❗ Por favor, proporciona tanto el año como el nombre del artículo para obtener el promedio.";
        }
    }
    // 🔹 Consulta sobre la información de la canasta básica
elseif (strpos($mensaje, "canasta básica") !== false || strpos($mensaje, "información") !== false) {
    $stmt = $conn->prepare("SELECT * FROM canasta_basica_info WHERE descripcion_general LIKE :mensaje");
    $stmt->execute(['mensaje' => "%" . $mensaje . "%"]);
    $result = $stmt->fetchAll();

    if ($result) {
        echo "Información sobre la canasta básica:<br>";
        foreach ($result as $row) {
            echo "✅ Concepto: " . $row['concepto'] . "<br>";
            echo "✅ Productos típicos: " . $row['productos_tipicos'] . "<br>";
            echo "✅ Costo promedio: $" . $row['costo_promedio'] . "<br>";
            echo "✅ Variación anual: " . $row['variacion_anual'] . "%<br>";
            echo "✅ Año de inicio: " . $row['año_inicio'] . "<br>";
            echo "✅ Región: " . $row['region'] . "<br>";
            echo "✅ Fuente de información: " . $row['fuente_informacion'] . "<br>";
            echo "✅ Última actualización: " . $row['fecha_actualizacion'] . "<br>";
            echo "<br>";
        }
    } else {
        echo "❓ No se encontró información relacionada con 'canasta básica'. ¿Puedes ser más específico?";
    }
}
// 🔹 Consulta sobre los artículos de la canasta básica
elseif (strpos($mensaje, "artículos de la canasta") !== false) {
    $stmt = $conn->prepare("SELECT * FROM InformacionCanastaBasica WHERE articulo LIKE :mensaje");
    $stmt->execute(['mensaje' => "%" . $mensaje . "%"]);
    $result = $stmt->fetchAll();

    if ($result) {
        echo "Información sobre los artículos de la canasta básica:<br>";
        foreach ($result as $row) {
            echo "✅ Artículo: " . $row['articulo'] . "<br>";
            echo "✅ Categoría: " . $row['categoria'] . "<br>";
            echo "✅ Descripción: " . $row['descripcion'] . "<br>";
            echo "✅ Unidad de medida: " . $row['unidad_medida'] . "<br>";
            echo "✅ Porcentaje de composición: " . $row['porcentaje_composicion'] . "%<br>";
            echo "✅ Tipo de artículo: " . $row['tipo_articulo'] . "<br>";
            echo "<br>";
        }
    } else {
        echo "❓ No se encontró información sobre artículos de la canasta básica. ¿Puedes ser más específico?";
    }

} else {
    echo "Por favor ingresa un mensaje.";
}
?>
