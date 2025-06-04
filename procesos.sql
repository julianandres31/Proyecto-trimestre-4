/*Datos cliente proce*/

USE `entertaiment`;
DROP procedure IF EXISTS `datos_cliente`;

USE `entertaiment`;
DROP procedure IF EXISTS `entertaiment`.`datos_cliente`;
;

DELIMITER $$
USE `entertaiment`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `datos_cliente`(
in c_Nombre varchar(20),
in c_Apellido varchar(30), 
in c_Nacionalidad varchar(15), 
in c_ID_Genero tinyint(1),
in c_Correo varchar(40), 
in c_Telefono varchar(14), 
in c_Nacimiento date, 
in c_CodiCiudad tinyint(3), 
in c_Password varchar(20)
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
            c_Correo, c_Telefono, c_Nacimiento, c_Password, SHA2(c_Password, 222)
        );
    END IF;
END$$

DELIMITER ;
;