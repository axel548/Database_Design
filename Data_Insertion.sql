USE master;

GO

USE control_vuelos;

GO

-- PAISES
INSERT INTO Paises (Nombre) VALUES 
('Guatemala'), ('El Salvador'), ('Honduras'), ('Nicaragua'), ('Costa Rica'),
('Panamá'), ('Belice'), ('México'), ('Estados Unidos'), ('Canadá'),
('Colombia'), ('Venezuela'), ('Perú'), ('Brasil'), ('Argentina'),
('Chile'), ('Uruguay'), ('Paraguay'), ('Bolivia'), ('Ecuador');


GO

-- CIUDADES
INSERT INTO Ciudades (Nombre, ID_Pais) VALUES 
('Ciudad de Guatemala', 1), ('San Salvador', 2), ('Tegucigalpa', 3), ('Managua', 4), ('San José', 5),
('Panamá', 6), ('Belmopán', 7), ('Ciudad de México', 8), ('Washington D.C.', 9), ('Ottawa', 10),
('Bogotá', 11), ('Caracas', 12), ('Lima', 13), ('Brasilia', 14), ('Buenos Aires', 15),
('Santiago', 16), ('Montevideo', 17), ('Asunción', 18), ('La Paz', 19), ('Quito', 20);


GO

-- AEROPUERTOS
INSERT INTO Aeropuertos (Codigo, Nombre, ID_Ciudad) VALUES 
('GUA', 'Aeropuerto La Aurora', 1), ('SAL', 'Aeropuerto Monseñor Romero', 2), ('TGU', 'Aeropuerto Toncontín', 3), 
('MGA', 'Aeropuerto Augusto C. Sandino', 4), ('SJO', 'Aeropuerto Juan Santamaría', 5),
('PTY', 'Aeropuerto Tocumen', 6), ('BZE', 'Aeropuerto Philip S.W. Goldson', 7), ('MEX', 'Aeropuerto Internacional Benito Juárez', 8),
('IAD', 'Aeropuerto Internacional Washington Dulles', 9), ('YOW', 'Aeropuerto Internacional Macdonald-Cartier', 10),
('BOG', 'Aeropuerto El Dorado', 11), ('CCS', 'Aeropuerto Internacional de Maiquetía', 12), ('LIM', 'Aeropuerto Jorge Chávez', 13),
('BSB', 'Aeropuerto Internacional Presidente Juscelino Kubitschek', 14), ('EZE', 'Aeropuerto Ministro Pistarini', 15),
('SCL', 'Aeropuerto Arturo Merino Benítez', 16), ('MVD', 'Aeropuerto Internacional de Carrasco', 17), 
('ASU', 'Aeropuerto Internacional Silvio Pettirossi', 18), ('LPB', 'Aeropuerto Internacional El Alto', 19), 
('UIO', 'Aeropuerto Internacional Mariscal Sucre', 20);


GO

-- MODELOS DE AVIONES
INSERT INTO Modelos (Nombre, Capacidad) VALUES 
('Boeing 737', 200), ('Airbus A320', 180), ('Embraer 190', 100), ('Boeing 777', 350), ('Airbus A380', 500),
('Boeing 787', 300), ('Airbus A330', 290), ('Bombardier CRJ200', 50), ('ATR 72', 70), ('Cessna 208', 10),
('Airbus A350', 440), ('Boeing 747', 660), ('Boeing 767', 375), ('Airbus A340', 360), ('Embraer 145', 50),
('Boeing 737 MAX', 230), ('Airbus A220', 130), ('Comac C919', 190), ('Sukhoi Superjet 100', 100), ('Bombardier Dash 8', 90);


GO

-- AEROLINEAS
INSERT INTO Aerolineas (Nombre) VALUES 
('Avianca'), ('Copa Airlines'), ('Aeroméxico'), ('Delta Airlines'), ('American Airlines'),
('United Airlines'), ('LATAM Airlines'), ('Sky Airline'), ('Aerolineas Argentinas'), ('Gol Transportes Aéreos'),
('Azul Brazilian Airlines'), ('Interjet'), ('Volaris'), ('Spirit Airlines'), ('JetBlue'),
('Southwest Airlines'), ('Alaska Airlines'), ('Viva Aerobus'), ('Wingo'), ('TAP Air Portugal');


GO

