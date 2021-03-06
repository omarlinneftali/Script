/****** Script for SelectTopNRows command from SSMS  ******/
create database Libre
use Libre
create table Libro(
 id int identity(1,1) primary key not null,
 titulo varchar(20) not null,
 Id_Editora int,
  constraint fk_editora_autor foreign key(id_editora) references Editora(id)



)


create table Editora (
id int identity(1,1) primary key not null,
nombre varchar(25) not null,



)

create table Autor(

id int identity(1,1) primary key not null,
nombre varchar(30),
Id_Editora int,
  constraint fk_editora_aut foreign key(id_editora) references Editora(id)



)

create table LibroAutor(
IdAutor int,
IdLibro int,
constraint fk_autor foreign key(IdAutor) references Autor(id),
constraint fk_libro foreign key(IdLibro) references Libro(id)




)




/* cantidad de libros por autor*/

select Autor.nombre as autor,count(Libro.id) as cantidadLibro from Autor inner join LibroAutor on Autor.id= LibroAutor.IdAutor inner join Libro on Libro.id=LibroAutor.IdLibro group by  Autor.nombre

/*Cantidad libro editora*/
select  Editora.nombre as editora,COUNT(Libro.id) as cantidadEditado from Editora inner join Libro on Libro.Id_Editora=Editora.id  group by Editora.nombre


/*Cantidad AutoresporLibro*/

select  Libro.titulo as libro, count(Autor.id) as cantidadAutor from Autor inner join LibroAutor on Autor.id= LibroAutor.IdAutor inner join Libro on Libro.id=LibroAutor.IdLibro group by  Libro.titulo

/*Autores por editora*/
select Editora.nombre as editora, Autor.nombre as autor  from Autor inner join Editora on Editora.id= Autor.Id_Editora group by Editora.nombre, Autor.nombre
/*Autores de no editora*/
select  Editora.nombre as editora,Autor.nombre as autor from Autor inner join Editora on Editora.id!= Autor.Id_Editora group by Editora.nombre, Autor.nombre
/*inserts*/



USE [Libre]
GO

/*insert autor*/
INSERT INTO [dbo].[Autor]
           ([nombre]
           ,[Id_Editora])
     VALUES
           (<nombre, varchar(30),>
           ,<Id_Editora, int,>)
GO

USE [Libre]
GO

/*insert editora*/
INSERT INTO [dbo].[Editora]
           ([nombre])
     VALUES
           (<nombre, varchar(25),>)
GO

USE [Libre]
GO

/*insert libro*/
INSERT INTO [dbo].[Libro]
           ([titulo]
           ,[Id_Editora])
     VALUES
           (<titulo, varchar(20),>
           ,<Id_Editora, int,>)
GO

USE [Libre]
GO

/*insert libroAutor*/
INSERT INTO [dbo].[LibroAutor]
           ([IdAutor]
           ,[IdLibro])
     VALUES
           (<IdAutor, int,>
           ,<IdLibro, int,>)
GO



