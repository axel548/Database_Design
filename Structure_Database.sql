USE master;

GO

DROP DATABASE IF EXISTS control_vuelos;

GO

CREATE DATABASE control_vuelos;

GO

USE control_vuelos;

GO

CREATE TABLE Paises (
	ID INT NOT NULL IDENTITY(1,1),
	Nombre VARCHAR(255) NOT NULL,
	PRIMARY KEY(ID)
);

GO

CREATE TABLE Ciudades   (
	ID INT NOT NULL IDENTITY(1,1),
	Nombre VARCHAR(255) NOT NULL,
	ID_Pais INT NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(ID_Pais) REFERENCES Paises(ID)
);

GO

CREATE TABLE Aeropuertos   (
	Codigo VARCHAR(50) NOT NULL,
	Nombre VARCHAR(255) NOT NULL,
	ID_Ciudad INT NOT NULL,
	PRIMARY KEY(Codigo),
	FOREIGN KEY(ID_Ciudad) REFERENCES Ciudades(ID)
);

GO

CREATE TABLE Modelos   (
	ID INT NOT NULL IDENTITY(1,1),
	Nombre VARCHAR(255) NOT NULL,
	Capacidad INT NOT NULL,
	PRIMARY KEY(ID),
);

GO

CREATE TABLE Aerolineas   (
	ID INT NOT NULL IDENTITY(1,1),
	Nombre VARCHAR(255) NOT NULL,
	PRIMARY KEY(ID),
);

GO

CREATE TABLE Aviones   (
	ID INT NOT NULL IDENTITY(1,1),
	Nombre VARCHAR(255) NOT NULL,
	ID_Modelo INT NOT NULL,
	ID_Aerolinea INT NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(ID_Modelo) REFERENCES Modelos(ID),
	FOREIGN KEY(ID_Aerolinea) REFERENCES Aerolineas(ID)
);

GO

CREATE TABLE Empleados   (
	DPI BIGINT NOT NULL,
	Nombre VARCHAR(255) NOT NULL,
	Tipo VARCHAR(255) NOT NULL,
	Tel INT,
	Prefijo INT,
	PRIMARY KEY(DPI),
);

GO

CREATE TABLE Vuelos   (
	No_Vuelo VARCHAR(50) NOT NULL,
	Fecha DATETIME NOT NULL,
	Estado VARCHAR(255) NOT NULL,
	Plazas_Disponibles INT,
	ID_Avion INT NOT NULL,
	PRIMARY KEY(No_Vuelo),
	FOREIGN KEY(ID_Avion) REFERENCES Aviones(ID),
);

GO

CREATE TABLE Programa_Vuelos   (
	ID INT NOT NULL IDENTITY(1,1),
	No_Vuelo VARCHAR(50) NOT NULL,
	ID_Aerolinea INT NOT NULL,
	Estado VARCHAR(255) NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(No_Vuelo) REFERENCES Vuelos(No_Vuelo),
	FOREIGN KEY(ID_Aerolinea) REFERENCES Aerolineas(ID),
);

GO

CREATE TABLE Tripulacion   (
	ID INT NOT NULL IDENTITY(1,1),
	ID_Empleado BIGINT NOT NULL,
	ID_Programa_Vuelo INT NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(ID_Empleado) REFERENCES Empleados(DPI),
	FOREIGN KEY(ID_Programa_Vuelo) REFERENCES Programa_Vuelos(ID)
);

GO

CREATE TABLE Dias_Disponibilidad (
	ID INT NOT NULL IDENTITY(1,1),
	Nombre VARCHAR(50),
	ID_Programa_Vuelo INT  NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(ID_Programa_Vuelo) REFERENCES Programa_Vuelos(ID)
);

GO

CREATE TABLE Escalas (
	ID INT NOT NULL IDENTITY(1,1),
	No_Orden INT,
	Tipo VARCHAR(255) NOT NULL,
	Bajas_Altas INT,
	ID_Aeropuerto VARCHAR(50) NOT NULL,
	ID_Programa_Vuelo INT  NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(ID_Aeropuerto) REFERENCES Aeropuertos(Codigo),
	FOREIGN KEY(ID_Programa_Vuelo) REFERENCES Programa_Vuelos(ID)
);

GO





