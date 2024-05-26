
DROP DATABASE if exists restaurante; -- en caso de que la base de datos exista, la elimina
CREATE DATABASE restaurante; -- crea la base de datos 

USE restaurante; -- selecciona la base de datos con la que vamos a trabajar

-- creamos las tablas de la base de datos restaurante

CREATE TABLE clientes ( 
	id_clientes INT NOT NULL PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL, 
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(45),
    fecha_nacimiento datetime
);

ALTER TABLE clientes
MODIFY COLUMN id_clientes INT AUTO_INCREMENT;

ALTER TABLE clientes
MODIFY COLUMN fecha_nacimiento DATE;  
    
CREATE TABLE mesas (
	id_mesas INT auto_increment NOT NULL PRIMARY KEY,
    capacidad_pax INT,
    estado_mesas VARCHAR (50), -- indica si la mesa está libre, ocupada o sucia.
    ubicacion VARCHAR (50)
);

CREATE TABLE reservas (
	id_reservas INT NOT NULL auto_increment PRIMARY KEY,
	hora TIME NOT NULL,
    fecha DATE NOT NULL,
    cantidad_pax VARCHAR(50),
    id_mesas INT, 
    id_clientes INT,
    foreign key (id_mesas) references mesas (id_mesas),
    foreign key (id_clientes) references clientes (id_clientes)
);

ALTER TABLE reservas
ADD CONSTRAINT fk_mesas_reservas FOREIGN KEY (id_mesas) REFERENCES mesas(id_mesas) ON DELETE CASCADE,
ADD CONSTRAINT fk_clientes_reservas FOREIGN KEY (id_clientes) REFERENCES clientes(id_clientes) ON DELETE CASCADE;



CREATE TABLE comandas (
	id_comandas INT NOT NULL PRIMARY KEY,
    hora TIME NOT NULL,
    fecha DATE NOT NULL,
    detalle TEXT NOT NULL,
    observaciones TEXT, -- indica pedidos especiales de clientes, como el punto de una carne, alergias, menú vegano/sin tacc, etc.
    id_clientes INT,
    id_mesas INT,
    FOREIGN KEY (id_clientes) REFERENCES clientes (id_clientes),
    FOREIGN KEY (id_mesas) REFERENCES mesas (id_mesas)
);

-- eliminamos la columna "observaciones" y "detalle" de la tabla "comandas", que pasarán a estar en la tabla "detalle_comandas" 
-- que crearemos después de la tabla menu y todas la que referencian a la misma.
ALTER TABLE comandas
DROP observaciones;

ALTER TABLE comandas
DROP detalle;


CREATE TABLE menu (
	id_menu INT auto_increment PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100),
    precio INT,
    tipo VARCHAR (50), -- indica si es un menú de pasos (pudiendo ser de 3, 5 o 7 pasos)
    tiempo_elaboracion TIME,
    id_comandas INT,
    FOREIGN KEY (id_comandas) REFERENCES comandas (id_comandas)
);

-- eliminamos la columna "tiempo_elaboracion", porque utilizaremos una funcion para calcularlo en base a cada plato y postre,
-- de esta manera evitamos tener que actualizar manualmente los tiempos de elaboración de cada menú en caso de quitar o modificar platos.

ALTER TABLE menu
DROP tiempo_elaboracion;

CREATE TABLE platos(
	id_platos INT auto_increment NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR (100),
    categoria VARCHAR (50),
    tiempo_preparacion TIME,
    disponible TINYINT, -- indica disponibilidad en el menú
    id_menu INT,
    FOREIGN KEY (id_menu) REFERENCES menu (id_menu)
);

-- agregamos la columna "precio" a la tabla "platos"
ALTER TABLE platos
ADD precio DECIMAL(10, 2) NOT NULL;

CREATE TABLE bebidas(
	id_bebidas INT auto_increment NOT NULL PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(100),
    categoria VARCHAR(50), 
    disponible TINYINT,
    id_menu INT,
    FOREIGN KEY (id_menu) REFERENCES menu (id_menu)
);

-- agregamos la columna "precio" a la tabla "bebidas" 
ALTER TABLE bebidas
ADD precio DECIMAL(10, 2) NOT NULL;
 

CREATE TABLE postres (
	id_postres INT NOT NULL auto_increment PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(100),
    disponible TINYINT,
    id_menu INT, 
    FOREIGN KEY (id_menu) REFERENCES menu (id_menu)
);

-- agregamos la columna "categoria" a la tabla "postres".
ALTER TABLE postres
ADD categoria VARCHAR(50);

-- agregamos la columna "tiempo_preparacion" a la tabla "postres", necesario para la funcion "tiempo_menu_pasos"
ALTER TABLE postres
ADD tiempo_preparacion TIME;

ALTER TABLE postres
ADD precio DECIMAL (10,2) NOT NULL;

-- creamos la tabla "detalles_comandas" que normaliza los datos de las tablas "comandas" y "menu" para 
-- facilitar el manejo de la tabla "facturas_clientes".

CREATE TABLE detalle_comandas (
    id_detalle_comandas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_comandas INT NOT NULL,
    id_platos INT,
    id_bebidas INT,
    id_menu INT,
    cantidad INT NOT NULL,
    observaciones TEXT, -- para especificaciones de los clientes/ pedidos especiales.
    FOREIGN KEY (id_comandas) REFERENCES comandas(id_comandas),
    FOREIGN KEY (id_platos) REFERENCES platos(id_platos),
    FOREIGN KEY (id_bebidas) REFERENCES bebidas(id_bebidas),
    FOREIGN KEY (id_menu) REFERENCES menu (id_menu)
);
-- elimiamos la coljumna cantidades, para luego crear columnas específicas de cantidad por plato, bebidas y postres.
ALTER TABLE detalle_comandas
DROP cantidad;

