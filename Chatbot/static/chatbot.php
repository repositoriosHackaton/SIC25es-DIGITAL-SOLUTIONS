<?php
include 'database.php'; // Incluir la conexión a la base de datos

if (isset($_POST["message"])) {
    $mensaje = strtolower(trim($_POST["message"]));

    // 🔹 Paso 1: Buscar respuestas predefinidas en `Conversaciones`
    $stmt = $conn->prepare("SELECT respuesta FROM Conversaciones WHERE pregunta = :pregunta 
                            OR palabras_clave LIKE :clave");
    $stmt->execute(['pregunta' => $mensaje, 'clave' => "%$mensaje%"]);
    $respuesta = $stmt->fetchColumn();

    if ($respuesta) {
        echo "🤖 " . $respuesta;
        exit();
    }

    // 🔹 Paso 2: Buscar respuestas generales en `ConversacionesGenerales`
    $stmt = $conn->prepare("SELECT respuesta FROM ConversacionesGenerales WHERE pregunta = :pregunta 
                            OR palabras_clave LIKE :clave");
    $stmt->execute(['pregunta' => $mensaje, 'clave' => "%$mensaje%"]);
    $respuesta = $stmt->fetchColumn();

    if ($respuesta) {
        echo "🤖 " . $respuesta;
        exit();
    }

    // 🔹 Paso 3: Consultar detalles específicos de un artículo en un año determinado
    if (preg_match("/(?:información|detalles) del artículo '([^']+)' de (\d{4})/", $mensaje, $match)) {
        $articulo = $match[1];  // El nombre del artículo
        $anio = $match[2];      // El año

        // Consultar promedios mensuales de un artículo en un año específico
        $stmt = $conn->prepare("SELECT articulo, 
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
                                WHERE articulo = :articulo AND anio = :anio
                                GROUP BY articulo");
        $stmt->execute(['articulo' => $articulo, 'anio' => $anio]);
        $datos_articulo = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($datos_articulo) {
            echo "📌 Promedios del artículo '$articulo' para el año $anio:<br>";
            echo "Enero: " . $datos_articulo['promedio_enero'] . "<br>";
            echo "Febrero: " . $datos_articulo['promedio_febrero'] . "<br>";
            echo "Marzo: " . $datos_articulo['promedio_marzo'] . "<br>";
            echo "Abril: " . $datos_articulo['promedio_abril'] . "<br>";
            echo "Mayo: " . $datos_articulo['promedio_mayo'] . "<br>";
            echo "Junio: " . $datos_articulo['promedio_junio'] . "<br>";
            echo "Julio: " . $datos_articulo['promedio_julio'] . "<br>";
            echo "Agosto: " . $datos_articulo['promedio_agosto'] . "<br>";
            echo "Septiembre: " . $datos_articulo['promedio_septiembre'] . "<br>";
            echo "Octubre: " . $datos_articulo['promedio_octubre'] . "<br>";
            echo "Noviembre: " . $datos_articulo['promedio_noviembre'] . "<br>";
            echo "Diciembre: " . $datos_articulo['promedio_diciembre'] . "<br>";

            // Datos para gráficos
            $promedios = [
                'enero' => $datos_articulo['promedio_enero'],
                'febrero' => $datos_articulo['promedio_febrero'],
                'marzo' => $datos_articulo['promedio_marzo'],
                'abril' => $datos_articulo['promedio_abril'],
                'mayo' => $datos_articulo['promedio_mayo'],
                'junio' => $datos_articulo['promedio_junio'],
                'julio' => $datos_articulo['promedio_julio'],
                'agosto' => $datos_articulo['promedio_agosto'],
                'septiembre' => $datos_articulo['promedio_septiembre'],
                'octubre' => $datos_articulo['promedio_octubre'],
                'noviembre' => $datos_articulo['promedio_noviembre'],
                'diciembre' => $datos_articulo['promedio_diciembre']
            ];

            // Enviar datos para graficar
            echo json_encode($promedios);
        } else {
            echo "📌 No se encontraron datos para el artículo '$articulo' en el año $anio.";
        }
        exit();
    }

    // 🔹 Paso 4: Consultar información general sobre el artículo (si no se especificó año)
    if (preg_match("/(?:información|detalles) del artículo '([^']+)'/", $mensaje, $match)) {
        $articulo = $match[1];  // El nombre del artículo

        // Consultar información adicional del artículo desde `InformacionCanastaBasica`
        $stmt = $conn->prepare("SELECT * FROM InformacionCanastaBasica WHERE articulo = :articulo");
        $stmt->execute(['articulo' => $articulo]);
        $info_articulo = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($info_articulo) {
            echo "📌 Información del artículo '$articulo':<br>";
            echo "Categoría: " . $info_articulo['categoria'] . "<br>";
            echo "Descripción: " . $info_articulo['descripcion'] . "<br>";
            echo "Unidad de medida: " . $info_articulo['unidad_medida'] . "<br>";
            echo "Porcentaje de composición: " . $info_articulo['porcentaje_composicion'] . "%<br>";
            echo "Tipo de artículo: " . $info_articulo['tipo_articulo'] . "<br>";
        } else {
            echo "📌 No se encontró información adicional para el artículo '$articulo'.";
        }
        exit();
    }

    // 🔹 Paso 5: Consultar todas las categorías disponibles
    if (preg_match("/categorías de artículos/", $mensaje)) {
        $stmt = $conn->prepare("SELECT DISTINCT categoria FROM InformacionCanastaBasica");
        $stmt->execute();
        $categorias = $stmt->fetchAll(PDO::FETCH_COLUMN);

        if ($categorias) {
            echo "📌 Las categorías disponibles son:<br>";
            foreach ($categorias as $categoria) {
                echo "- " . $categoria . "<br>";
            }
        } else {
            echo "📌 No se encontraron categorías disponibles.";
        }
        exit();
    }

    // 🔹 Paso 6: Consultar cantidad de artículos por categoría
    if (preg_match("/cantidad de artículos en la categoría '([^']+)'/", $mensaje, $match)) {
        $categoria = $match[1];  // La categoría proporcionada

        $stmt = $conn->prepare("SELECT COUNT(*) FROM InformacionCanastaBasica WHERE categoria = :categoria");
        $stmt->execute(['categoria' => $categoria]);
        $cantidad_articulos = $stmt->fetchColumn();

        if ($cantidad_articulos) {
            echo "📌 La cantidad de artículos en la categoría '$categoria' es: $cantidad_articulos.";
        } else {
            echo "📌 No se encontraron artículos en la categoría '$categoria'.";
        }
        exit();
    }

    // 🔹 Paso 7: Consultar unidades de medida disponibles
    if (preg_match("/unidades de medida disponibles/", $mensaje)) {
        $stmt = $conn->prepare("SELECT DISTINCT unidad_medida FROM InformacionCanastaBasica");
        $stmt->execute();
        $unidades = $stmt->fetchAll(PDO::FETCH_COLUMN);

        if ($unidades) {
            echo "📌 Las unidades de medida disponibles son:<br>";
            foreach ($unidades as $unidad) {
                echo "- " . $unidad . "<br>";
            }
        } else {
            echo "📌 No se encontraron unidades de medida disponibles.";
        }
        exit();
    }

    // 🔹 Paso 8: Consultar tipos de artículos disponibles
    if (preg_match("/tipos de artículos disponibles/", $mensaje)) {
        $stmt = $conn->prepare("SELECT DISTINCT tipo_articulo FROM InformacionCanastaBasica");
        $stmt->execute();
        $tipos = $stmt->fetchAll(PDO::FETCH_COLUMN);

        if ($tipos) {
            echo "📌 Los tipos de artículos disponibles son:<br>";
            foreach ($tipos as $tipo) {
                echo "- " . $tipo . "<br>";
            }
        } else {
            echo "📌 No se encontraron tipos de artículos disponibles.";
        }
        exit();
    }

    // 🔹 Paso 9: Consultar información sobre la descripción general de la canasta básica
    if (preg_match("/descripción general de la canasta básica/", $mensaje)) {
        $stmt = $conn->prepare("SELECT descripcion_general FROM canasta_basica_info");
        $stmt->execute();
        $descripcion = $stmt->fetchColumn();

        if ($descripcion) {
            echo "📌 Descripción general de la canasta básica: " . $descripcion;
        } else {
            echo "📌 No se encontró información sobre la descripción general de la canasta básica.";
        }
        exit();
    }

    // 🔹 Paso 10: Consultar el costo promedio de la canasta básica
    if (preg_match("/costo promedio de la canasta básica/", $mensaje)) {
        $stmt = $conn->prepare("SELECT costo_promedio FROM canasta_basica_info");
        $stmt->execute();
        $costo_promedio = $stmt->fetchColumn();

        if ($costo_promedio) {
            echo "📌 El costo promedio de la canasta básica es: $costo_promedio";
        } else {
            echo "📌 No se encontró información sobre el costo promedio de la canasta básica.";
        }
        exit();
    }

    // 🔹 Paso 11: Consultar la variación anual de la canasta básica
    if (preg_match("/variación anual de la canasta básica/", $mensaje)) {
        $stmt = $conn->prepare("SELECT variacion_anual FROM canasta_basica_info");
        $stmt->execute();
        $variacion_anual = $stmt->fetchColumn();

        if ($variacion_anual) {
            echo "📌 La variación anual de la canasta básica es: $variacion_anual%";
        } else {
            echo "📌 No se encontró información sobre la variación anual de la canasta básica.";
        }
        exit();
    }

    echo "🤖 Lo siento, no entiendo tu consulta. ¿Puedes reformularla?";
}
?>
