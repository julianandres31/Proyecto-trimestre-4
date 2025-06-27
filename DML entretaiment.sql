/*Genero*/
insert into genero(id_genero,nomgenero) values 
	(1,"hombre"),
	(2,"mujer");
/*Departamento*/
insert into departamento(codigo_departamento,nombre_departamento) values 
	(25,"Cundinamarca"),
	(27,"Choco");
/*Ciudad*/
insert into ciudad(nombre_ciudad,Codigo_departamento) values 
	("Bogota D.C.",25),
	("Bogota D.C.",27);

CALL datos_cliente(
'Ana', 'Ramírez', 'Colombiana', 2,
'ana.ramireza@example.com', '3004567890', '1995-04-12', 1, 'MiClave123'
);



select * from actor;

select * from ciudad;

select * from clientes;

select * from contenido_audiovisual;

select * from contenido_audiovisual_actor;

select * from departamento;

select * from director;

select * from factura;

select * from genero;

select * from genero_contenido_audiovisual;

select * from membresia;

select * from vistas;