ALTER TABLE detalle_comandas
ADD id_postres INT;
-- agregamos id_postres que no se incluyó en la tabla.
ALTER TABLE detalle_comandas
ADD FOREIGN KEY (id_postres) REFERENCES postres(id_postres);

ALTER TABLE detalle_comandas
ADD cantidad_platos INT;

ALTER TABLE detalle_comandas
ADD cantidad_bebidas INT;

ALTER TABLE detalle_comandas
ADD cantidad_postres INT;

<<<<<<< HEAD
=======
DESCRIBE detalle_comandas;
>>>>>>> db72259acbfc7b36236e82a167768894ceb36e53


CREATE TABLE facturas_clientes (
	id_facturas INT NOT NULL auto_increment PRIMARY KEY,
    monto_total INT,
    detalle TEXT NOT NULL,
    id_clientes INT,
    id_comandas INT, 
    FOREIGN KEY (id_clientes) REFERENCES clientes (id_clientes),
    FOREIGN KEY (id_comandas) REFERENCES comandas (id_comandas)
);

-- eliminamos la columna detalles de la tabla "facturas_clientes" para utilizarla
-- en una nueva tabla "detalle_facturas_clientes"

ALTER TABLE facturas_clientes
DROP detalle;

-- agregamos la columna "fecha" a la tabla "facturas_clientes"
ALTER TABLE facturas_clientes
ADD fecha DATE;

-- agregamos la columna "pagadas" a "facturas_clientes"

ALTER TABLE facturas_clientes
ADD pagada TINYINT NOT NULL DEFAULT 0;


CREATE TABLE detalle_facturas_clientes (
    id_clientes INT NULL,
    id_facturas INT NOT NULL,
    id_detalle_comandas INT NOT NULL,
    FOREIGN KEY (id_clientes) REFERENCES clientes (id_clientes),
    FOREIGN KEY (id_facturas) REFERENCES facturas_clientes (id_facturas),
    FOREIGN KEY (id_detalle_comandas) REFERENCES detalle_comandas (id_detalle_comandas)
);



CREATE TABLE encuestas_satisfaccion (
	id_encuestas INT auto_increment primary key,
    comentarios TEXT,
    fecha DATE,
    hora TIME, 
    id_clientes INT,
    FOREIGN KEY (id_clientes) REFERENCES clientes (id_clientes)
);


CREATE TABLE proveedores (
	id_proveedores INT not null auto_increment PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    telefono VARCHAR (15) NOT NULL,
    direccion VARCHAR (50)
);

CREATE TABLE pedidos_proveedores(
	id_pedidos_proveedores INT not null auto_increment PRIMARY KEY,
    detalle TEXT NOT NULL,
    fecha DATE NOT NULL,
    id_proveedores INT,
    FOREIGN KEY (id_proveedores) REFERENCES proveedores (id_proveedores)
);

-- creamos la tabla "detalle_pedidos_proveedores" para almacenar el detalle de los pedidos 

CREATE TABLE detalle_pedidos_proveedores(
	id_detalle INT NOT NULL auto_increment PRIMARY KEY,
	id_proveedores INT NOT NULL,
    id_pedidos_proveedores INT NOT NULL,
    productos TEXT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_proveedores) REFERENCES proveedores (id_proveedores),
    FOREIGN KEY (id_pedidos_proveedores) REFERENCES pedidos_proveedores (id_pedidos_proveedores)
);


CREATE TABLE facturas_proveedores(
	id_facturas_proveedores INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    detalle TEXT,
    fecha DATE,
    monto INT,
    id_proveedores INT,
	id_pedidos_proveedores INT,
    FOREIGN KEY (id_proveedores) REFERENCES proveedores(id_proveedores),
    FOREIGN KEY (id_pedidos_proveedores) REFERENCES pedidos_proveedores (id_pedidos_proveedores)
); 

-- creamos la tabla "detalle_facturas_proveedores" para almacenar el detalle de las mismas.

CREATE TABLE detalle_facturas_proveedores(
    id_detalle INT auto_increment PRIMARY KEY,
    id_facturas_proveedores INT NOT NULL,
    productos TEXT,
    cantidad INT,
    precio INT,
    FOREIGN KEY (id_facturas_proveedores) REFERENCES facturas_proveedores (id_facturas_proveedores)
);

CREATE TABLE empleados (
	id_empleados INT auto_increment NOT NULL PRIMARY KEY,
    nombre VARCHAR (50),
    apellido VARCHAR(50),
    fecha_nacimiento DATE NOT NULL,
    tipo_documento VARCHAR(15) NOT NULL,
    numero_documento INT NOT NULL,
    direccion VARCHAR (100),
    email VARCHAR (50),
    telefono VARCHAR (15),
    fecha_contratacion DATE NOT NULL,
    puesto VARCHAR (50) NOT NULL,
    alergias TEXT
);

CREATE TABLE turnos_empleados (
	id_turnos INT auto_increment NOT NULL PRIMARY KEY,
    tipo VARCHAR (50), -- indica si es turno de mañana o tarde
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    puesto VARCHAR (50) NOT NULL,
    observaciones VARCHAR (50), 
    id_empleados INT,
    FOREIGN KEY (id_empleados) REFERENCES empleados (id_empleados)
);


CREATE TABLE empleados_despedidos (
	id_empleados_despedidos INT NOT NULL auto_increment PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_contratacion DATE NOT NULL,
    fecha_despido DATE NOT NULL,
    motivo_despido TEXT NOT NULL,
    puesto VARCHAR(45),
    id_empleados INT,
    FOREIGN KEY (id_empleados) REFERENCES empleados (id_empleados)
);


CREATE TABLE ventas (
    id_ventas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL
);

<<<<<<< HEAD

