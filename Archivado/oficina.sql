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
insert into empleados values ('Juan','Torres', '1960-01-01', '1980-05-24', 'Jefe', 60000.0);
insert into empleados values('Sara','González','1980-05-02','1999-06-03','Secretaria',25000.0);
insert into empleados values('Elena','Sánchez','1990-09-03','2010-11-02','Técnico FP',30000.0);
insert into empleados values('Pepe','Uriel','1991-10-04','2015-10-01','Administrativo',24000.0);
-- alt: insertar desde empleados.csv -- 

-- create user 'bdAdmin'@'192.168.80.24' identified by 'BDAdmin1!'; --
#grant all privileges on oficina.* to 'bdAdmin'@'192.168.80.24';
#flush privileges

CREATE USER 'bdAdmin'@'%' identified by 'BDAdmin1!';
grant all privileges on oficina.* to 'bdAdmin'@'%';

create table if not exists empleadosantiguos (
	nombre varchar(20),
	apellido varchar(20),
	fechaNacimiento date,
	fechaIngreso date,
	puesto varchar(20),
	salario double,
	fechaSalida date
	);
	
delimiter #
create trigger antiguosTrigger after insert on empleadosantiguos
for each row
begin
  insert into empleadosAntiguos values(new.nombre, new.apellido, new.fechaNacimiento, new.fechaIngreso, new.puesto, new.salario, new.fechaSalida);
end; #
delimiter ;

select * from empleadosAntiguos;

alter variables  set value = 1 where Variable_name='lower_case_table_names';

drop table empleadosantiguos;

select * from mysql.user;