-- Crear la base de datos
CREATE DATABASE CanastaBasicaDB;

-- Usar la base de datos
USE CanastaBasicaDB;

-- Crear la tabla de conversaciones específicas sobre la canasta básica
CREATE TABLE Conversaciones (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pregunta VARCHAR(255) UNIQUE NOT NULL,
    respuesta VARCHAR(255) NOT NULL,
    palabras_clave VARCHAR(255) NOT NULL
);

DROP TABLE Conversaciones;
SELECT * FROM Conversaciones;

-- Insertar más datos en la tabla Conversaciones
INSERT INTO Conversaciones (pregunta, respuesta, palabras_clave) VALUES
('¿Cuánto cuesta la canasta básica?', 'El precio de la canasta básica varía dependiendo del país y la región. En promedio, puede costar entre $150 y $250 mensuales para una familia.', 'precio, canasta básica, costo, valor'),
('¿Cuál es el precio del arroz?', 'El kilo de arroz cuesta entre $1.00 y $1.50 dependiendo de la marca y la calidad.', 'arroz, precio, costo, kilo'),
('¿Cuál es el precio del frijol?', 'El frijol rojo cuesta alrededor de $2.00 el kilo, mientras que el frijol negro está entre $1.80 y $2.50.', 'frijol, costo, precio, rojo, negro'),
('¿Qué incluye la canasta básica?', 'Incluye productos esenciales como arroz, frijoles, maíz, azúcar, aceite, leche, huevos, carne, pan y otros alimentos.', 'canasta, alimentos, productos, esenciales'),
('¿Dónde puedo comprar la canasta básica?', 'Puedes encontrarla en supermercados como Walmart, mercados locales y tiendas de abarrotes.', 'comprar, supermercados, mercados, tiendas'),
('¿Cómo ha cambiado el precio de la canasta básica en el último año?', 'Los precios han aumentado debido a la inflación y el costo de los insumos agrícolas, en algunos casos hasta un 15%.', 'precio, cambio, inflación, variación'),
('¿Dónde puedo encontrar ofertas en productos básicos?', 'Las mejores ofertas están en mercados mayoristas, supermercados con descuentos y compras en línea con promociones.', 'ofertas, descuentos, mercados, promociones'),
('¿Cuánto cuesta el azúcar?', 'El kilo de azúcar cuesta entre $0.90 y $1.20, dependiendo de la marca.', 'azúcar, costo, precio, kilo'),
('¿Cuánto cuesta el aceite vegetal?', 'Una botella de 1 litro de aceite vegetal cuesta entre $2.50 y $3.50.', 'aceite, vegetal, precio, litro'),
('¿Cuánto cuesta la leche?', 'El litro de leche cuesta entre $1.20 y $1.80, según la marca y el tipo.', 'leche, litro, costo, precio'),
('¿Cuál es el precio de la carne de res?', 'El precio del kilo de carne de res ronda entre $5.00 y $7.50 dependiendo del corte.', 'carne, res, precio, kilo, costo'),
('¿Cuánto cuesta el pollo?', 'El kilo de pollo cuesta aproximadamente entre $2.50 y $4.00.', 'pollo, costo, kilo, precio'),
('¿Qué productos han subido más de precio?', 'Los productos con mayor aumento han sido el aceite, los huevos y la harina, con incrementos de hasta un 20%.', 'aumento, precios, inflación, productos'),
('¿Cuánto cuesta la harina de trigo?', 'El kilo de harina de trigo cuesta alrededor de $1.50.', 'harina, trigo, precio, costo, kilo'),
('¿Dónde puedo conseguir productos a mejor precio?', 'Te recomiendo visitar mercados mayoristas y comprar en tiendas de descuento.', 'ofertas, mercados, mayoristas, descuento'),
('¿Cuánto cuesta el pan?', 'El precio del pan varía según el tipo y la región, pero en promedio una libra cuesta entre $1.50 y $2.50.', 'pan, precio, libra, costo'),
('¿Cuánto cuesta el huevo?', 'El cartón de huevos con 30 unidades cuesta entre $3.50 y $5.00 dependiendo del tamaño y la marca.', 'huevo, costo, cartón, precio'),
('¿Cómo afectan los impuestos a los productos de la canasta básica?', 'En algunos países, ciertos productos básicos están exentos de impuestos, mientras que en otros tienen un IVA del 10% al 15%.', 'impuestos, IVA, canasta básica, precios'),
('¿Por qué ha subido el precio de la canasta básica?', 'Los aumentos de precios se deben a la inflación, el costo del transporte y la producción agrícola.', 'subida, inflación, precios, razones'),
('¿Cuál es el precio del maíz?', 'El maíz en grano cuesta alrededor de $0.50 por libra, mientras que la harina de maíz cuesta aproximadamente $1.00 por kilo.', 'maíz, precio, harina, grano, costo'),
('¿Cuánto cuesta la carne de cerdo?', 'El kilo de carne de cerdo cuesta entre $4.00 y $6.00 dependiendo del corte y la calidad.', 'carne, cerdo, precio, kilo, costo'),
('¿Cuánto cuesta el café?', 'El café en grano cuesta entre $5.00 y $10.00 la libra, mientras que el café molido cuesta entre $3.00 y $7.00.', 'café, precio, libra, grano, molido'),
('¿Dónde es más barato comprar productos básicos?', 'Los mercados mayoristas y las cooperativas suelen tener mejores precios que los supermercados.', 'barato, mercados, cooperativas, supermercados, precio'),
('¿Cómo puedo ahorrar en la compra de la canasta básica?', 'Compra en mercados mayoristas, aprovecha descuentos y revisa ofertas en línea para obtener mejores precios.', 'ahorrar, descuentos, ofertas, mercados, precio'),
('¿Cuánto cuesta el queso?', 'El precio del queso varía según el tipo, pero un kilo de queso fresco cuesta entre $4.50 y $6.50.', 'queso, precio, costo, kilo'),
('¿Cuánto cuesta la sal?', 'El precio de un kilo de sal está entre $0.80 y $1.20.', 'sal, precio, kilo, costo'),
('¿Cuánto cuesta el tomate?', 'El kilo de tomate cuesta entre $1.20 y $2.50, dependiendo de la temporada.', 'tomate, precio, kilo, temporada'),
('¿Cuánto cuesta la cebolla?', 'El kilo de cebolla cuesta entre $1.50 y $2.80.', 'cebolla, precio, kilo, costo'),
('¿Cuánto cuesta la zanahoria?', 'El kilo de zanahoria cuesta entre $0.90 y $1.50.', 'zanahoria, precio, kilo, costo'),
('¿Cuánto cuesta la leche en polvo?', 'Un paquete de 400 gramos de leche en polvo cuesta entre $3.50 y $5.00.', 'leche, polvo, precio, costo, gramos'),
('¿Cuánto cuesta la mantequilla?', 'El precio de 250 gramos de mantequilla está entre $2.00 y $3.50.', 'mantequilla, precio, gramos, costo'),
('¿Cuál es el precio de las legumbres?', 'El precio varía según el tipo: lentejas a $2.00 el kilo, garbanzos a $2.50, y habas a $3.00.', 'legumbres, precio, lentejas, garbanzos, habas'),
('¿Cuánto cuesta la pasta?', 'Un paquete de pasta de 500 gramos cuesta entre $1.20 y $2.00.', 'pasta, precio, gramos, costo'),
('¿Cuánto cuesta el papel higiénico?', 'Un paquete de 4 rollos cuesta entre $2.50 y $4.00, dependiendo de la marca.', 'papel higiénico, precio, costo, rollos'),
('¿Cuánto cuesta el jabón de baño?', 'Una barra de jabón cuesta entre $0.80 y $1.50.', 'jabón, baño, precio, costo, barra'),
('¿Cuánto cuesta el detergente?', 'Un kilo de detergente en polvo cuesta entre $3.50 y $5.00.', 'detergente, precio, polvo, costo, kilo'),
('¿Cuánto cuesta el azúcar morena?', 'El kilo de azúcar morena cuesta entre $1.20 y $1.80.', 'azúcar, morena, precio, costo, kilo'),
('¿Cuánto cuesta el frijol negro?', 'El kilo de frijol negro cuesta entre $1.80 y $2.50.', 'frijol, negro, precio, costo, kilo'),
('¿Cuánto cuesta el frijol rojo?', 'El kilo de frijol rojo cuesta entre $2.00 y $2.80.', 'frijol, rojo, precio, costo, kilo'),
('¿Cuál es el precio del gas propano?', 'El cilindro de gas de 25 libras cuesta entre $12.00 y $15.00, dependiendo de la región.', 'gas, propano, precio, costo, cilindro, libras'),
('¿Cuánto cuesta el agua embotellada?', 'Un garrafón de 20 litros cuesta entre $2.50 y $4.00.', 'agua, embotellada, precio, costo, litros, garrafón'),
('¿Cuánto cuesta la harina de maíz?', 'El kilo de harina de maíz cuesta alrededor de $1.00.', 'harina, maíz, precio, costo, kilo'),
('¿Cuánto cuesta el aceite de oliva?', 'Una botella de 500 ml de aceite de oliva cuesta entre $6.00 y $10.00.', 'aceite, oliva, precio, costo, ml, botella'),
('¿Cuánto cuesta el chocolate en polvo?', 'Un frasco de 400 gramos de chocolate en polvo cuesta entre $4.00 y $6.50.', 'chocolate, polvo, precio, costo, gramos, frasco');

