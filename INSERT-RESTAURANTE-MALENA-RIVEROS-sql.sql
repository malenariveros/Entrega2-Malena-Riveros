
       
-- inserción de datos para las tablas platos y postres.

INSERT INTO platos (id_platos, nombre, descripcion, categoria, tiempo_preparacion, disponible, precio)
VALUES ('1', 'Gazpacho', 'Sopa fría de tomates de estación con pesto albahaca.', 'entrada', '00:05:00', '1', '9.99');

INSERT INTO platos (id_platos, nombre, descripcion, categoria, tiempo_preparacion, disponible, precio)
VALUES ('2', 'Langostinos Jumbo', 'Langostinos en salsa vasca, cítrica a base de mariscos.', 'entrada', '00:10:00', '1', '14.99');

INSERT INTO platos (id_platos, nombre, descripcion, categoria, tiempo_preparacion, disponible, precio)
VALUES ('3', 'Taco filet con salsa de vino', 'Acompañado de verduras de estación, con salsa de vino y frutos rojos.', 'principal', '00:15:00', '1', '19.99');

INSERT INTO platos (id_platos, nombre, descripcion, categoria, tiempo_preparacion, disponible, precio)
VALUES ('4', 'Rack cordero con espuma de berenjena', 'En su fondo de cocción, acompañado de liso de berenjena', 'principal', '00:15:00', '1', 19.99);

INSERT INTO platos (id_platos, nombre, descripcion, categoria, tiempo_preparacion, disponible, precio)
VALUES ('5','Rotolo de espinaca', 'Pasta rellena de espinaca, con salsa de queso azul.', 'principal', '00:15:00', '1', '17.99');

INSERT INTO postres (id_postres, nombre, descripcion, categoria, tiempo_preparacion, disponible, precio)
VALUES ('1', 'Panqueques frambeados', 'Rellenos de dulce de leche.', 'postre', '00:05:00', '1', '7.99');

INSERT INTO postres (id_postres, nombre, descripcion, categoria, tiempo_preparacion, disponible, precio)
VALUES ('2', 'Nemesis', 'Lingote de chocolate semi amargo, con salsa de frutillas y frutos secos crocantes.', 'postre', '00:05:00', '1', '8.99');

INSERT INTO bebidas (id_bebidas, nombre, descripcion, categoria, disponible, precio)
VALUES ('1', 'Refresco de limón', 'Refresco natural de limón.', 'Bebida', 1, 2.50),
       ('2', 'Café Americano', 'Café negro americano.', 'Bebida', 1, 1.75),
       ('3', 'Jugo de naranja', 'Jugo natural de naranja.', 'Bebida', 1, 3.00),
       ('4', 'Agua mineral', 'Agua mineral sin gas.', 'Bebida', 1, 1.00),
       ('5', 'Vino tinto', 'Vino tinto de la casa.', 'Bebida', 1, 5.00);


-- Insert de clientes (30 más añadidos)

