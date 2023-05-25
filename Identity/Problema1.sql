--Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".
--1- Elimine la tabla,si existe:
 if object_id('medicamentos') is not null
  drop table medicamentos;

--2- Cree la tabla con un campo "codigo" que genere valores secuenciales automáticamente:
 create table medicamentos(
  codigo int identity,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 );

--3- Visualice la estructura de la tabla "medicamentos":
 exec sp_columns medicamentos;

--4- Ingrese los siguientes registros:
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);

--5- Verifique que SQL Server generó valores para el campo "código" de modo automático:
 select * from medicamentos;

--6- Intente ingresar un registro con un valor para el campo "codigo"
insert into medicamentos(codigo,nombre,laboratorio, precio, cantidad)
	values(5,'aceptamonifen','Bayer',5.00,500);
--7- Intente actualizar un valor de código (aparece un mensaje de error)
update medicamentos set codigo=5 where nombre='Sertal';
--8- Elimine el registro con codigo "3" (1 registro eliminado)
delete from medicamentos where codigo=3;
--9- Ingrese un nuevo registro:
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxilina 500','Bayer',15.60,100);

--10- Seleccione todos los registros para ver qué valor guardó SQL Server en el campo código:
 select * from medicamentos;