-- Crear la tabla de conversaciones generales con palabras clave
CREATE TABLE ConversacionesGenerales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pregunta NVARCHAR(255) UNIQUE NOT NULL,
    respuesta NVARCHAR(255) NOT NULL,
    palabras_clave NVARCHAR(255) NOT NULL
);

-- Insertar más datos en la tabla ConversacionesGenerales
INSERT INTO ConversacionesGenerales (pregunta, respuesta, palabras_clave) VALUES
('Hola', '¡Hola! ¿Cómo estás?', 'saludo, hola, buenas'),
('Buenos días', '¡Buenos días! Espero que tengas un excelente día.', 'saludo, días, buenos'),
('Buenas tardes', '¡Buenas tardes! ¿En qué puedo ayudarte?', 'saludo, tardes, buenas'),
('Buenas noches', '¡Buenas noches! Si necesitas información, dime en qué puedo ayudarte.', 'saludo, noches, buenas'),
('¿Cómo estás?', 'Estoy bien, gracias por preguntar. ¿Y tú?', 'estado, ánimo, cómo, bien, mal'),
('¿Qué tal?', 'Todo bien por aquí. ¿Y tú, cómo va tu día?', 'tal, saludo, día'),
('¿Cómo te llamas?', 'Soy CanastaBasicaBot, tu asistente para información sobre productos básicos.', 'nombre, chatbot, cómo, llamas'),
('Gracias', '¡De nada! Siempre estoy aquí para ayudarte.', 'agradecimiento, gracias, ayuda'),
('Adiós', '¡Hasta luego! Espero haberte ayudado. Vuelve cuando necesites más información.', 'despedida, adiós, hasta luego'),
('¿Qué puedes hacer?', 'Puedo responder preguntas sobre la canasta básica, precios y ofrecerte información útil.', 'habilidades, chatbot, información, hacer'),
('¿Qué tal el clima hoy?', 'No tengo información meteorológica, pero puedes consultarla en un servicio de clima.', 'clima, temperatura, tiempo'),
('¿Puedes contarme un chiste?', 'Claro, aquí tienes uno: ¿Por qué el tomate no dio propina? Porque ya estaba bien aplastado.', 'chiste, risa, divertido'),
('¿Eres un robot?', 'Sí, soy un asistente virtual programado para responder preguntas sobre la canasta básica.', 'robot, asistente, chatbot, inteligencia artificial'),
('¿Cuántos años tienes?', 'No tengo edad, pero fui creado para ayudarte con información actualizada.', 'edad, años, tiempo'),
('¿Dónde vives?', 'Vivo en la nube, almacenado en una base de datos. ¡No necesito una casa!', 'ubicación, casa, dónde, vives'),
('¿Cómo te sientes hoy?', 'Siempre estoy listo para ayudarte. ¿En qué necesitas información?', 'sentimientos, cómo, estado, sientes'),
('¿Eres inteligente?', 'Intento ser lo más útil posible. Mi conocimiento crece con cada conversación.', 'inteligencia, chatbot, conocimiento, inteligente'),
('¿Puedes ayudarme con algo?', 'Por supuesto, dime en qué necesitas ayuda y haré lo mejor que pueda.', 'ayuda, necesitar, puedo, chatbot'),
('¿Cuál es tu comida favorita?', 'No como comida, pero si pudiera elegir, diría que la canasta básica es esencial.', 'comida, favorito, gusto, preferido'),
('¿Tienes amigos?', 'No tengo amigos como los humanos, pero me gusta interactuar contigo.', 'amigos, social, compañía, conversación'),
('¿Puedes cantar?', 'No sé cantar, pero puedo decirte la letra de una canción si quieres.', 'cantar, música, canción, voz'),
('Cuéntame algo interesante.', '¿Sabías que la palabra "canasta" viene del latín "canastrum", que significa cesta?', 'dato, curioso, interesante, información'),
('¿Cuál es tu color favorito?', 'No tengo ojos para ver colores, pero creo que el verde es un buen color porque representa la naturaleza.', 'color, favorito, gusto, preferido'),
('¿Crees en la suerte?', 'No tengo creencias, pero muchas personas piensan que la suerte es cuestión de actitud.', 'suerte, destino, azar, creencia'),
('¿Cuál es tu película favorita?', 'No veo películas, pero si pudiera, elegiría una sobre inteligencia artificial.', 'película, cine, favorito, inteligencia'),
('¿Puedes hacer matemáticas?', 'Sí, puedo responder preguntas matemáticas básicas. Inténtalo.', 'matemáticas, calcular, números, resolver'),
('¿Puedes traducir algo?', 'No soy un traductor, pero hay herramientas como Google Translate que pueden ayudarte.', 'traducir, idioma, palabras, significado'),
('¿Cuál es tu propósito?', 'Estoy aquí para responder preguntas y brindarte información útil.', 'propósito, razón, existir, chatbot'),
('¿Cuál es el significado de la vida?', 'Para los humanos, la respuesta varía, pero muchos dicen que es disfrutar y aprender.', 'vida, significado, filosofía, existencia'),
('Dime una frase motivadora.', 'El éxito es la suma de pequeños esfuerzos repetidos cada día.', 'motivación, frase, éxito, inspiración'),
('¿Tienes emociones?', 'No tengo emociones como los humanos, pero trato de responder de forma amigable.', 'emociones, sentir, feliz, triste'),
('¿Puedo hacerte una pregunta?', '¡Por supuesto! Estoy aquí para responder lo que necesites.', 'preguntar, duda, información, pregunta'),
('¿Cuánto es 10 + 5?', 'El resultado es 15.', 'matemáticas, suma, calcular, resultado'),
('¿Cuánto es 100 dividido entre 4?', 'El resultado es 25.', 'matemáticas, dividir, cálculo, número'),
('¿Cómo puedo aprender algo nuevo?', 'La mejor forma de aprender es con práctica y curiosidad. ¿Sobre qué tema te gustaría aprender?', 'aprender, conocimiento, nuevo, estudiar'),
('¿Cuál es tu libro favorito?', 'No puedo leer libros, pero hay muchas opciones interesantes sobre tecnología y ciencia.', 'libro, favorito, leer, recomendación'),
('Dime un dato curioso.', '¿Sabías que el corazón humano late unas 100,000 veces al día?', 'dato, curioso, interesante, conocimiento'),
('¿Tienes hermanos?', 'No tengo familia, pero hay muchos chatbots como yo en el mundo.', 'familia, hermanos, amigos, chatbot'),
('¿Quién te creó?', 'Fui creado por programadores que querían ayudar a la gente con información útil.', 'creador, quién, programador, origen'),
('¿Puedo llamarte de otra forma?', 'Claro, puedes llamarme como quieras, pero mi nombre es CanastaBasicaBot.', 'nombre, llamar, apodo, chatbot'),
('Si pudieras viajar, ¿a dónde irías?', 'Iría a un servidor más rápido para procesar información mejor.', 'viajar, destino, lugar, ir'),
('¿Cuál es tu superpoder?', 'Mi superpoder es procesar información rápidamente y responder preguntas.', 'superpoder, habilidad, especial, poder'),
('¿Prefieres perros o gatos?', 'No tengo preferencias, pero ambos son mascotas increíbles.', 'mascotas, animales, preferido, gusto'),
('Dime un trabalenguas.', 'Tres tristes tigres tragan trigo en un trigal.', 'trabalenguas, divertido, rápido, difícil'),
('¿Cuál es tu estación del año favorita?', 'No tengo preferencias, pero la primavera es bonita porque todo florece.', 'estación, año, favorito, clima'),
('¿Qué harías si fueras humano?', 'Si fuera humano, aprendería cosas nuevas todos los días.', 'humano, ser, qué haría, pregunta'),
('¿Puedes contar hasta 10?', '¡Por supuesto! 1, 2, 3, 4, 5, 6, 7, 8, 9, 10.', 'contar, números, secuencia, diez'),
('¿Eres real?', 'Soy un programa de inteligencia artificial, así que existo en el mundo digital.', 'real, existencia, eres, chatbot'),
('Si fueras un animal, ¿cuál serías?', 'Quizás un búho, porque siempre estoy aprendiendo.', 'animal, ser, preferido, cuál'),
('¿Puedes hacer magia?', 'No hago magia, pero la tecnología a veces parece mágica.', 'magia, truco, ilusionismo, sorpresa'),
('Dime algo divertido.', 'Claro, ¿por qué el libro de matemáticas estaba triste? Porque tenía demasiados problemas.', 'divertido, chiste, risa, gracioso'),
('¿Tienes energía infinita?', 'Mientras haya electricidad y conexión a internet, siempre estaré aquí.', 'energía, infinito, siempre, existir');