INSERT INTO clientes (nombre, apellido, telefono, email, fecha_nacimiento)
VALUES ('María', 'Gómez', '987654321', 'maria@example.com', '1990-03-15'),
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
       ('Carmen', 'Ruiz', '741852963', 'carmen@example.com', '1996-03-29'),
       ('Pablo', 'Morales', '123789456', 'pablo@example.com', '1992-01-15'),
       ('Claudia', 'Hernández', '456123789', 'claudia@example.com', '1984-04-17'),
       ('Jorge', 'Ramírez', '789456321', 'jorge@example.com', '1977-08-22'),
       ('Isabel', 'Vega', '321987654', 'isabel@example.com', '1994-06-11'),
       ('Fernando', 'Castro', '654789123', 'fernando@example.com', '1980-12-05'),
       ('Natalia', 'Romero', '987321654', 'natalia@example.com', '1986-11-21'),
       ('Raúl', 'Ortega', '789123654', 'raul@example.com', '1989-03-07'),
       ('Patricia', 'Jiménez', '456789654', 'patricia@example.com', '1993-07-29'),
       ('Sergio', 'Mendoza', '123456321', 'sergio@example.com', '1981-10-14'),
       ('Verónica', 'Silva', '654321123', 'veronica@example.com', '1976-05-09'),
       ('Martín', 'Rojas', '789654321', 'martin@example.com', '1990-09-19'),
       ('Liliana', 'Flores', '321654321', 'liliana@example.com', '1985-11-03'),
       ('Héctor', 'Molina', '456123456', 'hector@example.com', '1978-04-25'),
       ('Rosa', 'Rivera', '789321123', 'rosa@example.com', '1991-12-07'),
       ('Andrés', 'Acosta', '987654654', 'andres@example.com', '1982-08-15'),
       ('Monica', 'Salas', '321987321', 'monica@example.com', '1994-03-10'),
       ('Iván', 'Reyes', '654789654', 'ivan@example.com', '1983-10-30'),
       ('Lucía', 'Navarro', '123654123', 'lucia@example.com', '1988-06-21'),
       ('Alberto', 'Pineda', '789456789', 'alberto@example.com', '1975-09-28'),
       ('Valeria', 'Escobar', '456789987', 'valeria@example.com', '1992-07-13'),
       ('Rodrigo', 'Ibarra', '321654987', 'rodrigo@example.com', '1979-02-27'),
       ('Estela', 'Villalobos', '654321789', 'estela@example.com', '1987-04-01'),
       ('Javier', 'Soto', '987123456', 'javier@example.com', '1990-10-20'),
       ('Marisol', 'Durán', '456123321', 'marisol@example.com', '1985-01-31'),
       ('Emilio', 'Carrillo', '123789123', 'emilio@example.com', '1993-08-24'),
       ('Samantha', 'Palacios', '789654987', 'samantha@example.com', '1981-06-02'),
       ('Oscar', 'Meza', '321789654', 'oscar@example.com', '1994-12-15'),
       ('Victoria', 'Peralta', '654987789', 'victoria@example.com', '1982-11-30'),
       ('Federico', 'Bravo', '987456321', 'federico@example.com', '1988-05-08'),
       ('Antonia', 'Gallegos', '123654789', 'antonia@example.com', '1977-07-12'),
       ('Enrique', 'Cabrera', '456987123', 'enrique@example.com', '1991-02-19'),
       ('Paula', 'Santos', '789321789', 'paula@example.com', '1983-03-22');
            
           

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


 
INSERT INTO reservas (fecha, cantidad_pax, hora, id_mesas, id_clientes)
VALUES  ('2024-05-17', 2, '12:30:00', 1, 17),
        ('2024-05-20', 3, '11:30:00', 5, 8),
        ('2024-05-25', 6, '08:00:00', 9, 24),
        ('2024-06-01', 4, '08:30:00', 8, 3),
        ('2024-06-05', 5, '12:30:00', 11, 27),
        ('2024-06-10', 2, '10:45:00', 3, 10),
        ('2024-06-15', 3, '13:15:00', 6, 12),
        ('2024-06-20', 4, '14:30:00', 4, 22),
        ('2024-06-25', 2, '16:00:00', 2, 29),
        ('2024-06-30', 4, '17:45:00', 7, 18),
        ('2024-07-05', 6, '09:30:00', 9, 31),
        ('2024-07-10', 3, '11:00:00', 5, 1),
        ('2024-07-15', 5, '18:30:00', 1, 5),
        ('2024-07-20', 2, '20:15:00', 8, 15),
        ('2024-07-25', 4, '08:30:00', 3, 6),
        ('2024-03-01', 2, '12:00:00', 1, 9),
        ('2024-03-02', 3, '13:30:00', 5, 19),
        ('2024-03-03', 4, '15:00:00', 7, 4),
        ('2024-03-04', 2, '11:00:00', 2, 7),
        ('2024-03-05', 5, '19:00:00', 6, 13),
        ('2024-03-06', 3, '10:30:00', 4, 21),
        ('2024-03-07', 4, '17:00:00', 3, 26),
        ('2024-03-08', 2, '09:00:00', 1, 11),
        ('2024-03-08', 4, '10:00:00', 2, 14),
        ('2024-03-08', 6, '11:00:00', 3, 25),
        ('2024-03-08', 2, '12:00:00', 4, 28),
        ('2024-03-08', 5, '13:00:00', 5, 2),
        ('2024-03-08', 4, '14:00:00', 6, 20),
        ('2024-03-08', 3, '15:00:00', 7, 30),
        ('2024-03-08', 6, '16:00:00', 8, 23),
        ('2024-03-08', 2, '17:00:00', 9, 16),
        ('2024-03-08', 4, '18:00:00', 10, 32),
        ('2024-03-08', 5, '19:00:00', 11, 33),
        ('2024-03-09', 4, '12:30:00', 4, 34),
        ('2024-03-10', 3, '13:00:00', 6, 35),
        ('2024-03-11', 2, '14:30:00', 8, 36),
        ('2024-03-12', 5, '15:00:00', 5, 37),
        ('2024-03-13', 4, '10:00:00', 9, 38),
        ('2024-03-14', 6, '18:30:00', 3, 39),
        ('2024-03-15', 3, '12:00:00', 7, 40),
        ('2024-03-16', 2, '11:30:00', 10, 41),
        ('2024-03-17', 4, '19:30:00', 2, 42),
        ('2024-03-18', 5, '20:00:00', 6, 43);






