create database juego;
use juego;

drop table if exists usuario;
drop table if exists partida;

create table if not exists usuario (
	dni char(9) primary key,
	nombre_completo varchar(40)
);

create table if not exists partida (
	dni char(9),
	fecha_partida date,
	puntuacion double,
	nintento int,
	foreign key (dni) references usuario(dni)
);

create user 'gamemaster'@'192.168.80.24' identified by 'GameMaster1!';
grant all privileges on juego.* to 'gamemaster'@'192.168.80.24';

SELECT * FROM usuario;
SELECT * FROM partida;