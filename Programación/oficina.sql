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


create user 'bdAdmin'@'192.168.80.25'