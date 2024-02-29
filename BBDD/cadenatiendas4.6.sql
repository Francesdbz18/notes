DROP DATABASE cadenaTiendas;
CREATE DATABASE cadenaTiendas;
USE cadenaTiendas;
CREATE TABLE tienda (
	tiendaID DECIMAL(5) PRIMARY KEY,
	direccion VARCHAR(20),
	poblacion VARCHAR(20),
	provincia VARCHAR(20),
	codpostal DECIMAL(5) NOT NULL
);
insert into tienda values(1,"direc","pob","prov",28000);

CREATE TABLE fabricante (
	fabricanteID DECIMAL(5) PRIMARY KEY,
	nombre VARCHAR(20),
	nif VARCHAR(10) NOT NULL
);

CREATE TABLE articulo (
	articuloID DECIMAL(5) PRIMARY KEY,
	nombre VARCHAR(20),
	fabricanteID DECIMAL(5),
	PVD DECIMAL(7,2) DEFAULT 0,
	PVP DECIMAL(7,2) DEFAULT 0,
	FOREIGN KEY (fabricanteID) REFERENCES fabricante(fabricanteID)
);

CREATE TABLE existencia (
	existenciaID DECIMAL(6),
	tiendaID VARCHAR(20),
	articuloID VARCHAR(10),
	cantidad DECIMAL(6)
);

CREATE TABLE empleado (
    empleadoID DECIMAL(5) PRIMARY KEY,
    nombre VARCHAR(50),
    tiendaID DECIMAL(5),
    salario DECIMAL(10,2) constraint empleados_salario_chk_mayor_0 check(salario >0),
    FOREIGN KEY (tiendaID) REFERENCES tienda(tiendaID)
);

alter table tienda add column ciudad varchar(20);
ALTER TABLE cadenatiendas.tienda MODIFY COLUMN codpostal INT NOT NULL;
alter table fabricante drop column nif;
alter table fabricante add column dni int;
alter table articulo modify column fabricanteID decimal(5,0) not null;
drop table existencia;
alter table empleado add constraint empleado_nombre_unq unique(nombre);
alter table empleado drop constraint empleados_salario_chk_mayor_0;
alter table tienda add column contacto varchar(20);
alter table tienda add column telefono varchar(15);
ALTER TABLE cadenatiendas.tienda MODIFY COLUMN direccion varchar(40);
ALTER TABLE cadenatiendas.tienda MODIFY COLUMN direccion varchar(40) not NULL;
CREATE TABLE existencia (
	existenciaID DECIMAL(6),
	tiendaID VARCHAR(20),
	articuloID VARCHAR(10),
	cantidad DECIMAL(6)
);
alter table existencia add constraint existencia_cantidad_mayor_0 check (cantidad > 0);