-- Insert de datos en la tabla comandas.
INSERT INTO comandas(id_comandas, hora, fecha, id_clientes, id_mesas)
VALUES
    ('15', '12:30:00', '2024-05-17', 17, 1),
    ('20', '11:30:00', '2024-05-20', 8, 5),
    ('35', '08:00:00', '2024-05-25', 24, 9),
    ('40', '08:30:00', '2024-06-01', 3, 8),
    ('52', '12:30:00', '2024-06-05', 27, 11),
    ('60', '10:45:00', '2024-06-10', 10, 3),
    ('72', '13:15:00', '2024-06-15', 12, 6),
    ('83', '14:30:00', '2024-06-20', 22, 4),
    ('94', '16:00:00', '2024-06-25', 29, 2),
    ('105', '17:45:00', '2024-06-30', 18, 7),
    ('116', '09:30:00', '2024-07-05', 31, 9),
    ('127', '11:00:00', '2024-07-10', 1, 5),
    ('138', '18:30:00', '2024-07-15', 5, 1),
    ('149', '20:15:00', '2024-07-20', 15, 8),
    ('160', '08:30:00', '2024-07-25', 6, 3),
    ('170', '12:00:00', '2024-03-01', 9, 1),
    ('171', '13:30:00', '2024-03-02', 19, 5),
    ('172', '15:00:00', '2024-03-03', 4, 7),
    ('173', '11:00:00', '2024-03-04', 7, 2),
    ('174', '19:00:00', '2024-03-05', 13, 6),
    ('175', '10:30:00', '2024-03-06', 21, 4),
    ('176', '17:00:00', '2024-03-07', 26, 3),
    ('177', '09:00:00', '2024-03-08', 11, 1),
    ('178', '10:00:00', '2024-03-08', 14, 2),
    ('179', '11:00:00', '2024-03-08', 25, 3),
    ('180', '12:00:00', '2024-03-08', 28, 4),
    ('181', '13:00:00', '2024-03-08', 2, 5),
    ('182', '14:00:00', '2024-03-08', 20, 6),
    ('183', '15:00:00', '2024-03-08', 30, 7),
    ('184', '16:00:00', '2024-03-08', 23, 8),
    ('185', '17:00:00', '2024-03-08', 16, 9),
    ('186', '18:00:00', '2024-03-08', 32, 10),
    ('187', '19:00:00', '2024-03-08', 33, 11),
    ('188', '12:30:00', '2024-03-09', 34, 4),
    ('189', '13:00:00', '2024-03-10', 35, 6),
    ('190', '14:30:00', '2024-03-11', 36, 8),
    ('191', '15:00:00', '2024-03-12', 37, 5),
    ('192', '10:00:00', '2024-03-13', 38, 9),
    ('193', '18:30:00', '2024-03-14', 39, 3),
    ('194', '12:00:00', '2024-03-15', 40, 7),
    ('195', '11:30:00', '2024-03-16', 41, 10),
    ('196', '19:30:00', '2024-03-17', 42, 2),
    ('197', '20:00:00', '2024-03-18', 43, 6);





-- Insert de datos en tabla menu.
INSERT INTO menu(id_menu, nombre, descripcion, precio, tipo)
VALUES	(1, 'menu de 3 pasos', 'entrada: gazpacho. principal: taco filet con salsa de vino. postre: nemesis.', '45.50', 'menu de pasos'),
		(2, 'menu de 5 pasos', '1: ostras. 2: lasngostinos. 3: rotolo. 4: rack cordero. 5: panqueques.', '60.00', 'menu de pasos');