=======
>>>>>>> db72259acbfc7b36236e82a167768894ceb36e53
CREATE TABLE detalle_ventas (
    id_detalle INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_ventas INT NOT NULL,
    id_platos INT,
    id_bebidas INT,
    id_postres INT,
    id_menu INT,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_ventas) REFERENCES ventas(id_ventas),
    FOREIGN KEY (id_platos) REFERENCES platos(id_platos),
    FOREIGN KEY (id_bebidas) REFERENCES bebidas(id_bebidas),
    FOREIGN KEY (id_postres) REFERENCES postres(id_postres),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);

<<<<<<< HEAD
ALTER TABLE detalle_ventas
DROP cantidad;

ALTER TABLE detalle_ventas
ADD CONSTRAINT fk_detalle_comandas_detalle_ventas_platos FOREIGN KEY (id_platos) REFERENCES detalle_comandas(id_platos),
ADD CONSTRAINT fk_detalle_comandas_detalle_ventas_bebidas FOREIGN KEY (id_bebidas) REFERENCES detalle_comandas(id_bebidas),
ADD CONSTRAINT fk_detalle_comandas_detalle_ventas_postres FOREIGN KEY (id_postres) REFERENCES detalle_comandas(id_postres),
ADD CONSTRAINT fk_detalle_comandas_detalle_ventas_menu FOREIGN KEY (id_menu) REFERENCES detalle_comandas(id_menu);

-- Eliminar la tabla detalle_ventas si existe
DROP TABLE IF EXISTS detalle_ventas;

-- Crear la tabla detalle_ventas desde cero con todas las restricciones
CREATE TABLE detalle_ventas (
    id_detalle INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_ventas INT NOT NULL,
    id_platos INT,
    id_bebidas INT,
    id_postres INT,
    id_menu INT,
    cantidad_platos_vendidos INT,
    cantidad_bebidas_vendidas INT,
    cantidad_postres_vendidos INT,
    cantidad_menu_pasos_vendidos INT,
    FOREIGN KEY (id_ventas) REFERENCES ventas(id_ventas),
    FOREIGN KEY (id_platos) REFERENCES platos(id_platos),
    FOREIGN KEY (id_bebidas) REFERENCES bebidas(id_bebidas),
    FOREIGN KEY (id_postres) REFERENCES postres(id_postres),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    CONSTRAINT fk_detalle_comandas_detalle_ventas_platos FOREIGN KEY (id_platos) REFERENCES detalle_comandas(id_platos),
    CONSTRAINT fk_detalle_comandas_detalle_ventas_bebidas FOREIGN KEY (id_bebidas) REFERENCES detalle_comandas(id_bebidas),
    CONSTRAINT fk_detalle_comandas_detalle_ventas_postres FOREIGN KEY (id_postres) REFERENCES detalle_comandas(id_postres),
    CONSTRAINT fk_detalle_comandas_detalle_ventas_menu FOREIGN KEY (id_menu) REFERENCES detalle_comandas(id_menu)
);
=======


-- inserción de datos para las tablas platos y postres.

INSERT INTO platos (nombre, descripcion, categoria, tiempo_preparacion, disponible, precio)
VALUES ('Gazpacho', 'Sopa fría de tomates de estación con pesto albahaca.', 'entrada', '00:05:00', '1', '9.99');

INSERT INTO platos (nombre, descripcion, categoria, tiempo_preparacion, disponible, precio)
VALUES ('Langostinos Jumbo', 'Langostinos en salsa vasca, cítrica a base de mariscos.', 'entrada', '00:10:00', '1', '14.99');

INSERT INTO platos (nombre, descripcion, categoria, tiempo_preparacion, disponible, precio)
VALUES ('Taco filet con salsa de vino', 'Acompañado de verduras de estación, con salsa de vino y frutos rojos.', 'principal', '00:15:00', '1', '19.99');

INSERT INTO platos (nombre, descripcion, categoria, tiempo_preparacion, disponible, precio)
VALUES ('Rack cordero con espuma de berenjena', 'En su fondo de cocción, acompañado de liso de berenjena', 'principal', '00:15:00', '1', 19.99);

INSERT INTO platos (nombre, descripcion, categoria, tiempo_preparacion, disponible, precio)
VALUES ('Rotolo de espinaca', 'Pasta rellena de espinaca, con salsa de queso azul.', 'principal', '00:15:00', '1', '17.99');

INSERT INTO postres (nombre, descripcion, categoria, tiempo_preparacion, disponible, precio)
VALUES ('Panqueques frambeados', 'Rellenos de dulce de leche.', 'postre', '00:05:00', '1', '7.99');

INSERT INTO postres (nombre, descripcion, categoria, tiempo_preparacion, disponible, precio)
VALUES ('Nemesis', 'Lingote de chocolate semi amargo, con salsa de frutillas y frutos secos crocantes.', 'postre', '00:05:00', '1', '8.99');

INSERT INTO bebidas (nombre, descripcion, categoria, disponible, precio)
VALUES ('Refresco de limón', 'Refresco natural de limón.', 'Bebida', 1, 2.50),
       ('Café Americano', 'Café negro americano.', 'Bebida', 1, 1.75),
       ('Jugo de naranja', 'Jugo natural de naranja.', 'Bebida', 1, 3.00),
       ('Agua mineral', 'Agua mineral sin gas.', 'Bebida', 1, 1.00),
       ('Vino tinto', 'Vino tinto de la casa.', 'Bebida', 1, 5.00);


