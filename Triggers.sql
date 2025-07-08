DELIMITER $$

CREATE TRIGGER check_email_clientes
BEFORE INSERT ON Clientes
FOR EACH ROW
BEGIN
    IF NEW.Correo IS NULL OR NEW.Correo = '' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El correo del cliente no puede estar vacío';
    END IF;
END$$

DELIMITER ;




DELIMITER $$

CREATE TRIGGER verificar_correo_cliente
BEFORE INSERT ON Clientes
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM Clientes WHERE Correo = NEW.Correo
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El correo ya está registrado.';
    END IF;
END$$

DELIMITER ;