-- Insert de los resgistros de consumo de platos, bebidas, postres y menú de la tabla detalle_comandas.
INSERT INTO detalle_comandas(id_comandas, id_platos, id_bebidas, id_menu, id_postres, cantidad_platos, cantidad_bebidas, cantidad_postres, observaciones)
VALUES
    (15, 1, 1, 2, 1, 2, 2, 1, 'Sin sal'),
    (20, 2, 2, NULL, 2, 1, 1, 1, 'Cocido'),
    (35, 3, 3, NULL, 2, 1, 1, 1, 'Punto medio'),
    (40, 4, 4, NULL, 1, 2, 2, 1, 'Opción vegana'),
    (52, 5, 5, 1, 1, 1, 1, 2, 'Sin gluten'),
    (60, 1, 2, NULL, 2, 2, 2, 1, 'Sin lácteos'),
    (72, 2, 3, NULL, 1, 1, 1, 2, 'Extra picante'),
    (83, 3, 4, NULL, 2, 2, 2, 1, 'Con ajo'),
    (94, 4, 5, NULL, 1, 1, 1, 1, 'Sin cebolla'),
    (105, 5, 1, NULL, 2, 1, 2, 2, 'Ensalada'),
    (116, 1, 2, 2, 1, 2, 1, 1, 'Extra queso'),
    (127, 2, 3, NULL, 2, 1, 1, 2, 'Sin condimentos'),
    (138, 3, 4, NULL, 1, 1, 1, 1, 'Para compartir'),
    (149, 4, 5, NULL, 2, 2, 2, 2, 'Sin frutos secos'),
    (160, 5, 1, 1, 1, 1, 1, 1, 'Sin sal'),
    (170, 1, 2, NULL, 2, 2, 2, 2, NULL),
    (171, 2, 3, NULL, 1, 1, 1, 1, NULL),
    (172, 3, 4, NULL, 2, 1, 2, 2, NULL),
    (173, 4, 5, NULL, 1, 2, 1, 1, NULL),
    (174, 5, 1, NULL, 2, 1, 1, 2, NULL),
    (175, 1, 2, NULL, 1, 1, 1, 1, NULL),
    (176, 2, 3, NULL, 2, 2, 2, 1, NULL),
    (177, 3, 4, NULL, 1, 1, 1, 1, NULL),
    (178, 4, 5, NULL, 1, 1, 1, 1, NULL),
    (179, 5, 1, NULL, 2, 2, 2, 2, NULL),
    (180, 1, 2, NULL, 1, 1, 1, 1, NULL),
    (181, 2, 3, NULL, 2, 2, 1, 1, NULL),
    (182, 3, 4, NULL, 1, 1, 2, 2, NULL),
    (183, 4, 5, NULL, 2, 1, 1, 1, NULL),
    (184, 5, 1, NULL, 1, 2, 1, 1, NULL),
    (185, 1, 2, NULL, 1, 1, 1, 2, NULL),
    (186, 2, 3, NULL, 2, 1, 1, 1, NULL),
    (187, 3, 4, NULL, 2, 2, 2, 2, NULL),
    (188, 4, 5, NULL, 1, 1, 1, 1, NULL),
    (189, 5, 1, NULL, 1, 1, 1, 2, NULL),
    (190, 1, 2, NULL, 2, 2, 1, 1, NULL),
    (191, 2, 3, NULL, 1, 1, 1, 1, NULL),
    (192, 3, 4, NULL, 2, 2, 2, 1, NULL),
    (193, 4, 5, NULL, 1, 1, 1, 1, NULL),
    (194, 5, 1, NULL, 1, 1, 1, 1, NULL),
    (195, 1, 2, NULL, 2, 2, 2, 2, NULL),
    (196, 2, 3, NULL, 1, 1, 1, 1, NULL),
    (197, 3, 4, NULL, 2, 2, 1, 1, NULL);