-- Insert de datos en la tabla clientes.
INSERT INTO clientes (nombre, apellido, telefono, email, fecha_nacimiento)
VALUES ('María', 'Gómez', '987654321', 'maria@example.com','1990-03-15'),
       ('Carlos', 'López', '564738291', 'carlos@example.com', '1985-07-21'),
       ('Ana', 'Martínez', '654987321', 'ana@example.com', '1988-11-10'),
       ('Pedro', 'Díaz', '789456123', 'pedro@example.com', '1979-05-03'),
       ('Laura', 'Rodríguez', '321654987', 'laura@example.com', '1995-09-28'),
       ('Juan', 'Perez', '123456789', 'juan@example.com', '1982-02-17'),
       ('Luis', 'García', '456789123', 'luis@example.com', '1993-08-05'),
       ('Sofía', 'Fernández', '987654321', 'sofia@example.com', '1987-12-30'),
       ('Marcela', 'López', '789123456', 'marcela@example.com', '1980-04-12'),
       ('Ricardo', 'Martínez', '654321987', 'ricardo@example.com', '1975-11-25'),
       ('Elena', 'González', '159487263', 'elena@example.com', '1991-06-18'),
       ('Gabriel', 'Díaz', '852963741', 'gabriel@example.com', '1983-09-07'),
       ('Alejandra', 'Torres', '369852147', 'alejandra@example.com', '1989-02-14'),
       ('Daniel', 'Sánchez', '258147369', 'daniel@example.com', '1978-07-23'),
       ('Carmen', 'Ruiz', '741852963', 'carmen@example.com', '1996-03-29');
            
           

-- Insert de datos en la tabla mesas.

INSERT INTO mesas (id_mesas, capacidad_pax, estado_mesas, ubicacion)
VALUES ('1', '2', 'libre', 'salón'),
       ('2', '2', 'libre', 'salón'),
       ('3', '2', 'libre', 'salón'),
       ('4', '2', 'libre', 'salón'),
       ('5', '4', 'libre', 'salón'),
       ('6', '4', 'libre', 'salón'),
       ('7', '2', 'libre', 'deck'),
       ('8', '4', 'libre', 'deck'),
       ('9', '6', 'libre', 'salón'),
       ('10', '8', 'libre', 'salón'),
       ('11', '6', 'libre', 'deck');


 
-- Insert de datos en la tabla reservas.
INSERT INTO reservas (fecha, cantidad_pax, hora, id_mesas)
VALUES 	('2024-05-17', 2, '12:30:00','1'),
		('2024-05-20', 3, '11:30:00', '5'),
		('2024-05-25', 6, '08:00:00', '9'),
		('2024-06-01', 4, '08:30:00', '8'),
		('2024-06-05', 5, '12:30:00', '11'),
		('2024-06-10', 2, '10:45:00', '3'),
		('2024-06-15', 3, '13:15:00', '6'),
		('2024-06-20', 4, '14:30:00', '4'),
		('2024-06-25', 2, '16:00:00', '2'),
		('2024-06-30', 4, '17:45:00', '7'),
		('2024-07-05', 6, '09:30:00', '9'),
		('2024-07-10', 3, '11:00:00', '5'),
		('2024-07-15', 5, '18:30:00', '1'),
		('2024-07-20', 2, '20:15:00', '8'),
		('2024-07-25', 4, '08:30:00', '3');
>>>>>>> db72259acbfc7b36236e82a167768894ceb36e53




<<<<<<< HEAD
-- creamos una vista que nos permita ver las resvar del día, hechas por los clientes.

DROP VIEW IF EXISTS vista_ventas_diarias;
CREATE OR REPLACE VIEW vista_ventas_diarias AS
SELECT 
    fecha, 
    COUNT(id_ventas) AS total_ventas
FROM 
    ventas
GROUP BY 
    fecha
ORDER BY 
    fecha;


SELECT * FROM vista_ventas_diarias;
=======

-- Insert de datos en la tabla comandas.
INSERT INTO comandas(id_comandas, hora, fecha, id_mesas)
VALUES	('15','12:30:00', '2024-05-17', '1'),
		('20','11:30:00', '2024-05-20', '5'),
        ('35','08:00:00', '2024-05-25', '9'),
        ('40','08:30:00', '2024-06-01', '8'),
        ('52','12:30:00', '2024-06-05', '1'),
		('60', '10:45:00', '2024-06-10', '3'),
		('72', '13:15:00', '2024-06-15', '6'),
		('83', '14:30:00', '2024-06-20', '4'),
		('94', '16:00:00', '2024-06-25', '2'),
		('105', '17:45:00', '2024-06-30', '7'),
		('116', '09:30:00', '2024-07-05', '9'),
		('127', '11:00:00', '2024-07-10', '5'),
		('138', '18:30:00', '2024-07-15', '1'),
		('149', '20:15:00', '2024-07-20', '8'),
		('160', '08:30:00', '2024-07-25', '3');



-- Insert de datos en tabla menu.
INSERT INTO menu(id_menu, nombre, descripcion, precio, tipo)
VALUES	(1, 'menu de 3 pasos', 'entrada: gazpacho. principal: taco filet con salsa de vino. postre: nemesis.', '45.50', 'menu de pasos'),
		(2, 'menu de 5 pasos', '1: ostras. 2: lasngostinos. 3: rotolo. 4: rack cordero. 5: panqueques.', '60.00', 'menu de pasos');




-- Insert de datos de consumo de platos, bebidas y postres en tabla detalle_comandas.
INSERT INTO detalle_comandas (id_comandas, id_platos, id_bebidas, id_postres, cantidad_platos, cantidad_bebidas, cantidad_postres)
VALUES
    -- Comanda 15
    ('15', '1', '2', '2', '2', '1', '0'), -- 2 platos, 1 bebida, 0 postres
    -- Comanda 20postresdetalle_comandas
    ('20', '2', '3', '1', '3', '2', '0'), -- 3 platos, 2 bebidas, 0 postres
    -- Comanda 35
    ('35', '3', '4', '2', '1', '1', '0'), -- 1 plato, 1 bebida, 0 postres
    -- Comanda 40
    ('40', '4', '5', '1', '4', '2', '1'), -- 4 platos, 2 bebidas, 1 postre
    -- Comanda 52
    ('52', '5', '1', '1', '2', '1', '0'), -- 2 platos, 1 bebida, 0 postres
    -- Comanda 60
    ('60', '1', '2', '1', '2', '1', '0'), -- 2 platos, 1 bebida, 0 postres
    -- Comanda 72
    ('72', '2', '3', '1', '3', '2', '0'), -- 3 platos, 2 bebidas, 0 postres
    -- Comanda 83
    ('83', '3', '4', '2', '1', '1', '0'), -- 1 plato, 1 bebida, 0 postres
    -- Comanda 94
    ('94', '4', '5', '1', '4', '2', '1'), -- 4 platos, 2 bebidas, 1 postre
    -- Comanda 105
    ('105', '5', '1', '2', '2', '1', '0'), -- 2 platos, 1 bebida, 0 postres
    -- Comanda 116
    ('116', '1', '2', '2', '2', '1', '0'), -- 2 platos, 1 bebida, 0 postres
    -- Comanda 127
    ('127', '2', '3', '1', '3', '2', '0'), -- 3 platos, 2 bebidas, 0 postres
    -- Comanda 138
    ('138', '3', '4', '2', '1', '1', '0'), -- 1 plato, 1 bebida, 0 postres
    -- Comanda 149
    ('149', '4', '5', '1', '4', '2', '1'), -- 4 platos, 2 bebidas, 1 postre
    -- Comanda 160
    ('160', '5', '1', '2', '2', '1', '0'); -- 2 platos, 1 bebida, 0 postres


