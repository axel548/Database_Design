USE master;

GO

USE control_vuelos;

GO

-- SELECT * FROM Paises;
-- SELECT * FROM Ciudades;
-- SELECT * FROM Aeropuertos;
-- SELECT * FROM Modelos;
-- SELECT * FROM Aerolineas;
-- SELECT * FROM Aviones;
-- SELECT * FROM Empleados;
-- SELECT * FROM Vuelos;
-- SELECT * FROM Tripulacion;
-- SELECT * FROM Dias_Disponibilidad;
-- SELECT * FROM Escalas;
-- SELECT * FROM Programa_Vuelos;



-- 2. Cargue la base de datos con información para poder realizar las siguientes consultas:

-- LISTO: Liste todos los aeropuertos creados en el sistema.
SELECT Codigo, Nombre FROM Aeropuertos;
GO

-- LISTO: Liste todos los aviones cargados al sistema, y catalogados por modelo.
SELECT a.Nombre AS 'Avion', m.Nombre as 'Modelo' FROM Aviones a 
INNER JOIN Modelos m ON a.ID_Modelo = m.ID
ORDER BY m.Nombre;
GO

-- LISTO: Reporte de los programas de vuelo con más plazas vacías.  
-- Es decir, listar los 10  vuelos que han tenido la mayor cantidad de asientos vacíos.
SELECT TOP 10 * FROM (SELECT v.No_Vuelo, (m.Capacidad - v.Plazas_Disponibles) as Plazas_restantes FROM Vuelos v 
INNER JOIN Aviones a ON v.ID_Avion = a.ID
INNER JOIN Modelos m ON a.ID_Modelo = m.ID) AS NEW_TABLE
ORDER BY Plazas_restantes DESC;
GO

-- LISTO: Listar los 10 vuelos con más escalas.
SELECT TOP 10 pv.No_Vuelo, 
(SELECT COUNT(*) FROM Escalas WHERE ID_Programa_Vuelo = pv.ID AND Tipo = 'Intermedio') as Cantidad_Escalas
FROM Programa_Vuelos pv
ORDER BY Cantidad_Escalas DESC;
GO

-- LISTO: Listar los 5 vuelos con menos escalas y que sean mayor a 1.  Es decir que tengan al menos una escala.
SELECT * FROM (SELECT TOP 10 pv.No_Vuelo, 
(SELECT COUNT(*) FROM Escalas WHERE ID_Programa_Vuelo = pv.ID AND Tipo = 'Intermedio') as Cantidad_Escalas
FROM Programa_Vuelos pv) AS NEW_TABLE
WHERE Cantidad_Escalas > 1 
ORDER BY Cantidad_Escalas DESC;
GO

-- LISTO: Listar los vuelos directos, es decir que no tiene ninguna escala.
SELECT pv.No_Vuelo FROM Programa_Vuelos pv 
INNER JOIN Escalas e ON pv.ID = e.ID_Programa_Vuelo
WHERE e.Tipo <> 'Intermedio';
GO

-- Realice un query que despliegue la información de los vuelos o planes que existen, se enviará el nombre del aeropuerto y la fecha de consulta.
DROP PROCEDURE IF EXISTS BuscarVuelosPorAeropuertoYFecha;
GO
CREATE PROCEDURE BuscarVuelosPorAeropuertoYFecha
@NombreAeropuerto VARCHAR(255),
@FechaConsulta DATETIME
AS
BEGIN
    SELECT v.No_Vuelo, v.Fecha, a.Nombre AS Aeropuerto
    FROM Vuelos v
    JOIN Programa_Vuelos pv ON v.No_Vuelo = pv.No_Vuelo
    JOIN Escalas e ON pv.ID = e.ID_Programa_Vuelo
    JOIN Aeropuertos a ON e.ID_Aeropuerto = a.Codigo
    WHERE a.Nombre = @NombreAeropuerto AND FORMAT(v.Fecha, 'yyyy-MM-dd') = @FechaConsulta;
END;
GO
EXEC BuscarVuelosPorAeropuertoYFecha @NombreAeropuerto = 'Aeropuerto Toncontín', @FechaConsulta = '2024-07-01';
GO

-- LISTO: Listar el top 10 de los aeropuertos con más movimiento, es decir que más entradas y salidas tiene o más planes de vuelo.
SELECT TOP 10 ID_Aeropuerto, COUNT(*) as Movimiento FROM Escalas 
GROUP BY ID_Aeropuerto
ORDER BY Movimiento DESC;
GO

-- LISTO: Listar qué modelo de avión es el más utilizado.
SELECT m.Nombre, COUNT(*) as Modelo_Avion FROM Programa_Vuelos pv
INNER JOIN Vuelos v ON pv.No_Vuelo = v.No_Vuelo
INNER JOIN Aviones a ON v.ID_Avion = a.ID
INNER JOIN Modelos m ON a.ID_Modelo = m.ID
GROUP BY m.Nombre;
GO