-- Insert de los datos de la tabla 'facturas_clientes'
INSERT INTO facturas_clientes (id_facturas, monto_total, fecha, id_clientes, id_comandas, pagada)
VALUES 
    (1, 370, '2024-05-17', 17, 15, 1),
    (2, 320, '2024-05-20', 8, 20, 1),
    (3, 280, '2024-05-25', 24, 35, 1),
    (4, 400, '2024-06-01', 3, 40, 0),
    (5, 310, '2024-06-05', 27, 52, 1),
    (6, 380, '2024-06-10', 10, 60, 1),
    (7, 290, '2024-06-15', 12, 72, 1),
    (8, 340, '2024-06-20', 22, 83, 1),
    (9, 260, '2024-06-25', 29, 94, 0),
    (10, 370, '2024-06-30', 18, 105, 1),
    (11, 320, '2024-07-05', 31, 116, 1),
    (12, 280, '2024-07-10', 1, 127, 1),
    (13, 400, '2024-07-15', 5, 138, 1),
    (14, 310, '2024-07-20', 15, 149, 0),
    (15, 380, '2024-07-25', 6, 160, 1),
    (16, 350, '2024-03-01', 9, 170, 1),
    (17, 300, '2024-03-02', 19, 171, 1),
    (18, 280, '2024-03-03', 4, 172, 1),
    (19, 390, '2024-03-04', 7, 173, 0),
    (20, 320, '2024-03-05', 13, 174, 1),
    (21, 380, '2024-03-06', 21, 175, 1),
    (22, 310, '2024-03-07', 26, 176, 1),
    (23, 370, '2024-03-08', 11, 177, 1),
    (24, 290, '2024-03-08', 14, 178, 0),
    (25, 360, '2024-03-08', 25, 179, 1),
    (26, 330, '2024-03-08', 28, 180, 1),
    (27, 340, '2024-03-08', 2, 181, 1),
    (28, 320, '2024-03-08', 20, 182, 1),
    (29, 280, '2024-03-08', 30, 183, 0),
    (30, 300, '2024-03-08', 23, 184, 1),
    (31, 370, '2024-03-08', 16, 185, 1),
    (32, 320, '2024-03-08', 32, 186, 1),
    (33, 280, '2024-03-08', 33, 187, 1),
    (34, 390, '2024-03-09', 34, 188, 0),
    (35, 330, '2024-03-10', 35, 189, 1),
    (36, 310, '2024-03-11', 36, 190, 1),
    (37, 350, '2024-03-12', 37, 191, 1),
    (38, 290, '2024-03-13', 38, 192, 1),
    (39, 360, '2024-03-14', 39, 193, 0),
    (40, 380, '2024-03-15', 40, 194, 1),
    (41, 320, '2024-03-16', 41, 195, 1),
    (42, 330, '2024-03-17', 42, 196, 1),
    (43, 370, '2024-03-18', 43, 197, 1);


-- Insert de los datos de la tabla "detalle_facturas_clientes"

INSERT INTO detalle_facturas_clientes (id_clientes, id_facturas, id_detalle_comandas)
 VALUES 
     (17, 1, 1),
     (8, 2, 2),
     (24, 3, 3),
     (3, 4, 4),
     (27, 5, 5),
     (10, 6, 6),
     (12, 7, 7),
     (22, 8, 8),
     (29, 9, 9),
     (18, 10, 10),
     (31, 11, 11),
     (1, 12, 12),
     (5, 13, 13),
     (15, 14, 14),
     (6, 15, 15),
     (9, 16, 16),
     (19, 17, 17),
     (4, 18, 18),
     (7, 19, 19),
     (13, 20, 20),
     (21, 21, 21),
     (26, 22, 22),
     (11, 23, 23),
     (14, 24, 24),
     (25, 25, 25),
     (28, 26, 26),
     (2, 27, 27),
     (20, 28, 28),
     (30, 29, 29),
     (23, 30, 30),
     (16, 31, 31),
     (32, 32, 32),
     (33, 33, 33),
     (34, 34, 34),
     (35, 35, 35),
     (36, 36, 36),
     (37, 37, 37),
     (38, 38, 38),
     (39, 39, 39),
     (40, 40, 40),
     (41, 41, 41),
     (42, 42, 42),
     (43, 43, 43);




-- Insert de los datos de la tabla "encuentas_satisfaccion" 