-- Insert de los datos de la tabla 'facturas_clientes'
INSERT INTO facturas_clientes (monto_total, id_clientes, id_comandas, pagada)
VALUES 
    (150, 1, 15, 1),
    (180, 2, 20, 1),
    (90, 3, 35, 1),
    (200, 4, 40, 0),
    (160, 5, 52, 1),
    (150, 6, 60, 1),
    (180, 7, 72, 1),
    (90, 8, 83, 1),
    (200, 9, 94, 0),
    (160, 10, 105, 1),
    (150, 11, 116, 1),
    (180, 12, 127, 1),
    (90, 13, 138, 1),
    (200, 14, 149, 0),
    (160, 15, 160, 1);

-- Insert de los datos de la tabla "detalle_facturas_clientes"

INSERT INTO detalle_facturas_clientes (id_clientes, id_facturas, id_detalle_comandas)
VALUES 
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7),
    (8, 8, 8),
    (9, 9, 9),
    (10, 10, 10),
    (11, 11, 11),
    (12, 12, 12),
    (13, 13, 13),
    (14, 14, 14),
    (15, 15, 15);


-- Insert de los datos de la tabla "encuentas_satisfaccion" 

INSERT INTO encuestas_satisfaccion (comentarios, fecha, hora, id_clientes)
VALUES
    ('Excelente servicio y comida deliciosa.', '2024-05-17', '14:30:00', 1),
    ('Muy buena atención, pero la comida tardó un poco.', '2024-05-20', '12:00:00', 2),
    ('Todo estuvo perfecto, volveré pronto.', '2024-05-25', '09:00:00', 3),
    ('El postre no estaba muy fresco.', '2024-06-01', '08:45:00', 4),
    ('El lugar es muy acogedor y la comida excelente.', '2024-06-05', '13:00:00', 5),
    ('La bebida estaba muy dulce.', '2024-06-10', '11:00:00', 6),
    ('Buen ambiente, pero la comida estaba fría.', '2024-06-15', '14:00:00', 7),
    ('Servicio rápido y eficiente.', '2024-06-20', '15:00:00', 8),
    ('La sopa estaba demasiado salada.', '2024-06-25', '16:30:00', 9),
    ('Todo estuvo bien, pero el servicio fue lento.', '2024-06-30', '18:00:00', 10),
    ('La música estaba muy alta.', '2024-07-05', '10:00:00', 11),
    ('El personal fue muy amable y atento.', '2024-07-10', '12:00:00', 12),
    ('Buena relación calidad-precio.', '2024-07-15', '19:00:00', 13),
    ('El lugar estaba limpio y ordenado.', '2024-07-20', '21:00:00', 14),
    ('La comida estaba deliciosa, volveremos.', '2024-07-25', '09:00:00', 15);
    


-- Insert de datos de la tabla proveedores
INSERT INTO proveedores (id_proveedores, nombre, telefono, direccion)
VALUES
    (1, 'Distribuidora de Alimentos S.A.', '123456789', 'Calle Falsa 123, Ciudad A'),
    (2, 'Bebidas y Licores Ltda.', '987654321', 'Avenida Siempre Viva 456, Ciudad B'),
    (3, 'Panadería El Buen Pan', '456123789', 'Calle del Pan 789, Ciudad C'),
    (4, 'Frutas y Verduras Frescas', '321654987', 'Boulevard de las Flores 321, Ciudad D'),
    (5, 'Pescados y Mariscos del Mar', '789456123', 'Calle del Mar 654, Ciudad E'),
    (6, 'Carnes Selectas S.A.', '654321789', 'Avenida de la Carne 987, Ciudad F'),
    (7, 'Lácteos y Derivados', '159753486', 'Calle de la Leche 258, Ciudad G'),
    (8, 'Granos y Cereales', '753159486', 'Boulevard del Grano 369, Ciudad H'),
    (9, 'Importadora de Especias', '951357486', 'Calle de las Especias 741, Ciudad I'),
    (10, 'Productos Orgánicos Naturales', '357951486', 'Avenida Natural 852, Ciudad J');


-- Insert de datos de la tabla "pedidos_proveedores"

INSERT INTO pedidos_proveedores (id_pedidos_proveedores, detalle, fecha, id_proveedores)
VALUES
    (1, 'Pedido de 100 kg de arroz y 50 kg de frijoles', '2024-05-01', 1),
    (2, 'Compra de 200 botellas de vino tinto y 150 de vino blanco', '2024-05-03', 2),
    (3, 'Pedido de 300 panes integrales y 200 panes blancos', '2024-05-05', 3),
    (4, 'Compra de 500 kg de manzanas y 300 kg de naranjas', '2024-05-07', 4),
    (5, 'Pedido de 200 kg de filetes de pescado y 150 kg de camarones', '2024-05-09', 5);


