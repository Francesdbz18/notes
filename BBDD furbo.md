create database furbo;

use furbo;

create table partidos (

cod_partido int primary key,

fecha_partido date not null,

goles_local int,

goles_visita int);

create table entrenadores (

cod_entrenador int primary key,

nombre varchar(10) not null,

apellido varchar(20) not null,

categoría int not null,

nacionalidad varchar(10) not null,

fecha_nacimiento date not null);

create table equipos (

cod_equipo int primary key,

nombre varchar(20) not null,

estadio varchar(20) not null,

ciudad varchar(40) not null,

cod_entrenador int not null, foreign key (cod_entrenador) references entrenadores (cod_entrenador)

);