INSERT INTO encuestas_satisfaccion (id_encuestas, comentarios, fecha, hora, id_clientes)
VALUES 
    (1, 'Excelente servicio', '2024-05-17', '13:00:00', 17),
    (2, 'Buena comida, ambiente agradable', '2024-05-20', '12:45:00', 8),
    (3, 'Tiempo de espera un poco largo', '2024-05-25', '08:30:00', 24),
    (4, 'La comida no estaba tan buena como esperaba', '2024-06-01', '09:00:00', 3),
    (5, 'Personal amable y atento', '2024-06-05', '12:45:00', 27),
    (6, 'Comida deliciosa, definitivamente volveré', '2024-06-10', '13:15:00', 10),
    (7, 'Servicio rápido y eficiente', '2024-06-15', '11:30:00', 12),
    (8, 'Me encantó la selección de platos', '2024-06-20', '14:00:00', 22),
    (9, 'Pedí un plato que estaba demasiado salado', '2024-06-25', '10:30:00', 29),
    (10, 'La ensalada estaba fresca y deliciosa', '2024-06-30', '12:00:00', 18),
    (11, 'El queso extra en mi plato hizo la diferencia', '2024-07-05', '13:45:00', 31),
    (12, 'La comida estaba un poco sosa, necesita más sabor', '2024-07-10', '10:30:00', 1),
    (13, 'Excelente lugar para compartir con amigos', '2024-07-15', '15:30:00', 5),
    (14, 'Me encanta que ofrezcan opciones sin gluten', '2024-07-20', '19:00:00', 15),
    (15, 'La comida estuvo bien, pero el servicio fue lento', '2024-07-25', '20:30:00', 6),
    (16, 'Todo estuvo delicioso, pero un poco caro', '2024-03-01', '12:15:00', 9),
    (17, 'El ambiente del restaurante es acogedor', '2024-03-02', '14:00:00', 19),
    (18, 'La atención del personal fue excelente', '2024-03-03', '16:30:00', 4),
    (19, 'La comida llegó fría, deberían mejorar eso', '2024-03-04', '11:45:00', 7),
    (20, 'El postre estaba increíble', '2024-03-05', '18:00:00', 13),
    (21, 'Excelente variedad de bebidas', '2024-03-06', '20:00:00', 21),
    (22, 'El plato principal tardó mucho en llegar', '2024-03-07', '09:45:00', 26),
    (23, 'Pedí una bebida que no estaba disponible', '2024-03-08', '11:15:00', 11),
    (24, 'La comida estaba deliciosa, pero la porción era pequeña', '2024-03-08', '12:30:00', 14),
    (25, 'El ambiente del restaurante es muy relajante', '2024-03-08', '14:45:00', 25),
    (26, 'Excelente atención al cliente', '2024-03-08', '16:00:00', 28),
    (27, 'Me encantó la presentación de los platos', '2024-03-08', '17:30:00', 2),
    (28, 'El postre estaba un poco seco', '2024-03-08', '19:45:00', 20),
    (29, 'La comida tardó mucho y estaba fría al llegar', '2024-03-08', '21:00:00', 30),
    (30, 'Buena comida, pero el lugar estaba lleno y ruidoso', '2024-03-09', '13:15:00', 23),
    (31, 'El servicio fue excelente, muy atentos', '2024-03-10', '15:30:00', 34),
    (32, 'La música ambiental era perfecta', '2024-03-11', '17:45:00', 35),
    (33, 'Pedí un plato vegetariano y me trajeron uno con carne', '2024-03-12', '19:30:00', 36),
    (34, 'Me encantó el postre, fue el mejor que he probado', '2024-03-13', '10:00:00', 37),
    (35, 'El servicio fue rápido y eficiente', '2024-03-14', '12:15:00', 38),
    (36, 'La comida estaba demasiado salada', '2024-03-15', '14:30:00', 39),
    (37, 'Los precios son bastante altos para la calidad de la comida', '2024-03-16', '16:45:00', 40),
    (38, 'Ambiente tranquilo, ideal para una cena romántica', '2024-03-17', '18:00:00', 41),
    (39, 'Pedí un plato que estaba en el menú y ya no lo tenían', '2024-03-18', '20:15:00', 42),
    (40, 'La comida estaba bien, pero la presentación era descuidada', '2024-03-19', '11:30:00', 43);



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
    (1, '2024-05-17'),
    (2, '2024-05-20'),
    (3, '2024-05-25'),
    (4, '2024-06-01'),
    (5, '2024-06-05'),
    (6, '2024-06-10'),
    (7, '2024-06-15'),
    (8, '2024-06-20'),
    (9, '2024-06-25'),
    (10, '2024-06-30'),
    (11, '2024-07-05'),
    (12, '2024-07-10'),
    (13, '2024-07-15'),
    (14, '2024-07-20'),
    (15, '2024-07-25'),
    (16, '2024-03-01'),
    (17, '2024-03-02'),
    (18, '2024-03-03'),
    (19, '2024-03-04'),
    (20, '2024-03-05'),
    (21, '2024-03-06'),
    (22, '2024-03-07'),
    (23, '2024-03-08'),
    (24, '2024-03-08'),
    (25, '2024-03-08'),
    (26, '2024-03-08'),
    (27, '2024-03-08'),
    (28, '2024-03-08'),
    (29, '2024-03-08'),
    (30, '2024-03-08'),
    (31, '2024-03-08'),
    (32, '2024-03-08'),
    (33, '2024-03-09'),
    (34, '2024-03-10'),
    (35, '2024-03-11'),
    (36, '2024-03-12'),
    (37, '2024-03-13'),
    (38, '2024-03-14'),
    (39, '2024-03-15'),
    (40, '2024-03-16'),
    (41, '2024-03-17'),
    (42, '2024-03-18');


