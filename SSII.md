**

Comandos de clase

  

Exclusivos de la práctica:

Usuarios:

useradd: Crear usuario

usermod: Modificación de algún tipo en el usuario

su

sudo

chage: Periodos de contraseña

chfn: Añade datos

finger: Muestrea datos

Grupos:

groupadd: Crear grupo

groups: Seguido del usuario muestra a qué grupo pertenece este

Directorios:

mkdir: Crea directorios

ls -l: Muestra todos los directorios de trabajo

Configuración:

/etc/passwd: Mostrar archivos de configuración

/etc/group: Mostrar archivos de configuración

openssl: Muestra el valor del campo de la contraseña

Permisos:

chgrp: Cambiar grupo

chown: Cambia propietario

chmod: Cambia los permisos de los grupos

Otros:

echo: Crear archivos

  
  
  
  
  
  

Gestión de usuarios:

  

useradd*:

userdel:

chfn

who

su*

sudo*

groupadd*

groupdel

groupmod*

groups*

useradd*

deluser

usermod*

passwd*

chage*

  

Edición de archivos de configuración:

  

/etc/passwd*

/etc/skel

/etc/group*

/etc/shadow*

  

Edición de permisos:

  

chmod*

unmask

chown*

chgrp*

  

Gestión de procesos:

  

kill

nice

renice

ps

pstree

fg

tip

jobs

at

batch

crontab

bg

  
  
  

Comandos de la práctica

  

1

sudo useradd -m -p $(openssl passwd password) ITadmin

2

grep ITadmin /etc/passwd /etc/group

3

openssl passwd

openssl passwd -1 “a”

4

Este no funciona ya que no tiene permisos y no se encuentra en la carpeta sudoers

5

sudo usermod -aG sudo ITadmin

También podemos hacerlo accediendo directamente al archivo con el comando “visudo” en el usuario root y allí modificar el archivo directamente para dar los permisos.

6

su ITadmin

7

su - ITadmin

sudo groupaddIT

sudo usermod -aG ITadmin

8

groups ITadmin

9

sudo groupadd ________

10

sudo useradd -m -G (grupo) (usuario)

11

sudo usermod -aG (grupo) (usuario)

12

sudo mkdir /home/(grupo)

13

sudo chown (usuario) /home/(grupo)

14

sudo chgrp (grupo) /home/(grupo)

15

ls -l/home

16

sudo chmod nnn /home/(grupo)

Cada número corresponde a la cantidad de permisos, el primero corresponde al propietario, el segundo al grupo, y el tercero a otros.

17

su (usuario)

echo “texto” >> /home/(grupo)/(archivo).txt

18

Procedimiento AltaEmpleado(nombre_Empleado, nombre_Departamento , nombre_Jefe ):

  

Inicio

// Nuevo usuario 

Comando("sudo useradd -m " + nombre_Empleado) 

  

// Nuevo empleado al grupo Personal 

Comando("sudo usermod -aG Personal " + nombre_Empleado) 

  

// Nuevo empleado al grupo de su departamento 

Comando("sudo usermod -aG " + nombre_Departamento + " " + nombre_Empleado) 

  

// Nuevo empleado al grupo del jefe de su departamento 

Comando("sudo usermod -aG " + nombre_Jefe + " " + nombre_Empleado) 

  

// Nuevo nombre de empleado al fichero personal.txt 

Comando("echo '" + nombre_Empleado+ "' >> /home/RecursosHumanos/empleados.txt")

Fin

19

Procedimiento CambioDepartamento(nombre_Empleado, antiguo_Departamento, antiguo_Jefe, nuevo_Departamento, nuevo_Jefe):

Inicio

//Eliminar empleado del grupo del antiguo departamento

Comando("sudo gpasswd -d " + nombre_Empleado + " " + antiguo_Departamento) 

  

//Eliminar empleado del grupo de su anterior jefe

Comando(“sudo gpasswd -d” + nombre_Empleado + " " + antiguo_Jefe)

  

// Añadir empleado al grupo de su nuevo departamento 

Comando("sudo usermod -aG " + nuevo_Departamento + " " + nombre_Empleado )

// Añadir empleado al grupo de su nuevo jefe 

Comando("sudo usermod -aG " + nuevo_Jefe + " " + nombre_Empleado ) 

Fin

20

Procedimiento CambioDepartamento(nombre_Empleado, nuevo_Jefe  antiguo_Departamento,  nuevo_Departamento ):

Inicio 

// Deshabilitar empleado

Comando("sudo usermod -L " + nombre_Empleado) 

  

// Eliminar empleado del grupo de su antiguo departamento 

Comando("sudo gpasswd -d " + nuevo_Jefe + " " + antiguo_Departamento) 

  

// Eliminar empleado del grupo de su antiguo jefe 

Comando("sudo gpasswd -d " + nombre_Empleado+ " " + nuevo_Jefe ) 

  

// Añadir al empleado al grupo de su nuevo departamento 

Comando("sudo usermod -aG " + nuevo_Departamento + " " + nombre_Empleado) 

  

// Añadir al empleado al grupo de su nuevo jefe 

Comando("sudo usermod -aG " + nuevo_Jefe + " " + nombre_Empleado) 

  

// Habilitarl empleado

Comando("sudo usermod -U " + nombre_Empleado) 

Fin

21

Con el comando “/etc/shadow” se mostrara una cadena de caracteres que mostraran que la usuario esta deshabilitada pero la contraseña no sera visible.

22

El comando “chage” es una acortacion de change age (cambiar edad) referiendose a la vida util de la contraseña. Este comando permite manipular algunas funciones de la vida de la contraseña como mostrar el tiempo restante, cambiar el tiempo restanto u otros.

  

chage -l: muestra la informacion de la contraseña actual y fecha de expiracion de la cuenta

chage -M: establece un numero maximo de dias para cambiar la contraseña

chage -m: establece un numero de dias minimos para cambiar la contraseña

chage -E: establece la fecha de caducidad de la cuenta. Sera en formato americano año-mes-dia.

chage -W: establece un número de dias de advertencia para el cambio de contraseña.

23

sudo chfn -f (nombre completo) -r (grado) -w (número fijo) -h (número móvil) (nombre)

24

finger (nombre)

25

finger (nombre)

**