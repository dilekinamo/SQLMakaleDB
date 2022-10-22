--------------------------------------------DDL-----------------------------------------

create database Makaleler_Coded
go
use Makaleler_Coded
go
create table Yazarlar(
	IdYazar int primary key identity(1,1),
	FirstNameYazar nvarchar(64) not null,
	LastNameYazar nvarchar(32) not null,
	EmailYazar nvarchar(128) not null,
	BirthdayYazar date
)

create table Kategoriler(
	Kategori nvarchar(64) primary key 
)

create table Makaleler(
	IdMakale int primary key identity(1,1),
	KategoriMakale nvarchar(64) foreign key references Kategoriler(Kategori) on update cascade on delete set default default 'Genel',
	YazarMakale int foreign key references Yazarlar(IdYazar) on delete set null,
	BaslikMakale nvarchar(140),
	IcerikMakale nvarchar (Max)
)

--------------------------------------------DML-----------------------------------------

insert into Yazarlar values ('Ali','Veli','av@gmail.com','01.13.1984'),
							('Ayse','Fatma','bc@gmail.com','01.06.1984'),
							('Ali','Deli','de@gmail.com','01.06.1984'),
							('Halil','Kalil','fg@gmail.com','01.06.1984'),
							('Hale','Lale','hi@gmail.com','01.06.1984')

insert into Kategoriler values ('Spor'),('Ekonomi'),('Astroloji'),('Genel')

insert into Makaleler values ('Spor','1','Futbol','dfdkfdlfkdlkf')
insert into Makaleler values ('Ekonomi','2','Para','dfdkfdlfkdlkf')

delete from Kategoriler where Kategori='Spor';
delete from Yazarlar where IdYazar=3;
delete from Yazarlar where IdYazar=2;