-- AVIONES
INSERT INTO Aviones (Nombre, ID_Modelo, ID_Aerolinea) VALUES 
('Boeing 737-Avianca', 1, 1), ('Airbus A320-Copa', 2, 2), ('Embraer 190-Aeroméxico', 3, 3), ('Boeing 777-Delta', 4, 4), 
('Airbus A380-American', 5, 5), ('Boeing 787-United', 6, 6), ('Airbus A330-LATAM', 7, 7), ('Bombardier CRJ200-Sky', 8, 8), 
('ATR 72-Aerolineas Argentinas', 9, 9), ('Cessna 208-Gol', 10, 10), ('Airbus A350-Azul', 11, 11), ('Boeing 747-Interjet', 12, 12), 
('Boeing 767-Volaris', 13, 13), ('Airbus A340-Spirit', 14, 14), ('Embraer 145-JetBlue', 15, 15), 
('Boeing 737 MAX-Southwest', 16, 16), ('Airbus A220-Alaska', 17, 17), ('Comac C919-Viva Aerobus', 18, 18), 
('Sukhoi Superjet 100-Wingo', 19, 19), ('Bombardier Dash 8-TAP', 20, 20);


GO

-- EMPLEADOS
INSERT INTO Empleados (DPI, Nombre, Tipo, Tel, Prefijo) VALUES 
(1234567890123, 'Juan Perez', 'Piloto', 5551234, 502), (2345678901234, 'María López', 'Copiloto', 5555678, 503),
(3456789012345, 'Carlos García', 'Azafata', 5559012, 504), (4567890123456, 'Ana Rodríguez', 'Azafata', 5553456, 505),
(5678901234567, 'Luis Fernández', 'Mecánico', 5557890, 506), (6789012345678, 'José Martínez', 'Mecánico', 5551230, 507),
(7890123456789, 'Lucía Sánchez', 'Piloto', 5555670, 508), (8901234567890, 'Pedro Ramírez', 'Copiloto', 5559010, 509),
(9012345678901, 'Laura Hernández', 'Azafata', 5553450, 510), (1123456789012, 'Marta Díaz', 'Azafata', 5557891, 511),
(2234567890123, 'Rosa Morales', 'Piloto', 5551232, 512), (3345678901234, 'Juan Gómez', 'Copiloto', 5555673, 513),
(4456789012345, 'Ana Torres', 'Azafata', 5559014, 514), (5567890123456, 'Luis Ruiz', 'Azafata', 5553455, 515),
(6678901234567, 'José Blanco', 'Mecánico', 5557896, 516), (7789012345678, 'Lucía Ortega', 'Mecánico', 5551237, 517),
(8890123456789, 'Pedro Vega', 'Piloto', 5555679, 518), (9901234567890, 'Laura Castro', 'Copiloto', 5559017, 519),
(1012345678901, 'Marta Reyes', 'Azafata', 5553458, 520), (2123456789012, 'Rosa Aguirre', 'Azafata', 5557894, 521);


GO

-- VUELOS
INSERT INTO Vuelos (No_Vuelo, Fecha, Estado, Plazas_Disponibles, ID_Avion) VALUES 
('AV001', '2024-07-01 08:00:00', 'Programado', 100, 1), ('CM002', '2024-07-01 09:00:00', 'Programado', 120, 2),
('AM003', '2024-07-01 10:00:00', 'Programado', 150, 3), ('DL004', '2024-07-01 11:00:00', 'Programado', 200, 4),
('AA005', '2024-07-01 12:00:00', 'Programado', 250, 5), ('UA006', '2024-07-01 13:00:00', 'Programado', 180, 6),
('LA007', '2024-07-01 14:00:00', 'Programado', 220, 7), ('SK008', '2024-07-01 15:00:00', 'Programado', 60, 8),
('AR009', '2024-07-01 16:00:00', 'Programado', 70, 9), ('G310', '2024-07-01 17:00:00', 'Programado', 15, 10),
('AD011', '2024-07-01 18:00:00', 'Programado', 250, 11), ('IJ012', '2024-07-01 19:00:00', 'Programado', 300, 12),
('Y413', '2024-07-01 20:00:00', 'Programado', 375, 13), ('NK014', '2024-07-01 21:00:00', 'Programado', 360, 14),
('B615', '2024-07-01 22:00:00', 'Programado', 50, 15), ('WN016', '2024-07-01 23:00:00', 'Programado', 230, 16),
('AS017', '2024-07-02 00:00:00', 'Programado', 130, 17), ('VB018', '2024-07-02 01:00:00', 'Programado', 190, 18),
('WG019', '2024-07-02 02:00:00', 'Programado', 100, 19), ('TP020', '2024-07-02 03:00:00', 'Programado', 90, 20);