-- LISTO: Hacer una función tipo tabla que despliega la información del plan de vuelo, con sus escalas y que reciba como parámetro el programa de vuelo.
DROP FUNCTION IF EXISTS Informacion_Plan_Vuelo;
GO
CREATE FUNCTION Informacion_Plan_Vuelo(@ID_Programa_Vuelo int)
RETURNS TABLE
AS
RETURN
(
	SELECT pv.No_Vuelo, a.Nombre as Aerolinea, e.ID_Aeropuerto as Aeropuerto, e.Tipo FROM Programa_Vuelos pv
	INNER JOIN Escalas e ON pv.ID = e.ID_Programa_Vuelo
	INNER JOIN Aerolineas a ON pv.ID_Aerolinea = a.ID
	WHERE pv.ID = @ID_Programa_Vuelo
);
GO
SELECT * FROM Informacion_Plan_Vuelo(5);
GO

-- LISTO: Crear un procedimiento almacenado para actualizar el estado de un programa de vuelo, los estados pueden ser (Cargando, Saliendo, Transito, Arribo, retrasado, finalizado).
DROP PROCEDURE IF EXISTS sp_actualizar_programa_vuelo;
GO
CREATE PROCEDURE sp_actualizar_programa_vuelo(@ID_Programa_Vuelo INT, @estado VARCHAR(50))
AS
BEGIN
	DECLARE @response int;
	IF @estado in ('Cargando', 'Saliendo', 'Transito', 'Arribo', 'Retrasado', 'Finalizado')
		BEGIN
			UPDATE Programa_Vuelos SET Estado = @estado WHERE ID = @ID_Programa_Vuelo;
			SET @response = 1;
		END
	ELSE
		SET @response = 0;

	SELECT @response as 'Actualizado';
END;
GO
EXEC sp_actualizar_programa_vuelo @ID_Programa_Vuelo = 1, @estado = 'Cargando';
GO

-- LISTO: Crear una función tipo escalar que devuelva el estado de un plan o programa de vuelo al ingresar el número de plan.
DROP FUNCTION IF EXISTS fn_estado_programa_vuelo;
GO
CREATE FUNCTION fn_estado_programa_vuelo(@ID_Programa_Vuelo INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @resultado VARCHAR(50);
    
    SET @resultado = (SELECT Estado FROM Programa_Vuelos WHERE ID = @ID_Programa_Vuelo);

    RETURN @resultado;
END
GO
SELECT dbo.fn_estado_programa_vuelo(1) as 'Estado';
GO

-- LISTO: Crear una función tipo tabla que devuelva la tripulación de un programa de vuelo.
DROP FUNCTION IF EXISTS Tripulacion_Programa_Vuelo;
GO
CREATE FUNCTION Tripulacion_Programa_Vuelo (@ID_Programa_Vuelo int)
RETURNS TABLE
AS
RETURN
(
	SELECT e.Nombre, e.Tipo, e.Tel FROM Programa_Vuelos pv
	INNER JOIN Tripulacion t ON pv.ID = t.ID_Programa_Vuelo
	INNER JOIN Empleados e ON t.ID_Empleado = e.DPI
	WHERE pv.ID = @ID_Programa_Vuelo
);
GO
SELECT * FROM Tripulacion_Programa_Vuelo(16);
GO

-- Crear un procedimiento almacenado para actualizar la tripulación de un plan de vuelo, recibe como parámetro el cargo y el nuevo nombre del tripulante, 
-- tomar en cuenta que solo se puede hacer el cambio si el estado del plan de vuelo es Cargando.
DROP PROCEDURE IF EXISTS ActualizarTripulacion;
GO
CREATE PROCEDURE ActualizarTripulacion
    @ID_Programa_Vuelo INT,
    @Cargo VARCHAR(255),
    @NuevoNombre VARCHAR(255)
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Programa_Vuelos
        WHERE ID = @ID_Programa_Vuelo
        AND Estado = 'Cargando'
    )
    BEGIN
        UPDATE Empleados
        SET Nombre = @NuevoNombre
        WHERE DPI IN (
            SELECT ID_Empleado
            FROM Tripulacion
            WHERE ID_Programa_Vuelo = @ID_Programa_Vuelo
        )
        AND Tipo = @Cargo;

        PRINT 'Tripulante actualizado correctamente.';
    END
    ELSE
    BEGIN
        PRINT 'No se puede actualizar la tripulación porque el estado del plan de vuelo no es Cargando.';
    END
END;
GO
EXEC ActualizarTripulacion @ID_Programa_Vuelo = 1, @Cargo = 'Piloto', @NuevoNombre = 'Carlos Lopez';