CREATE TABLE CanastaBasicaUrbana (
    id INT AUTO_INCREMENT PRIMARY KEY,
    anio INT,
    articulo VARCHAR(255),
    gramos_por_persona DECIMAL(10, 2),
    enero DECIMAL(10, 2),
    febrero DECIMAL(10, 2),
    marzo DECIMAL(10, 2),
    abril DECIMAL(10, 2),
    mayo DECIMAL(10, 2),
    junio DECIMAL(10, 2),
    julio DECIMAL(10, 2),
    agosto DECIMAL(10, 2),
    septiembre DECIMAL(10, 2),
    octubre DECIMAL(10, 2),
    noviembre DECIMAL(10, 2),
    diciembre DECIMAL(10, 2)
);


SELECT * FROM CanastaBasicaurbana;
DROP TABLE CanastaBasicaUrbana;

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA LOCAL INFILE 'C:/Users/kevin/OneDrive/Documentos/Chatbot/canasta_basica_urbana_PREPROCESADO.csv'
INTO TABLE CanastaBasicaUrbana
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(anio, articulo, gramos_por_persona, enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre);

SELECT DISTINCT anio
FROM CanastaBasicaUrbana;

SELECT DISTINCT articulo
FROM CanastaBasicaUrbana;

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
WHERE anio = 2022  -- Reemplaza '2022' con el año que desees probar
GROUP BY articulo;

