/*Datos cliente proce*/

USE `entertaiment`;
DROP procedure IF EXISTS `datos_cliente`;

DELIMITER $$
USE `entertaiment`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `datos_cliente`(
    IN c_Nombre VARCHAR(20),
    IN c_Apellido VARCHAR(30), 
    IN c_Nacionalidad VARCHAR(15), 
    IN c_ID_Genero TINYINT(1),
    IN c_Correo VARCHAR(40), 
    IN c_Telefono VARCHAR(14), 
    IN c_Nacimiento DATE, 
    IN c_CodiCiudad TINYINT(3), 
    IN c_Password VARCHAR(20)
)
BEGIN
    IF EXISTS (SELECT 1 FROM Clientes WHERE Correo = c_Correo) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El correo ya está registrado.';
    ELSE
        INSERT INTO Clientes (
            Nombre, Apellido, Nacionalidad, ID_Genero,
            Correo, Telefono, Nacimiento, CodiCiudad, Password
        )
        VALUES (
            c_Nombre, c_Apellido, c_Nacionalidad, c_ID_Genero,
            c_Correo, c_Telefono, c_Nacimiento, c_CodiCiudad, SHA2(c_Password, 256)
        );
    END IF;
END$$

DELIMITER ;

/*departamento*/

USE `entertaiment`;
DROP procedure IF EXISTS `Datos_Departamento`;

DELIMITER $$
USE `entertaiment`$$
CREATE PROCEDURE `Datos_Departamento` (
	IN p_Codigo_Departamento TINYINT(3),
    IN p_Nombre_Departamento VARCHAR(27)
)
BEGIN
	INSERT INTO Departamento 
    VALUES (p_Codigo_Departamento, p_Nombre_Departamento);
END$$

DELIMITER ;

/*ciudad*/

USE `entertaiment`;
DROP procedure IF EXISTS `Datos_Ciudad`;

DELIMITER $$
USE `entertaiment`$$
CREATE PROCEDURE `Datos_Ciudad` (
	IN p_CodiCiudad TINYINT(3),
    IN p_Nombre_Ciudad VARCHAR(27)
)
BEGIN
	INSERT INTO Ciudad VALUES (p_CodiCiudad, p_Nombre_Ciudad, p_Codigo_Departamento);
END$$

DELIMITER ;


/*genero*/

DROP PROCEDURE IF EXISTS `Genero_Contenido`;

DELIMITER $$
CREATE PROCEDURE `Genero_Contenido` (
    IN p_ID_Genero TINYINT(1)
)
BEGIN
    INSERT INTO Genero_Contenido_AudioVisual (ID_Genero, ID_Contenido)
    VALUES (p_ID_Genero, @id_contenido);
END$$
DELIMITER ;



/*Director*/

USE `entertaiment`;
DROP procedure IF EXISTS `Datos_Director`;

DELIMITER $$
USE `entertaiment`$$
CREATE PROCEDURE `Datos_Director` (
    IN p_Nombre_Director VARCHAR(25),
    IN p_Apellido_Director VARCHAR(25),
    IN p_Foto_Director INT(10),
    IN p_Anio_Nacimiento INT(10)
)
BEGIN
	INSERT INTO Director (Nombre_Director, Apellido_Director, Foto, Año_Nacimiento)
    VALUES (p_Nombre_Director, p_Apellido_Director, p_Foto_Director, p_Anio_Nacimiento);
	SET @id_director := LAST_INSERT_ID();
END$$

DELIMITER ;


/*Actor*/

USE `entertaiment`;
DROP procedure IF EXISTS `Datos_Actor`;

DELIMITER $$
USE `entertaiment`$$
CREATE PROCEDURE `Datos_Actor` (
	IN p_Nombre_Actor VARCHAR(25),
    IN p_Apellido_Actor VARCHAR(25),
    IN p_Foto_Actor INT(10)
)
BEGIN
    INSERT INTO Actor (Nombre_Actor, Apellido_Actor, Foto)
    VALUES (p_Nombre_Actor, p_Apellido_Actor, p_Foto_Actor);
    
    SET @id_actor := LAST_INSERT_ID();
END$$

DELIMITER ;


/*cliente*/


USE `entertaiment`;
DROP procedure IF EXISTS `Datos_Cliente`;

USE `entertaiment`;
DROP procedure IF EXISTS `entertaiment`.`Datos_Cliente`;
;