-- Insert de los datos de la tabla "facturas_proveedores"
INSERT INTO facturas_proveedores (id_facturas_proveedores, detalle, fecha, monto, id_proveedores, id_pedidos_proveedores)
VALUES
    (1, 'Factura del pedido de 100 kg de arroz y 50 kg de frijoles', '2024-05-02', 1500, 1, 1),
    (2, 'Factura del pedido de 200 botellas de vino tinto y 150 de vino blanco', '2024-05-04', 5000, 2, 2),
    (3, 'Factura del pedido de 300 panes integrales y 200 panes blancos', '2024-05-06', 1000, 3, 3),
    (4, 'Factura del pedido de 500 kg de manzanas y 300 kg de naranjas', '2024-05-08', 2000, 4, 4),
    (5, 'Factura del pedido de 200 kg de filetes de pescado y 150 kg de camarones', '2024-05-10', 3000, 5, 5);

-- Insert de los datos de la tabla "detalle_facturas_proveedores"

INSERT INTO detalle_facturas_proveedores (id_facturas_proveedores, productos, cantidad, precio)
VALUES
    -- Detalles para la Factura 1
    (1, 'Arroz', 100, 10),
    (1, 'Frijoles', 50, 20),
    -- Detalles para la Factura 2
    (2, 'Vino tinto', 200, 15),
    (2, 'Vino blanco', 150, 20),
    -- Detalles para la Factura 3
    (3, 'Pan integral', 300, 2),
    (3, 'Pan blanco', 200, 2),
    -- Detalles para la Factura 4
    (4, 'Manzanas', 500, 3),
    (4, 'Naranjas', 300, 3),
    -- Detalles para la Factura 5
    (5, 'Filetes de pescado', 200, 10),
    (5, 'Camarones', 150, 15);


-- Insert de los datos de la tabla "empleados"

INSERT INTO empleados (nombre, apellido, fecha_nacimiento, tipo_documento, numero_documento, direccion, email, telefono, fecha_contratacion, puesto, alergias)
VALUES
    -- Cocineros
    ('Juan', 'Pérez', '1980-05-15', 'DNI', 12345678, 'Calle Falsa 123', 'juan.perez@example.com', '555-1234', '2023-01-10', 'Cocinero', NULL),
    ('Laura', 'Gómez', '1985-08-25', 'DNI', 87654321, 'Avenida Siempre Viva 742', 'laura.gomez@example.com', '555-5678', '2023-02-05', 'Cocinero', 'Alergia a los frutos secos'),
	('Mariana', 'Torres', '1982-02-11', 'DNI', 45678901, 'Calle Alameda 345', 'mariana.torres@example.com', '555-1617', '2023-06-10', 'Cocinero', NULL),
    ('Ricardo', 'Fernández', '1987-09-19', 'DNI', 56789012, 'Avenida Libertad 678', 'ricardo.fernandez@example.com', '555-1819', '2023-07-15', 'Cocinero', 'Alergia a los mariscos'),
    -- Mozos
	('Sofía', 'Ramírez', '1995-04-05', 'DNI', 67890123, 'Calle Independencia 910', 'sofia.ramirez@example.com', '555-2021', '2023-08-20', 'Mozo', NULL),
    ('Andrés', 'Vega', '1993-12-25', 'DNI', 78901234, 'Calle San Martín 112', 'andres.vega@example.com', '555-2223', '2023-09-25', 'Mozo', 'Alergia a los lácteos'),
    ('Carlos', 'López', '1990-11-10', 'DNI', 23456789, 'Calle Principal 456', 'carlos.lopez@example.com', '555-9101', '2023-03-15', 'Mozo', 'Alergia al gluten'),
    ('Ana', 'Martínez', '1992-03-22', 'DNI', 98765432, 'Calle Secundaria 789', 'ana.martinez@example.com', '555-1213', '2023-04-20', 'Mozo', NULL),
    -- Bachero
    ('Luis', 'Rodríguez', '1988-07-30', 'DNI', 34567890, 'Avenida Central 101', 'luis.rodriguez@example.com', '555-1415', '2023-05-25', 'Bachero', 'Alergia al polvo'),
	('Elena', 'García', '1990-11-30', 'DNI', 89012345, 'Calle Los Álamos 456', 'elena.garcia@example.com', '555-2425', '2023-10-30', 'Bachero', NULL);