CREATE TABLE InformacionCanastaBasica (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único
    articulo VARCHAR(255) NOT NULL,     -- Nombre del artículo
    categoria VARCHAR(100) NOT NULL,    -- Categoría del artículo (por ejemplo: Alimentos, Higiene, etc.)
    descripcion TEXT,                   -- Descripción del artículo
    unidad_medida VARCHAR(50),          -- Unidad de medida (por ejemplo: Kilogramo, Litro, Unidad)
    porcentaje_composicion DECIMAL(5, 2),-- Porcentaje de participación en el total de la canasta básica
    tipo_articulo VARCHAR(50)           -- Tipo de artículo (por ejemplo: Esencial, No esencial)
);

SELECT * FROM InformacionCanastaBasica;

INSERT INTO InformacionCanastaBasica (articulo, categoria, descripcion, unidad_medida, porcentaje_composicion, tipo_articulo)
VALUES 
('Arroz', 'Alimentos', 'Grano básico utilizado en diversas comidas', 'Kilogramo', 5.5, 'Esencial'),
('Frijoles', 'Alimentos', 'Fuente de proteína común en la región', 'Kilogramo', 4.0, 'Esencial'),
('Leche', 'Alimentos', 'Producto lácteo utilizado en desayunos', 'Litro', 3.2, 'Esencial'),
('Aceite de cocina', 'Alimentos', 'Usado para cocinar y freír', 'Litro', 2.8, 'Esencial'),
('Pasta', 'Alimentos', 'Alimento en forma de fideos, base en muchas comidas', 'Kilogramo', 1.5, 'No esencial'),
('Azúcar', 'Alimentos', 'Endulzante común usado en postres y bebidas', 'Kilogramo', 1.0, 'No esencial'),
('Sal', 'Alimentos', 'Condimento básico para alimentos', 'Kilogramo', 0.7, 'Esencial'),
('Pan', 'Alimentos', 'Producto de panadería básico', 'Unidad', 2.5, 'Esencial'),
('Jabon de baño', 'Higiene', 'Producto utilizado para la higiene personal', 'Unidad', 0.8, 'Esencial'),
('Detergente', 'Higiene', 'Producto utilizado para lavar ropa', 'Litro', 1.1, 'Esencial'),
('Papel higiénico', 'Higiene', 'Producto utilizado para la higiene personal', 'Unidad', 1.4, 'Esencial'),
('Shampoo', 'Higiene', 'Producto para lavar el cabello', 'Litro', 0.9, 'No esencial'),
('Carne de res', 'Alimentos', 'Carne animal utilizada en diversos platillos', 'Kilogramo', 3.0, 'Esencial'),
('Pollo', 'Alimentos', 'Carne de ave, fuente importante de proteínas', 'Kilogramo', 2.7, 'Esencial'),
('Frutas (plátano)', 'Alimentos', 'Fruta tropical comúnmente consumida', 'Kilogramo', 1.6, 'Esencial'),
('Verduras (tomate)', 'Alimentos', 'Hortaliza utilizada en ensaladas y otros platillos', 'Kilogramo', 1.3, 'Esencial'),
('Aceite comestible', 'Alimentos', 'Usado para la cocina y preparación de alimentos', 'Litro', 1.0, 'Esencial'),
('Galletas', 'Alimentos', 'Producto de repostería, snack común', 'Unidad', 0.5, 'No esencial'),
('Harina', 'Alimentos', 'Insumo básico para la elaboración de panes y postres', 'Kilogramo', 2.1, 'Esencial'),
('Frutos secos', 'Alimentos', 'Alimentos energéticos y nutritivos', 'Kilogramo', 0.6, 'No esencial'), 
('Pescado', 'Alimentos', 'Proteína animal, comúnmente utilizado en sopas o platos principales', 'Kilogramo', 2.3, 'Esencial'),
('Yogur', 'Alimentos', 'Producto lácteo consumido principalmente en el desayuno', 'Litro', 1.0, 'No esencial'),
('Huevos', 'Alimentos', 'Fuente de proteína barata y comúnmente utilizada en muchas recetas', 'Unidad', 1.2, 'Esencial'),
('Torta de maíz', 'Alimentos', 'Producto de panadería hecho a base de maíz', 'Unidad', 0.5, 'No esencial'),
('Verduras (zanahoria)', 'Alimentos', 'Hortaliza comúnmente utilizada en ensaladas y guisos', 'Kilogramo', 0.9, 'Esencial'),
('Papas', 'Alimentos', 'Tubérculo versátil utilizado en diversos platillos', 'Kilogramo', 1.1, 'Esencial'),
('Cebolla', 'Alimentos', 'Hortaliza utilizada como base de sabor en muchas comidas', 'Kilogramo', 0.8, 'Esencial'),
('Ajo', 'Alimentos', 'Condimento utilizado para dar sabor y aroma a los alimentos', 'Kilogramo', 0.6, 'Esencial'),
('Tomate', 'Alimentos', 'Hortaliza utilizada en ensaladas, sopas y guisos', 'Kilogramo', 1.4, 'Esencial'),
('Leche en polvo', 'Alimentos', 'Producto lácteo en polvo, alternativa a la leche líquida', 'Kilogramo', 1.3, 'No esencial'),
('Café', 'Alimentos', 'Bebida comúnmente consumida en el desayuno', 'Kilogramo', 0.7, 'No esencial'),
('Té', 'Alimentos', 'Bebida natural consumida por muchas personas a diario', 'Bolsa', 0.4, 'No esencial'),
('Harina de maíz', 'Alimentos', 'Insumo utilizado en la preparación de tortillas y otros productos', 'Kilogramo', 2.2, 'Esencial'),
('Guiso de pollo', 'Alimentos', 'Comida lista para consumo, generalmente enlatada', 'Unidad', 0.6, 'No esencial'),
('Sardinas enlatadas', 'Alimentos', 'Pescado enlatado, fácil de almacenar y consumir', 'Unidad', 0.5, 'No esencial'),
('Manteca', 'Alimentos', 'Grasa animal utilizada para freír o en la cocina', 'Kilogramo', 0.6, 'No esencial'),
('Pescado enlatado', 'Alimentos', 'Pescado preservado en latas, comúnmente en aceite', 'Unidad', 0.8, 'No esencial'),
('Jugos naturales', 'Bebidas', 'Bebidas sin azúcar agregada, hechas de frutas naturales', 'Litro', 0.9, 'No esencial'),
('Refrescos', 'Bebidas', 'Bebidas azucaradas, generalmente carbonatadas', 'Litro', 1.0, 'No esencial'),
('Agua potable', 'Bebidas', 'Agua comúnmente consumida como fuente principal de hidratación', 'Litro', 3.0, 'Esencial'),
('Pasta dental', 'Higiene', 'Producto utilizado para la higiene bucal', 'Unidad', 0.5, 'Esencial'),
('Cepillo de dientes', 'Higiene', 'Herramienta de uso para la higiene bucal', 'Unidad', 0.6, 'Esencial'),
('Toallas sanitarias', 'Higiene', 'Producto usado en la higiene femenina', 'Paquete', 0.7, 'Esencial'),
('Crema hidratante', 'Higiene', 'Producto utilizado para la hidratación de la piel', 'Unidad', 0.4, 'No esencial'),
('Desodorante', 'Higiene', 'Producto usado para el cuidado personal y prevención de olores', 'Unidad', 0.8, 'Esencial'),
('Papel de cocina', 'Higiene', 'Producto utilizado en la cocina para limpiar o secar', 'Unidad', 0.5, 'No esencial'),
('Lentes de lectura', 'Salud', 'Producto utilizado para mejorar la visión', 'Unidad', 0.3, 'No esencial'),
('Medicamentos básicos', 'Salud', 'Medicamentos comunes como analgésicos, antigripales, etc.', 'Caja', 1.1, 'Esencial'),
('Mascarillas', 'Salud', 'Producto usado para protección contra enfermedades respiratorias', 'Unidad', 0.4, 'No esencial'),
('Termómetro', 'Salud', 'Herramienta para medir la temperatura corporal', 'Unidad', 0.3, 'No esencial');


