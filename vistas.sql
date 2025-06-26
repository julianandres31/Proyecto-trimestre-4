/*Reparto de cada contenido*/

USE `entertaiment`;
CREATE  OR REPLACE VIEW Vista_Reparto_Contenido AS
SELECT
    c.ID_Contenido,
    c.Titulo,
    a.ID_Actor,
    CONCAT(a.Nombre_Actor, ' ', a.Apellido_Actor) AS Nombre_Actor
FROM Contenido_AudioVisual c
JOIN Contenido_AudioVisual_Actor caa ON c.ID_Contenido = caa.ID_Contenido
JOIN Actor a ON caa.ID_Actor = a.ID_Actor;

/* Facturas con detalles de membresía*/

USE `entertaiment`;
CREATE  OR REPLACE VIEW Vista_Factura_Membresia AS
SELECT
    f.ID_Factura,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
    m.NomMembresia,
    m.Precio,
    f.Fechacompra
FROM Factura f
JOIN Clientes c ON f.ID_Clientes = c.ID_Clientes
JOIN Membresia m ON f.id_membresia = m.ID_Membresia;

/*Contenido por género*/

USE `entertaiment`;
CREATE  OR REPLACE VIEW Vista_Contenido_Genero AS
SELECT
    c.ID_Contenido,
    c.Titulo,
    g.NomGenero
FROM Contenido_AudioVisual c
JOIN Genero_Contenido_AudioVisual gca ON c.ID_Contenido = gca.ID_Contenido
JOIN Genero g ON gca.ID_Genero = g.ID_Genero;