GO

-- PROGRAMACION DE VUELOS
INSERT INTO Programa_Vuelos (No_Vuelo, ID_Aerolinea, Estado) VALUES 
('AV001', 1, 'Activo'), ('CM002', 2, 'Activo'), ('AM003', 3, 'Activo'), ('DL004', 4, 'Activo'), ('AA005', 5, 'Activo'),
('UA006', 6, 'Activo'), ('LA007', 7, 'Activo'), ('SK008', 8, 'Activo'), ('AR009', 9, 'Activo'), ('G310', 10, 'Activo'),
('AD011', 11, 'Activo'), ('IJ012', 12, 'Activo'), ('Y413', 13, 'Activo'), ('NK014', 14, 'Activo'), ('B615', 15, 'Activo'),
('WN016', 16, 'Activo'), ('AS017', 17, 'Activo'), ('VB018', 18, 'Activo'), ('WG019', 19, 'Activo'), ('TP020', 20, 'Activo');

GO

-- TRIPULACION
INSERT INTO Tripulacion (ID_Empleado, ID_Programa_Vuelo) VALUES 
(1234567890123, 1), (2345678901234, 2), (3456789012345, 3), (4567890123456, 4), (5678901234567, 5),
(6789012345678, 6), (7890123456789, 7), (8901234567890, 8), (9012345678901, 9), (1123456789012, 10),
(2234567890123, 11), (3345678901234, 12), (4456789012345, 13), (5567890123456, 14), (6678901234567, 15),
(7789012345678, 16), (8890123456789, 17), (9901234567890, 18), (1012345678901, 19), (2123456789012, 20);


GO

-- DIAS DE DISPONIBILIDAD
-- TRUNCATE TABLE Dias_Disponibilidad;
INSERT INTO Dias_Disponibilidad (Nombre, ID_Programa_Vuelo) VALUES 
('Lunes', 1), ('Martes', 2), ('Miércoles', 3), ('Jueves', 4), ('Viernes', 5),
('Sábado', 6), ('Domingo', 7), ('Lunes', 8), ('Martes', 9), ('Miércoles', 10),
('Jueves', 11), ('Viernes', 12), ('Sábado', 13), ('Domingo', 14), ('Lunes', 15),
('Martes', 16), ('Miércoles', 17), ('Jueves', 18), ('Viernes', 19), ('Sábado', 20);


GO

-- ESCALAS
INSERT INTO Escalas (No_Orden, Tipo, Bajas_Altas, ID_Aeropuerto, ID_Programa_Vuelo) VALUES 
(1, 'Intermedio', 10, 'GUA', 1), (2, 'Intermedio', 5, 'SAL', 2), (3, 'Final', 15, 'TGU', 3), (4, 'Intermedio', 20, 'MGA', 4), 
(5, 'Final', 10, 'SJO', 5), (6, 'Intermedio', 30, 'PTY', 6), (7, 'Intermedio', 25, 'BZE', 7), (8, 'Final', 40, 'MEX', 8), 
(9, 'Intermedio', 35, 'IAD', 9), (10, 'Final', 20, 'YOW', 10), (11, 'Intermedio', 50, 'BOG', 11), (12, 'Intermedio', 45, 'CCS', 12), 
(13, 'Final', 60, 'LIM', 13), (14, 'Intermedio', 55, 'BSB', 14), (15, 'Intermedio', 30, 'EZE', 15), 
(16, 'Final', 70, 'SCL', 16), (17, 'Intermedio', 65, 'MVD', 17), (18, 'Intermedio', 40, 'ASU', 18), 
(19, 'Final', 80, 'LPB', 19), (20, 'Intermedio', 75, 'UIO', 20);

GO

INSERT INTO Escalas (No_Orden, Tipo, Bajas_Altas, ID_Aeropuerto, ID_Programa_Vuelo) VALUES 
(2, 'Intermedio', 5, 'SAL', 5),
(3, 'Intermedio', 15, 'TGU', 5),
(6, 'Intermedio', 20, 'MGA', 5);