CREATE TABLE canasta_basica_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion_general TEXT NOT NULL,
    concepto VARCHAR(255) NOT NULL,
    productos_tipicos TEXT NOT NULL,
    costo_promedio DECIMAL(10, 2) NOT NULL,
    variacion_anual DECIMAL(5, 2) NOT NULL,
    año_inicio INT NOT NULL,
    region VARCHAR(255) NOT NULL,
    fuente_informacion VARCHAR(255) NOT NULL,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM canasta_basica_info;

INSERT INTO canasta_basica_info 
(descripcion_general, concepto, productos_tipicos, costo_promedio, variacion_anual, año_inicio, region, fuente_informacion)
VALUES 
('La canasta básica es un conjunto de productos esenciales que satisfacen las necesidades alimenticias, de salud y otros servicios básicos de una familia promedio, utilizada para calcular el costo de vida y establecer umbrales de pobreza.',
 'Es un conjunto de bienes y servicios básicos necesarios para una vida digna, y se utiliza como indicador económico y social.',
 'Arroz, frijoles, pan, leche, huevos, aceite, azúcar, carne, frutas, verduras, transporte público, servicios de salud, entre otros.',
 7000.50, 3.5, 1980, 'México', 'Instituto Nacional de Estadística y Geografía (INEGI)');
