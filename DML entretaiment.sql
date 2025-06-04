/*Genero*/
insert into genero(id_genero,nomgenero) values 
	(1,"hombre"),
	(2,"mujer");
/*Departamento*/
insert into genero(codigo_departamento,nombre_departamento) values 
	(25,"Cundinamarca"),
	(27,"Choco");
/*Ciudad*/
insert into genero(codiciudad,nombre_ciudad,Codigo_departamento) values 
	(601,"Bogota D.C.",25),
	(601,"Bogota D.C.",27);

CALL datos_cliente(
    'Ana', 'Ramírez', 'Colombiana', 1,
    'ana.ramirez@example.com', '3004567890', '1995-04-12', 2, 'MiClave123'
);
