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


/*Vista de facturación de clientes*/

USE `entertaiment`;
CREATE  OR REPLACE VIEW Vista_Facturas AS
SELECT 
    f.ID_Factura,
    c.ID_Clientes,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Nombre_Cliente,
    f.Fechacompra,
    m.NomMembresia,
    m.Precio,
    m.Descripcion
FROM Factura f
JOIN Clientes c ON f.ID_Clientes = c.ID_Clientes
JOIN Membresia m ON f.id_membresia = m.ID_Membresia;


/*Vista de puntuación y detalles de contenidos audiovisuales*/

USE `entertaiment`;
CREATE  OR REPLACE VIEW Vista_Puntuacion_Contenido AS
SELECT 
    ca.ID_Contenido,
    ca.Titulo,
    ca.Puntuacion_Promedio,
    ca.Duracion,
    ca.Fecha_Lanzamiento,
    d.Nombre_Director,
    d.Apellido_Director
FROM Contenido_AudioVisual ca
LEFT JOIN Director d ON ca.ID_Director = d.ID_Director;


/*Vista de clientes con su membresía actual*/

USE `entertaiment`;
CREATE  OR REPLACE VIEW Vista_Clientes_Membresia AS
SELECT 
    c.ID_Clientes,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Nombre_Cliente,
    m.NomMembresia,
    m.Precio,
    m.Descripcion
FROM Factura f
JOIN Clientes c ON f.ID_Clientes = c.ID_Clientes
JOIN Membresia m ON f.id_membresia = m.ID_Membresia;
