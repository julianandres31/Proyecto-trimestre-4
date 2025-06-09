USE `entertaiment`;
DROP procedure IF EXISTS `RegistrarVista`;

DELIMITER $$
USE `entertaiment`$$
CREATE PROCEDURE RegistrarVista (
    IN p_ID_Clientes INT,
    IN p_ID_Contenido INT,
    IN p_Termino BIT,
    IN p_Tiempo_Visto TIME
)
BEGIN
    IF EXISTS (SELECT 1 FROM Vistas WHERE ID_Clientes = p_ID_Clientes AND ID_Contenido = p_ID_Contenido) THEN
        
        UPDATE Vistas
        SET Termino = p_Termino,
            Tiempo_Visto = p_Tiempo_Visto
        WHERE ID_Clientes = p_ID_Clientes AND ID_Contenido = p_ID_Contenido;
    ELSE
        INSERT INTO Vistas (ID_Clientes, ID_Contenido, Termino, Tiempo_Visto)
        VALUES (p_ID_Clientes, p_ID_Contenido, p_Termino, p_Tiempo_Visto);
    END IF;
END$$

DELIMITER ;

