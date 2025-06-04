create database entertaiment;
use entertaiment;


CREATE TABLE Departamento (
    
    Codigo_Departamento TINYINT(3) PRIMARY KEY,
    Nombre_Departamento VARCHAR(27)
);

CREATE TABLE Ciudad (
    CodiCiudad TINYINT(3) PRIMARY KEY,
    Nombre_Ciudad VARCHAR(27),
    Codigo_Departamento TINYINT(3)
);

CREATE TABLE Genero (
    ID_Genero TINYINT(1) PRIMARY KEY,
    NomGenero VARCHAR(10)
);


CREATE TABLE Director (
    ID_Director INT(10) AUTO_INCREMENT PRIMARY KEY,
    Nombre_Director VARCHAR(25),
    Apellido_Director VARCHAR(25),
    Foto INT(10),
    Año_Nacimiento INT(10)
);

CREATE TABLE Clientes (
    ID_Clientes INT(10) AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(20),
    Apellido VARCHAR(30),
    Nacionalidad VARCHAR(15),
    ID_Genero TINYINT(1),
    Correo VARCHAR(40),
    Telefono VARCHAR(14),
    Nacimiento DATE,
    CodiCiudad TINYINT(3),
    Password VARCHAR(20)
);

CREATE TABLE Contenido_AudioVisual (
    ID_Contenido INT(10) AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255),
    Fecha_Lanzamiento DATE,
    Descripcion VARCHAR(300),
    Duracion TIME,
    Clasificacion_Edad VARCHAR(2),
    Idioma_Original VARCHAR(50),
    Trailer_URL VARCHAR(255),
    Pais_Produccion VARCHAR(3),
    Puntuacion_Promedio DECIMAL(3,2),
    Enlace_Video VARCHAR(255),
	ID_Director INT(10)
);

CREATE TABLE Genero_Contenido_AudioVisual (
    ID_Genero TINYINT(1),
    ID_Contenido INT(10),
    PRIMARY KEY (ID_Genero, ID_Contenido)
);

CREATE TABLE Actor (
    ID_Actor INT(10) AUTO_INCREMENT PRIMARY KEY,
    Nombre_Actor VARCHAR(25),
    Apellido_Actor VARCHAR(25),
    Foto INT(10)
);

CREATE TABLE Contenido_AudioVisual_Actor (
    ID_Contenido INT(10),
    ID_Actor INT(10),
    Tipo_Actor INT(10),
    Personaje INT(10),
    PRIMARY KEY (ID_Contenido, ID_Actor)
);

CREATE TABLE Vistas (
    ID_Clientes INT(10),
    ID_Contenido INT(10),
    Termino BIT,
    Tiempo_Visto TIME(6),
    PRIMARY KEY (ID_Clientes, ID_Contenido)
);

CREATE TABLE Compras (
    ID_Factura INT(10) AUTO_INCREMENT PRIMARY KEY,
    Fechacompra DATE,
    ID_Clientes INT(10)
);

CREATE TABLE Membresia (
    ID_Membresia INT(10) AUTO_INCREMENT PRIMARY KEY,
    NomMembresia VARCHAR(10),
    Precio INT(10),
    Duracion DATE,
    Num_Pantallas INT(1),
    Num_cuentas INT(1),
    Num_CorreosAsociados INT(1),
	ID_Factura INT(10)
);

ALTER TABLE Ciudad
    ADD FOREIGN KEY (Codigo_Departamento) REFERENCES Departamento(Codigo_Departamento);

ALTER TABLE Clientes
    ADD FOREIGN KEY (ID_Genero) REFERENCES Genero(ID_Genero),
    ADD FOREIGN KEY (CodiCiudad) REFERENCES Ciudad(CodiCiudad);

ALTER TABLE Contenido_AudioVisual
    ADD FOREIGN KEY (ID_Director) REFERENCES Director(ID_Director);

ALTER TABLE Genero_Contenido_AudioVisual
    ADD FOREIGN KEY (ID_Genero) REFERENCES Genero(ID_Genero),
    ADD FOREIGN KEY (ID_Contenido) REFERENCES Contenido_AudioVisual(ID_Contenido);

ALTER TABLE Contenido_AudioVisual_Actor
    ADD FOREIGN KEY (ID_Contenido) REFERENCES Contenido_AudioVisual(ID_Contenido),
    ADD FOREIGN KEY (ID_Actor) REFERENCES Actor(ID_Actor);

ALTER TABLE Vistas
    ADD FOREIGN KEY (ID_Clientes) REFERENCES Clientes(ID_Clientes),
    ADD FOREIGN KEY (ID_Contenido) REFERENCES Contenido_AudioVisual(ID_Contenido);

ALTER TABLE Compras
    ADD FOREIGN KEY (ID_Clientes) REFERENCES Clientes(ID_Clientes);

ALTER TABLE Membresia
    ADD FOREIGN KEY (ID_Factura) REFERENCES Compras(ID_Factura);
