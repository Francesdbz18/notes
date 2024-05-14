create database oficina;
use oficina;

drop table if exists empleados;
drop table if exists empleadosAntiguos;

create table if not exists empleados (
	nombre varchar(20),
	apellido varchar(20),
	fechaNacimiento date,
	fechaIngreso date,
	puesto varchar(20),
	salario double
	);

create table if not exists empleadosAntiguos (
	nombre varchar(20),
	apellido varchar(20),
	fechaNacimiento date,
	fechaIngreso date,
	puesto varchar(20),
	salario double,
	fechaSalida date
	);

-- insertar desde empleados.csv -- 

create user 'bdadmin'@'192.168.80.24' identified by 'BDAdmin1!';
grant all privileges on oficina.* to 'bdadmin'@'192.168.80.24';
flush privileges;

