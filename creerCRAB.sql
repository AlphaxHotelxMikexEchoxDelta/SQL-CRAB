drop database if exists crab ;
create database crab ;

use crab ;

CREATE TABLE Technicien(
	matricule int not null,
	nom char(20) default "inconnue",
	prenom char(20) default "inconnue",
	primary key(matricule) 
);

CREATE TABLE Station(
	numero int not null,
	localisation varchar(50) not null,
	primary key(numero)
);

CREATE TABLE Borne(
	code varchar(2) not null,
	station int,
	etat char(2) default "HS",
	Primary key(code),
	Foreign key(station) references Station(numero)
);

CREATE TABLE Interventions(
	numero int(3) not null,
	borne varchar(2),
	technicien int(2),
	debut varchar(20),
	fin varchar(20) default "En cours...",
	Primary key(numero),
	Foreign key(borne) references Borne(code),
	Foreign key(technicien) references Technicien(matricule)
);