DELIMITER $$
USE `entertaiment`$$
CREATE PROCEDURE `Datos_Cliente`(
    IN p_Nombre_Cliente VARCHAR(20),
    IN p_Apellido_Cliente VARCHAR(30),
    IN p_Nacionalidad VARCHAR(15),
    IN p_ID_Genero TINYINT(1),
    IN p_Correo VARCHAR(40),
    IN p_Telefono VARCHAR(14),
    IN p_Nacimiento DATE,
    IN p_CodiCiudad TINYINT(3),
    IN p_Password VARCHAR(20)
)
BEGIN
    INSERT INTO Clientes (
        Nombre, Apellido, Nacionalidad, ID_Genero,
        Correo, Telefono, Nacimiento, CodiCiudad, Password
    ) VALUES (
        p_Nombre_Cliente, p_Apellido_Cliente, p_Nacionalidad, p_ID_Genero,
        p_Correo, p_Telefono, p_Nacimiento, p_CodiCiudad, SHA2(p_Password, 256)
    );

    SET @id_cliente := LAST_INSERT_ID();
END$$

DELIMITER ;
;



/*Contenido*/

USE `entertaiment`;
DROP procedure IF EXISTS `Datos_Contenido`;

DELIMITER $$
USE `entertaiment`$$
CREATE PROCEDURE `Datos_Contenido` (
    IN p_Titulo VARCHAR(255),
    IN p_Fecha_Lanzamiento DATE,
    IN p_Descripcion VARCHAR(300),
    IN p_Duracion TIME,
    IN p_Clasificacion_Edad VARCHAR(2),
    IN p_Idioma_Original VARCHAR(50),
    IN p_Trailer_URL VARCHAR(255),
    IN p_Pais_Produccion VARCHAR(3),
    IN p_Puntuacion_Promedio DECIMAL(3,2),
    IN p_Enlace_Video VARCHAR(255)
)
BEGIN
    INSERT INTO Contenido_AudioVisual (
        Titulo, Fecha_Lanzamiento, Descripcion, Duracion, Clasificacion_Edad,
        Idioma_Original, Trailer_URL, Pais_Produccion, Puntuacion_Promedio,
        Enlace_Video, ID_Director
    ) VALUES (
        p_Titulo, p_Fecha_Lanzamiento, p_Descripcion, p_Duracion,
        p_Clasificacion_Edad, p_Idioma_Original, p_Trailer_URL, p_Pais_Produccion,
        p_Puntuacion_Promedio, p_Enlace_Video, @id_director
    );

    SET @id_contenido := LAST_INSERT_ID();
END$$

DELIMITER ;


/*Genero contenido*/
USE `entertaiment`;
DROP procedure IF EXISTS `Genero_Contenido`;

DELIMITER $$
USE `entertaiment`$$
CREATE PROCEDURE `Genero_Contenido` (

)
BEGIN
    INSERT INTO Genero_Contenido_AudioVisual VALUES (p_ID_Genero, @id_contenido);
END$$

DELIMITER ;



/*Actor contenido*/


USE `entertaiment`;
DROP procedure IF EXISTS `entertaiment`.`Actor_Contenido`;
;

DELIMITER $$
USE `entertaiment`$$
CREATE PROCEDURE `Actor_Contenido` (
    IN p_Tipo_Actor INT,
    IN p_Personaje VARCHAR(50)
)
BEGIN
    INSERT INTO Contenido_AudioVisual_Actor (ID_Contenido, ID_Actor, Tipo_Actor, Personaje)
    VALUES (@id_contenido, @id_actor, p_Tipo_Actor, p_Personaje);
END$$

DELIMITER ;
;


/*Vistas*/

USE `entertaiment`;
DROP procedure IF EXISTS `Vistas`;

DELIMITER $$
USE `entertaiment`$$
CREATE PROCEDURE `Vistas` (
    IN p_Termino BIT,
    IN p_Tiempo_Visto TIME(6)
)
BEGIN
    INSERT INTO Vistas 
    VALUES (@id_cliente, @id_contenido, p_Termino, p_Tiempo_Visto);

END$$

DELIMITER ;


/*Factura*/


USE `entertaiment`;
DROP procedure IF EXISTS `entertaiment`.`Datos_factura`;
;

DELIMITER $$
USE `entertaiment`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Datos_factura`(
    IN f_FechaCompra DATE

)
BEGIN
    INSERT INTO factura (Fechacompra, ID_Clientes) 
    VALUES (f_FechaCompra, @id_cliente);
SET @id_factura := LAST_INSERT_ID();
END$$

DELIMITER ;


 /*membresia*/
 
USE `entertaiment`;
DROP procedure IF EXISTS `Datos_Membresia`;

DELIMITER $$
USE `entertaiment`$$
CREATE PROCEDURE `Datos_Membresia` (
    IN p_NomMembresia VARCHAR(10),
    IN p_Precio INT(10),
    IN p_Duracion DATE,
    IN p_imagen varchar(255),
    IN p_descripcion varchar(255)
)
BEGIN
    INSERT INTO Membresia (
        NomMembresia, Precio, Duracion, imagen, descripcion,ID_Factura
    ) VALUES (
        p_NomMembresia, p_Precio, p_Duracion,
        p_imagen, p_descripcion, @id_factura
    );
END$$

DELIMITER ;



