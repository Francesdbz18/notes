create table alumnos (
alumnoID int primary key,
nombre varchar(40),
direccion varchar(40),
telefono VARCHAR(12)
);

create table departamentos (
dptoID int primary key, 
nombre varchar(40)
);

create table asignatura (
asignaturaID int primary key,
nombre varchar(50), 
numhoras int,
precio int,
dptoID int,
foreign key (dptoID) references departamentos(dptoID) on delete cascade,
constraint chk_horas check (numhoras > 0 and numhoras <=1100)
);

create table calificaciones (
calificacionID int primary key,
alumnoID int,
asignaturaID int,
fecha date,
calificacion int,
foreign key (alumnoID) references alumnos(alumnoID),
foreign key (asignaturaID) references asignatura(asignaturaID),
constraint idunico unique (alumnoID, asignaturaID)
)

insert into alumnos (alumnoID, nombre, direccion, telefono)
values (1, 'SANCHEZ HERMOSILLA, ALBERTO', 'HIGUERUELAS 12', '654782615');

insert into alumnos (alumnoID, nombre, direccion, telefono)
values (2, 'ALBA TORDESILLAS, ANA MARIA', 'PICASSO 112', '632487559');

insert into alumnos (alumnoID, nombre, direccion, telefono)
values (3, 'TORRES ALMAGRO, GUILLERMO', 'ALCALA 415', '651235674');

insert into departamentos values (1, 'Programación');
insert into departamentos values (2, 'Sistemas Operativos');
insert into departamentos values (3, 'Bases de Datos');

insert into asignatura values (1, 'FUNDAMENTOS DE PROGRAMACION', 120, 350, 1);
insert into asignatura values (2, 'ELEMENTOS DE HARDWARE', 75, 200, 2);
insert into asignatura values (3, 'PROGRAMACION AVANZADA EN JAVA', 100, 400, 1);
insert into asignatura values (4, 'SISTEMAS OPERATIVOS MONOPUESTO', 200, 450, 2);
insert into asignatura values (5, 'IMPLANTACION DE BASES DE DATOS', 90, 300, 3);
insert into asignatura values (6, 'BASES DE DATOS NO RELACIONALES', 250, 800, 3);

insert into calificaciones values (2, 1, 3, null, NULL);
insert into calificaciones values (3, 3, 6, null, NULL);
insert into calificaciones values (4, 1, 2, null, NULL);
insert into calificaciones values (5, 2, 5, null, NULL);
insert into calificaciones values (6, 3, 1, null, NULL);
insert into calificaciones values (7, 3, 4, null, NULL);

insert into alumnos (alumnoID, nombre, direccion, telefono)
values (5, 'ROMERO CIFUENTES, ELENA', 'MARCELO USERA 24', '624155975');
insert into calificaciones values (9, 5, 6, null, NULL)