-- Insert de los datos de la tabla "turnos_empleados"
INSERT INTO turnos_empleados (tipo, fecha, hora_inicio, hora_fin, puesto, observaciones, id_empleados)
VALUES
    -- Turnos para Juan Pérez (Cocinero)
    ('Mañana', '2024-05-21', '08:00:00', '14:00:00', 'Cocinero', 'Parte de enfermo', 1),
    ('Tarde', '2024-05-22', '14:00:00', '20:00:00', 'Cocinero', 'Cumplió con horas extras', 1),
    -- Turnos para Laura Gómez (Cocinero)
    ('Mañana', '2024-05-21', '08:00:00', '14:00:00', 'Cocinero', 'Apercibimiento por llegar tarde', 2),
    ('Tarde', '2024-05-22', '14:00:00', '20:00:00', 'Cocinero', 'Parte de enfermo', 2),
    -- Turnos para Mariana Torres (Cocinero)
    ('Mañana', '2024-05-21', '08:00:00', '14:00:00', 'Cocinero', 'Parte de enfermo', 3),
    ('Tarde', '2024-05-22', '14:00:00', '20:00:00', 'Cocinero', 'Apercibimiento por incumplimiento de tareas', 3),
    -- Turnos para Ricardo Fernández (Cocinero)
    ('Mañana', '2024-05-21', '08:00:00', '14:00:00', 'Cocinero', 'Cumplió con horas extras', 4),
    ('Tarde', '2024-05-22', '14:00:00', '20:00:00', 'Cocinero', 'Parte de enfermo', 4),
    -- Turnos para Sofía Ramírez (Mozo)
    ('Mañana', '2024-05-21', '08:00:00', '14:00:00', 'Mozo', NULL, 5),
    ('Tarde', '2024-05-22', '14:00:00', '20:00:00', 'Mozo', NULL, 5),
    -- Turnos para Andrés Vega (Mozo)
    ('Mañana', '2024-05-21', '08:00:00', '14:00:00', 'Mozo', NULL, 6),
    ('Tarde', '2024-05-22', '14:00:00', '20:00:00', 'Mozo', NULL, 6),
    -- Turnos para Carlos López (Mozo)
    ('Mañana', '2024-05-21', '08:00:00', '14:00:00', 'Mozo', NULL, 7),
    ('Tarde', '2024-05-22', '14:00:00', '20:00:00', 'Mozo', NULL, 7),
    -- Turnos para Ana Martínez (Mozo)
    ('Mañana', '2024-05-21', '08:00:00', '14:00:00', 'Mozo', NULL, 8),
    ('Tarde', '2024-05-22', '14:00:00', '20:00:00', 'Mozo', NULL, 8),
    -- Turnos para Luis Rodríguez (Bachero)
    ('Mañana', '2024-05-21', '08:00:00', '14:00:00', 'Bachero', NULL, 9),
    ('Tarde', '2024-05-22', '14:00:00', '20:00:00', 'Bachero', NULL, 9),
    -- Turnos para Elena García (Bachero)
    ('Mañana', '2024-05-21', '08:00:00', '14:00:00', 'Bachero', NULL, 10),
    ('Tarde', '2024-05-22', '14:00:00', '20:00:00', 'Bachero', NULL, 10);


-- insert de los datos de la tabla "empleados_despedidos"

INSERT INTO empleados_despedidos (nombre, apellido, fecha_contratacion, fecha_despido, motivo_despido, puesto, id_empleados)
VALUES ('Luis', 'Rodríguez', '2023-05-25', '2024-05-22', 'Abandono del trabajo sin justificación', 'Bachero', 9);


-- Insert de los datos de la tabla "ventas"

INSERT INTO ventas (id_ventas, fecha)
VALUES
    (16, '2024-05-23'), -- Comanda del 23 de mayo de 2024
    (17, '2024-05-24'), -- Comanda del 24 de mayo de 2024
    (18, '2024-05-25'), -- Comanda del 25 de mayo de 2024
    (19, '2024-05-26'), -- Comanda del 26 de mayo de 2024
    (20, '2024-05-27'), -- Comanda del 27 de mayo de 2024
    (21, '2024-05-28'), -- Comanda del 28 de mayo de 2024
    (22, '2024-05-29'), -- Comanda del 29 de mayo de 2024
    (23, '2024-05-30'), -- Comanda del 30 de mayo de 2024
    (24, '2024-05-31'), -- Comanda del 31 de mayo de 2024
    (25, '2024-06-01'), -- Comanda del 1 de junio de 2024
    (26, '2024-06-02'), -- Comanda del 2 de junio de 2024
    (27, '2024-06-03'), -- Comanda del 3 de junio de 2024
    (28, '2024-06-04'), -- Comanda del 4 de junio de 2024
    (29, '2024-06-05'), -- Comanda del 5 de junio de 2024
    (30, '2024-06-06'); -- Comanda del 6 de junio de 2024

-- Insert de los datos de la tabla "detalle_ventas"

INSERT INTO detalle_ventas (id_ventas, id_platos, cantidad)
VALUES
    -- Comanda 16
    (16, 1, 2), -- Gazpacho (2)
    (16, 2, 1), -- Taco Filet (1)
    -- Comanda 17
    (17, 2, 3), -- Taco Filet (3)
    (17, 3, 2), -- Nemesis (2)
    -- Comanda 18
    (18, 3, 1), -- Nemesis (1)
    (18, 4, 1), -- Bebida (1)
    -- Comanda 19
    (19, 4, 4), -- Bebida (4)
    (19, 5, 2), -- Postre (2)
    -- Comanda 20
    (20, 5, 2), -- Postre (2)
    (20, 1, 2), -- Gazpacho (2)
    -- Comanda 21
    (21, 1, 2), -- Gazpacho (2)
    (21, 2, 1), -- Taco Filet (1)
    -- Comanda 22
    (22, 2, 3), -- Taco Filet (3)
    (22, 3, 2), -- Nemesis (2)
    -- Comanda 23
    (23, 3, 1), -- Nemesis (1)
    (23, 4, 1), -- Bebida (1)
    -- Comanda 24
    (24, 4, 4), -- Bebida (4)
    (24, 5, 2), -- Postre (2)
    -- Comanda 25
    (25, 5, 2), -- Postre (2)
    (25, 1, 2), -- Gazpacho (2)
    -- Comanda 26
    (26, 1, 2), -- Gazpacho (2)
    (26, 2, 1), -- Taco Filet (1)
    -- Comanda 27
    (27, 2, 3), -- Taco Filet (3)
    (27, 3, 2), -- Nemesis (2)
    -- Comanda 28
    (28, 3, 1), -- Nemesis (1)
    (28, 4, 1), -- Bebida (1)
    -- Comanda 29
    (29, 4, 4), -- Bebida (4)
    (29, 5, 2), -- Postre (2)
    -- Comanda 30
    (30, 5, 2), -- Postre (2)
    (30, 1, 2); -- Gazpacho (2)



-- creamos una vista que nos permita ver las resvar del día, hechas por los clientes. 

CREATE VIEW vista_reservas_diarias AS
SELECT r.id_reservas, r.hora, r.fecha, r.cantidad_pax, c.nombre AS nombre_cliente, c.apellido AS apellido_cliente
FROM reservas r
JOIN clientes c ON r.id_clientes = c.id_clientes
WHERE r.fecha = CURDATE()
GROUP BY r.id_reservas, r.hora, r.fecha, r.cantidad_pax, c.nombre, c.apellido;

