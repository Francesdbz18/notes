-- por FRANCESCO FEVOLI CHACÓN, 07/03/2024 10:40 --

-- TAREAS PREVIAS --
drop database bbddfy;
create database if not exists bbddfy;
use bbddfy;
  
-- 1: CREACIÓN DE TABLAS --
-- c) --
drop table if exists cancion_playlist;
drop table if exists cancion;
drop table if exists album;
drop table if exists playlist;
drop table if exists artista;
drop table if exists usuario;
-- Se borran en último lugar las tablas que son referenciadas en otras, para evitar errores en las mismas. --

-- a) Las tablas se crearían dando prioridad a aquellas que son referenciadas por otras. --

-- b) --
create table if not exists usuario (
id_usuario int primary key,
nombre varchar(100) unique,
email varchar(40) not null,
password char(20) not null,
plan ENUM ('FREE', 'PREMIUM'),
constraint usuario_email_unq unique (email)
);

create table if not exists artista (
id_artista int primary key,
nombre varchar(100) not null,
genero varchar(40) not null,
constraint artista_nombre_unq unique (nombre)
);

create table if not exists album (
id_album int primary key,
titulo varchar(100),
fecha_lanzamiento date not null,
artista int,
foreign key (artista) references artista(id_artista) on update cascade on delete cascade
);

create table if not exists cancion (
id_cancion int primary key,
titulo varchar(100),
duracion dec(4,2) not null,
album int,
artista int,
foreign key (album) references album(id_album) on delete set null on update cascade,
foreign key (artista) references artista (id_artista) on update cascade on delete cascade,
constraint cancion_duracion_chk check(duracion > 1.2 and duracion < 20)
); 

create table if not exists playlist (
id_lista char(9) primary key,
nombre varchar(50) not null,
usuario int,
foreign key (usuario) references usuario(id_usuario) on delete set null on update cascade
);

create table if not exists cancion_playlist (
cancion int,
playlist char(9),
foreign key (cancion) references cancion(id_cancion) on update cascade on delete cascade,
foreign key (playlist) references playlist (id_lista) on delete cascade on update cascade,
constraint cancion_playlist_pk primary key (cancion, playlist)
);



-- 2. INSERCIÓN DE DATOS --
insert into usuario values
(1, 'user1', 'user1@educa.madrid.org', 'BBDD', 'PREMIUM'),
(2, 'user2', 'user2@educa.madrid.org', 'BBDD', 'PREMIUM'),
(3, 'user3', 'user3@educa.madrid.org', 'BBDD', 'PREMIUM'),
(4, 'user4', 'user4@educa.madrid.org', 'BBDD', 'PREMIUM'),
(5, 'user5', 'user5@educa.madrid.org', 'BBDD', 'FREE'),
(6, 'user6', 'user6@educa.madrid.org', 'BBDD', 'PREMIUM'),
(7, 'user7', 'user7@educa.madrid.org', 'BBDD', 'PREMIUM'),
(8, 'user8', 'user8@educa.madrid.org', 'BBDD', 'PREMIUM');

insert into artista values 
(1, 'Arde Bogotá', 'Rock'),
(2, 'Viva Suecia', 'Indie'),
(3, 'Vetusta Morla', 'Indie'),
(4, 'AuronPlay', 'Pódcast/Humor');

insert into album values 
(1, 'Cowboys de la A3', '2023-05-05', 1),
(2, 'El amor de la clase que sea', '2022-10-07', 2),
(3, 'Un día en el mundo', '2008-04-19', 3),
(4, 'El botón que funciona (o no)', '2024-02-15', 4);

insert into cancion values 
(1, 'Copilotos', 2.33, 1, 1),
(2, 'La salvación', 4.24, 1, 1),
(3, 'El bien', 3.27, 2, 2),
(4, 'Copenhage', 5.03, 3, 3),
(5, 'Tú le das y no va', 18.08, 4, 4);

insert into playlist values 
('playlist1', 'User1PlayList', 1),
('playlist2', 'User2PlayList', 2),
('playlist3', 'User3PlayList', 3);

insert into cancion_playlist values
(1, 'playlist1'),
(1, 'playlist2'),
(3, 'playlist1'),
(2, 'playlist2'),
(4, 'playlist2'),
(2, 'playlist3'),
(5, 'playlist3');

-- EJERCICIO 3 --
-- a) -- 
update cancion set duracion = 4.50 where id_cancion = 2;
-- b --
update usuario set email = concat (email, '-ORG') where email like "%.org";
-- c --
insert into artista values (5, 'Arctic Monkeys', 'Indie');
insert into album values (5, 'AM', '2013-06-24', 5);
insert into cancion values (6, 'Fireside', 3.03, 5, 5);
#Para respetar la integridad referencial, debemos insertar primero el artista nuevo y el álbum al que pertenece la canción.

-- d --
delete from usuario where (id_usuario > 5 and id_usuario < 9);

-- e --
insert into usuario values (6, 'user6', 'user6@educa.madrid.org', 'BBDD', 'PREMIUM');
insert into usuario (id_usuario, nombre, email, password, plan) values (7, 'user7', 'user7@educa.madrid.org', 'BBDD', 'PREMIUM');
insert into usuario (id_usuario, nombre, email, plan, password) values (8, 'user8', 'user8@educa.madrid.org', 'PREMIUM', 'BBDD');

-- f --
delete from artista where id_artista = 5;
#En este caso no dan errores, ya que se respeta la integridad referencial. Los registros que se habían creado en las tablas canción y álbum referenciando al artista se han borrado, ya que se instruye que lo hagan en caso de que se borre el registro del artista.

-- g --
delete from cancion_playlist;

-- h --
update cancion set duracion = duracion*1.2 where duracion <= 3.27;

-- i --
update artista set id_artista = 13 where nombre = 'Vetusta Morla';

-- j --
update album set fecha_lanzamiento = str_to_date('20-04-2008', '%d-%m-%Y') where titulo = 'Un día en el mundo';
update album set fecha_lanzamiento = str_to_date('17-10-22', '%d-%m-%y') where titulo = 'El amor de la clase que sea';

-- k --
update cancion set duracion =5.18 where titulo like "C%";

-- EJERCICIO 4 --

-- a --
alter table cancion add constraint cancion_titulo_unq unique(titulo);

-- b --
alter table usuario add column fecha_registro date;

-- c --
update usuario set fecha_registro='2024-01-01';

-- d -- 
alter table usuario modify column fecha_registro date not null;

-- e --
alter table usuario CHANGE fech a_registro registro_fecha date NOT NULL;

-- f -- 
alter table usuario drop column registro_fecha;

-- g --
RENAME TABLE cancion_playlist TO user_playlist;

-- h --
alter table cancion drop constraint cancion_titulo_unq;

-- i --
ALTER TABLE cancion MODIFY COLUMN duracion decimal(5,3) NOT NULL;

-- j --
alter table album add constraint album_id_album_CHK check (id_album >= 1);