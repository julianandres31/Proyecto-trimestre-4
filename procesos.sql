USE `entertaiment`;
DROP procedure IF EXISTS `datos_cliente`;

DELIMITER $$
USE `entertaiment`$$
CREATE PROCEDURE `datos_cliente`(
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



