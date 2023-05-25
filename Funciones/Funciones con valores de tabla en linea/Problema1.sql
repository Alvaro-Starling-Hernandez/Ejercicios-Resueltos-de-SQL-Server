if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20)
 );
 go

 insert into libros values('Uno','Richard Bach','Planeta');
 insert into libros values('El aleph','Borges','Emece');
 insert into libros values('Ilusiones','Richard Bach','Planeta');
 insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo');
 insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo');

 if object_id('f_libros') is not null
  drop function f_libros;
go

 create function f_libros
 (@autor varchar(30)='Borges')
 returns table
 as
 return (
  select titulo,editorial
  from libros
  where autor like '%'+@autor+'%'
 );
go

 select *from f_libros('Bach');

 if object_id('f_libros_autoreditorial') is not null
  drop function f_libros_autoreditorial;
go

 create function f_libros_autoreditorial
 (@autor varchar(30)='Borges',
 @editorial varchar(20)='Emece')
 returns table
 as
 return (
  select titulo,autor,editorial
  from libros
  where autor like '%'+@autor+'%' and
  editorial like '%'+@editorial+'%'
 );
 go

 select *from f_libros_autoreditorial('','Nuevo siglo');

 select *from f_libros_autoreditorial(default,default);