SELECT * FROM vista_reservas_diarias LIMIT 0, 1000;

>>>>>>> db72259acbfc7b36236e82a167768894ceb36e53

-- creamos una vista que nos de el estado de las mesas. 

CREATE VIEW vista_estado_mesas AS
SELECT
    m.id_mesas,
    m.estado_mesas,
    CASE
        WHEN r.id_reservas IS NOT NULL THEN 'Ocupada'
        ELSE 'Libre'
    END AS estado_actual
FROM mesas m
LEFT JOIN reservas r ON m.id_mesas = r.id_mesas
AND r.fecha = CURDATE();

SELECT m.id_mesas, m.estado_mesas, r.id_reservas, r.fecha
FROM mesas m
LEFT JOIN reservas r ON m.id_mesas = r.id_mesas AND r.fecha = CURDATE();



-- creamos una vista para obtener las facturas pendientes a pagar de los clientes.

CREATE VIEW vista_facturas_pendientes AS
SELECT f.id_facturas, f.monto_total, f.fecha, c.nombre AS nombre_cliente, c.apellido AS apellido_cliente
FROM facturas_clientes f
JOIN clientes c ON f.id_clientes = c.id_clientes
WHERE f.pagada = 0;

SELECT * FROM vista_facturas_pendientes;


<<<<<<< HEAD
=======
-- creamos una vista para las ventas diarias.

CREATE VIEW vista_ventas_diarias AS
SELECT
    v.fecha AS fecha_venta,
    SUM(d.cantidad * (p.precio + b.precio + m.precio)) AS total_ventas
FROM ventas v
JOIN detalle_ventas d ON v.id_ventas = d.id_ventas
JOIN platos p ON d.id_platos = p.id_platos									-- INSERT DATOS PARA VISTA
LEFT JOIN bebidas b ON d.id_bebidas = b.id_bebidas
LEFT JOIN menu m ON d.id_menu = m.id_menu
WHERE v.fecha = CURDATE()
GROUP BY v.fecha;

SELECT * FROM vista_ventas_diarias;

>>>>>>> db72259acbfc7b36236e82a167768894ceb36e53
-- creamos una vista que nos diga los empleados por turno.

CREATE VIEW vista_empleados_por_turno AS
SELECT e.nombre, e.apellido, t.tipo AS turno, t.fecha, t.hora_inicio, t.hora_fin
FROM empleados e
JOIN turnos_empleados t ON e.id_empleados = t.id_empleados
GROUP BY e.nombre, e.apellido, t.tipo, t.fecha, t.hora_inicio, t.hora_fin;

SELECT * FROM vista_empleados_por_turno LIMIT 0, 1000;


-- creamos un stored procedure que nos de el detalle de las comandas.
DROP PROCEDURE IF EXISTS ver_detalle_comandas;

DELIMITER //

CREATE PROCEDURE ver_detalle_comandas(IN comanda_id INT)
BEGIN
    SELECT dc.id_detalle_comandas, dc.id_comandas, dc.id_platos, dc.id_bebidas, dc.id_menu, dc.cantidad_platos, dc.cantidad_bebidas, dc.cantidad_postres, dc.observaciones
    FROM detalle_comandas dc
    WHERE dc.id_comandas = comanda_id;
END //

DELIMITER ;
-- nos muestra el detalle de comanda con id 105
CALL ver_detalle_comandas(105);



-- creamos un stored procedure "generar_facturas_clientes" para crear una factura al cliente

DROP PROCEDURE IF EXISTS generar_facturas_clientes;

DELIMITER //

CREATE PROCEDURE generar_facturas_clientes (IN facturas_clientes INT, OUT monto_total DECIMAL(10,2)) 
BEGIN
    SELECT SUM(id_facturas) INTO monto_total
    FROM facturas_clientes
    WHERE id_facturas = facturas_clientes;
END //

DELIMITER ;

-- Llamada al procedimiento almacenado
CALL generar_facturas_clientes(1, @monto_total);

-- Recuperar el valor de monto_total
SELECT @monto_total;


-- creamos un trigger para actualizar el estado de las mesas, con las reservas. 

DELIMITER //

CREATE TRIGGER actualizar_estado_mesas
AFTER INSERT ON reservas
FOR EACH ROW
BEGIN
    UPDATE mesas
    SET estado_mesas = 'ocupada'
    WHERE id_mesas = NEW.id_mesas;
END;
//

DELIMITER ;


-- creamos una funcion para calcular la edad promedio de los clientes 

DROP FUNCTION IF EXISTS calcular_promedio;

DELIMITER //

CREATE FUNCTION calcular_edad_promedio_cliente() 
RETURNS DECIMAL(5, 2) DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_edad_promedio DECIMAL(5, 2);
    SELECT AVG(YEAR(CURDATE()) - YEAR(fecha_nacimiento)) INTO v_edad_promedio
    FROM clientes;
    RETURN v_edad_promedio;
END //

DELIMITER ;

SELECT calcular_edad_promedio_cliente() AS edad_promedio;


-- creamos una funcion para calcular el 10% de propina.


DELIMITER //

CREATE FUNCTION calcular_propina(monto_total DECIMAL(10, 2)) 
RETURNS DECIMAL(10, 2) DETERMINISTIC
MODIFIES SQL DATA
BEGIN
    DECLARE v_propina DECIMAL(10, 2); 
    SET v_propina = monto_total * 0.1; -- Calcula el 10% del monto total como propina
    RETURN v_propina;
END//

DELIMITER ;


SELECT id_facturas, 
       monto_total, 
       calcular_propina(monto_total) AS propina
FROM facturas_clientes;


-- creamos un trigger que bloquea la eliminación de registros de la tabla empleados

CREATE TRIGGER bloquear_eliminacion_empleados
BEFORE DELETE ON empleados
FOR EACH ROW
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'No se permite eliminar empleados';