DROP TABLE IF EXISTS goles;
DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS juegan;
DROP TABLE IF EXISTS equipos;
DROP TABLE IF EXISTS entrenadores;
DROP TABLE IF EXISTS partidos;

create table IF NOT EXISTS partidos (
cod_partido int primary key,
fecha_partido date not null,
goles_local int,
goles_visita int);

create table IF NOT EXISTS entrenadores (
cod_entrenador int primary key,
nombre varchar(10) not null,
apellido varchar(20) not null,
categoría int not null,
nacionalidad varchar(10) not null,
fecha_nacimiento date not null);

create table IF NOT exists equipos (
cod_equipo int primary key,
nombre varchar(20) not null,
estadio varchar(20) not null,
ciudad varchar(40) not null,
cod_entrenador int not null,
foreign key (cod_entrenador) references entrenadores (cod_entrenador) ON DELETE CASCADE
);

create table IF NOT EXISTS juegan (
cod_partido int not null,
cod_equipo int not null,
local_visitante varchar(20) not null,
PRIMARY KEY (cod_partido,cod_equipo),
FOREIGN KEY (cod_partido) REFERENCES partidos(cod_partido),
FOREIGN KEY (cod_equipo) REFERENCES equipos(cod_equipo) ON DELETE CASCADE);

create table IF NOT EXISTS jugadores (
cod_jugadores int primary key,
nombre varchar(10) not null,
apellido varchar(20) not null,
suspendido varchar(10),
posición varchar(20) not null,
venta int,
lesionado varchar(10),
cod_equipo int not null,
FOREIGN KEY (cod_equipo) REFERENCES equipos(cod_equipo) ON DELETE CASCADE);

create table goles IF NOT EXISTS (
cod_gol int primary key,
cod_partido int not null,
cod_jugadores int not null,
FOREIGN KEY (cod_partido) REFERENCES partidos(cod_partido),
FOREIGN KEY (cod_jugadores) REFERENCES jugadores(cod_jugadores) ON DELETE CASCADE);