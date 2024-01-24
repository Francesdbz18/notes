Tema 4: Lenguaje DDL
Sentencia de creación: CREATE TABLE
Tipos de datos: varchar(n), char(n)... etc

Restricciones de tipo 1: una por columna. Cláusulas:
- NOT NULL
- PRIMARY KEY
- UNIQUE
- CHECK
- REFERENCES

Restricciones de tipo 2: una por una o varias columnas. Cláusulas:
- PRIMARY KEY
- FOREIGN KEY
- CONSTRAINT
- UNIQUE

MR 4.3: 
PARTIDOS- (cod_partido*, fecha_partido, goles_local, goles_visita)
JUEGAN- (cod_partido*, cod_equipo*, local_visitante)
EQUIPOS- (cod_equipo*, nombre, estadio, ciudad, cod_entrenador**)
ENTRENADORES- cod_entrenador*, nombre, apellido, categoría, nacionalidad, fecha_nac)
JUGADORES (cod_jugadores*, nombre, apellido, suspendido, posición, venta, lesionado, cod_equipo**)
GOLES (cod_jugadores**, cod_partido**, minuto, cod_gol*, descripción)
