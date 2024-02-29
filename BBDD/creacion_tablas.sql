CREATE database emplea2;
use emplea2;

CREATE TABLE empleados_alter (
numemp INT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
edad INT,
oficina INT,
titulo VARCHAR(20),
contrato DATE NOT NULL,
director INT NOT NULL,
cuota INT,
ventas INT);

CREATE TABLE oficinas_alter (
oficina INT PRIMARY KEY,
ciudad VARCHAR(20),
region VARCHAR(20),
dir INT NOT NULL,
objetivo INT,
ventas INT);

CREATE TABLE productos_alter (
idfab VARCHAR(10),
idproducto VARCHAR(20),
descripcion VARCHAR(30) NOT NULL,
precio INT NOT NULL,
existencias INT ,
CONSTRAINT cp PRIMARY KEY (idfab,idproducto) );
    
CREATE TABLE clientes_alter(
numclie INT PRIMARY KEY ,
nombre VARCHAR(30) NOT NULL,
repclie INT ) ;


CREATE TABLE pedidos_alter (
numpedido INT PRIMARY KEY,
fechapedido DATE NOT NULL,
clie INT NOT NULL,
rep INT NOT NULL,
fab VARCHAR(10) NOT NULL,
producto VARCHAR(20) NOT NULL,
cant INT NOT NULL,
importe INT NOT NULL);

alter table empleados_alter add constraint empleados_nombre_unq unique (nombre);
alter table clientes_alter add column limitecredito INT;
alter table empleados_alter  add constraint empleado_oficina_fk foreign key (oficina) references oficinas_alter (oficina);
alter table empleados_alter add constraint empleado_director_fk foreign key (director) references empleados_alter(numemp);