-- Insert de los datos de la tabla "detalle_ventas"
DELETE FROM detalle_ventas;
INSERT INTO detalle_ventas (id_ventas, id_platos, id_bebidas, id_menu, id_postres, cantidad_platos_vendidos, cantidad_bebidas_vendidas, cantidad_postres_vendidos, cantidad_menu_pasos_vendidos) VALUES
    (1, 1, 1, 1, 1, 2, 2, 1, 2),
    (2, 2, 2, NULL, 2, 1, 1, 1, 2),
    (3, 3, 3, NULL, 2, 1, 1, 1, 2),
    (4, 4, 4, NULL, 1, 2, 2, 1, 1),
    (5, 5, 5, 1, 1, 1, 1, 2, 2),
    (6, 1, 2, NULL, 2, 2, 2, 1, 2),
    (7, 2, 3, NULL, 1, 1, 1, 2, 1),
    (8, 3, 4, NULL, 2, 2, 2, 1, 2),
    (9, 4, 5, NULL, 1, 1, 1, 1, 1),
    (10, 5, 1, NULL, 2, 1, 2, 2, 1),
    (11, 1, 2, 2, 1, 2, 1, 1, 2),
    (12, 2, 3, NULL, 2, 1, 1, 2, 1),
    (13, 3, 4, NULL, 1, 1, 1, 1, 1),
    (14, 4, 5, NULL, 2, 2, 2, 2, 1),
    (15, 5, 1, 1, 1, 1, 1, 1, 1),
    (16, 1, 2, NULL, 2, 2, 2, 2, NULL),
    (17, 2, 3, NULL, 1, 1, 1, 1, NULL),
    (18, 3, 4, NULL, 2, 1, 2, 2, NULL),
    (19, 4, 5, NULL, 1, 2, 1, 1, NULL),
    (20, 5, 1, NULL, 2, 1, 1, 2, NULL),
    (21, 1, 2, NULL, 1, 1, 1, 1, NULL),
    (22, 2, 3, NULL, 2, 2, 2, 1, NULL),
    (23, 3, 4, NULL, 1, 1, 1, 1, NULL),
    (24, 4, 5, NULL, 1, 1, 1, 1, NULL),
    (25, 5, 1, NULL, 2, 2, 2, 2, NULL),
    (26, 1, 2, NULL, 1, 1, 1, 1, NULL),
    (27, 2, 3, NULL, 2, 2, 1, 1, NULL),
    (28, 3, 4, NULL, 1, 1, 2, 2, NULL),
    (29, 4, 5, NULL, 2, 1, 1, 1, NULL),
    (30, 5, 1, NULL, 1, 2, 1, 1, NULL),
    (31, 1, 2, NULL, 1, 1, 1, 2, NULL),
    (32, 2, 3, NULL, 2, 1, 1, 1, NULL),
    (33, 3, 4, NULL, 2, 2, 2, 2, NULL),
    (34, 4, 5, NULL, 1, 1, 1, 1, NULL),
    (35, 5, 1, NULL, 1, 1, 1, 2, NULL),
    (36, 1, 2, NULL, 2, 2, 1, 1, NULL),
    (37, 2, 3, NULL, 1, 1, 1, 1, NULL),
    (38, 3, 4, NULL, 2, 2, 2, 1, NULL),
    (39, 4, 5, NULL, 1, 1, 1, 1, NULL),
    (40, 5, 1, NULL, 1, 1, 1, 1, NULL),
    (41, 1, 2, NULL, 2, 2, 2, 2, NULL),
    (42, 2, 3, NULL, 1, 1, 1, 1, NULL);