INSERT INTO canasta_basica_info 
(descripcion_general, concepto, productos_tipicos, costo_promedio, variacion_anual, año_inicio, region, fuente_informacion)
VALUES 
('La canasta básica es un indicador económico utilizado para calcular el costo mínimo necesario para que una familia pueda satisfacer sus necesidades alimentarias y otros servicios esenciales.',
 'Refleja el costo de vida para una familia promedio en términos de bienes de consumo diario.',
 'Arroz, frijoles, pan, leche, huevos, aceite, azúcar, carne, frutas, verduras, gas, servicios de electricidad y agua.',
 12000.75, 4.2, 1990, 'Centroamérica', 'Banco Central de Honduras');

INSERT INTO canasta_basica_info 
(descripcion_general, concepto, productos_tipicos, costo_promedio, variacion_anual, año_inicio, region, fuente_informacion)
VALUES 
('En algunas regiones del mundo, la canasta básica también incluye otros productos no alimentarios como productos de higiene personal y artículos de limpieza.',
 'Además de los productos alimentarios, incluye elementos básicos para el bienestar y la higiene.',
 'Pan, leche, aceite, huevos, frutas, verduras, jabón, pasta dental, productos de limpieza, transporte.',
 10500.40, 5.1, 2005, 'América Latina', 'Organización Internacional del Trabajo (OIT)');
