#1. Mostrar el número de empleados que tiene la empresa y el número de empleados que cobran comisión
select count(*), count(comm) from emp;

#2. Contar el número de empleados que hay en el departamento 20
select count(*) from emp where deptno = 20;

#3. Contar el número de empleados que tiene la empresa en 1981
select count(*) from emp where HIREDATE between '1981-01-01' and '1981-12-31';
select count(*) from emp where HIREDATE like '1981%';
select count(*) from emp where extract(year from hiredate) = '1981';
select count(*) from emp where year(hiredate) = '1981';


#4. Los salarios máximos y mínimos de aquellos empleados que tengan el oficio (job) CLERK
select max(sal), min(sal) from emp where job='CLERK';

#5. Salario medio de los empleados que su nombre empiece por J.
select avg(sal) from emp where ename like 'J%';

#7. Mostrar la suma del salario cuyo salario sea superior a 1800
select sum(sal) from emp where sal > 1800;

#8. Mostrar el numero de oficios hay en el departamento 10
select count(distinct job) from emp where deptno = 10;

#9. Mostrar para los empleados del dpto 20 el mensaje ‘Ename gana SAL Euros’. El campo ENAME esta la primera en mayúscula y las siguientes en minúscula.
select concat(concat(UPPER(substring(ename, 1, 1)), substring(lower(ename), 2)),' gana ', sal, '€') from emp;

#10. Mostrar todos los empleados cuyo nombre tiene cinco o más caracteres.
select * from emp where length(ename) >= 5;

#11. Mostrar la media del salario de los empleados cuyo oficio tenga 7 caracteres
select avg(sal) from emp where length(job)=7;

#12. Mostrar el nombre añadiendo un * por la derecha y dicho nombre añadiendo un asterisco por la izquierda a todos los empleados del dpto 10. En ambos casos se debe alcanzar una longitud de 10 caracteres.
select rpad(ename, 10, '*') as DERECHA, lpad(ename, 10, '*') as IZQUIERDA from emp where deptno = 10;

#13.Eliminar los caracteres asterisco a las cadenas '*****PEPITO', 'MANOLITA*****' y a la cadena de caracteres '*******LOLO*****' (FROM DUAL)
select trim(leading '*' from '****pepito'), trim(trailing 'manolita*****'), trim (both '*' from '******lolo******') from dual;

#14. Mostrar la fecha correspondiente a cinco meses después de la fecha del sistema. (FROM DUAL)
select sysdate() + interval '5' month from dual;
select date_add(sysdate(), interval 5 month) from dual;

#15. Mostrar el último día de este mes. (FROM DUAL)
select last_day(sysdate()) from dual;

#16. Mostrar cuantos meses llevan trabajando los empleados cuyo oficio es MANAGER. Redondear el resultado a dos decimales.
select ename, round(timestampdiff(month, hiredate, sysdate()), 2) from emp where job = 'MANAGER';

#17.  Mostrar cuantos meses, años y trienios cumplidos llevan trabajando los empleados cuyo oficio es MANAGER. Redondear el resultado a dos decimales.
select ename, 
round(timestampdiff(month, hiredate, sysdate()),2) as MESES,
round(timestampdiff(YEAR, hiredate, sysdate()),2) as AÑOS,
round((timestampdiff(YEAR, hiredate, sysdate()))/3,2) as TRIENIOS
from emp
where job = 'MANAGER';
 
#19. Mostrar para todos los empleados que sean CLERK la fecha de ingreso, diez días mas y diez días menos
select ename, 
hiredate,
date_add(hiredate, interval 10 day) as '10 dias mas',
date_add(hiredate, interval -10 day) as '10 dias menos'
from emp
where job = 'CLERK';
select ename, 
hiredate,
date_add(hiredate, interval 10 day) as '10 dias mas',
date_add(hiredate, interval -10 day) as '10 dias menos'
from emp
where job = 'CLERK';

SELECT
ENAME,
HIREDATE,
HIREDATE + 10 "HIR+10",
HIREDATE - 10 "HIR-10"
FROM EMP
WHERE JOB = 'CLERK';

#20. Mostrar un listado con el nombre, salario y comisión de los empleados del dpto 30. si no tiene comisión, poner 0
SELECT
ENAME,
SAL,
ifnull(COMM, 0) COMISIÓN,
Coalesce(COMM, 0) COMISIÓNCoalesce ###tambien se puede hacer con coalesce
FROM EMP
WHERE DEPTNO = 30;

#21. Mostrar un listado con el nombre, salario, comisión y el total de lo que va a cobrar de los empleados del dpto 30. si no tiene comisión, poner ‘---’
SELECT 
    ENAME AS Nombre,
    SAL AS Salario,
    COALESCE(COMM, '---') AS Comisión,
    COALESCE(SAL + COMM, SAL) AS Total
FROM 
    EMP
WHERE 
    DEPTNO = 30;

#22.Para todos los empleados cuyo nombre tiene una A, mostrar un listado con el nombre, comisión y la cadena 'TIENE' en el caso de que tenga comisión y 'NO TIENE' en caso contrario.
select 
ename, comm,
case 
	when ename like '%A%' and comm is not null then 'TIENE'
	else 'NO TIENE'
end as letras
from emp;

#23. Mostrar el nombre la fecha y la fecha en formato 'DD-MM-YYYY' de todos empleados que sean CLERK
select ename,
hiredate as FECHA,
date_format(hiredate, '%d-%m-%Y') as FECHA_FORMATEADA
from emp 
where job = 'CLERK';

#24. Mostrar el nombre y la fecha de entrada de los empleados que han entrado en la empresa en el mes de Febrero.
select ename,
hiredate 
from emp 
where month(hiredate) = '02';

#25. Igual que en el caso anterior, pero solo se puede comparar con la cadena de texto 'FEB'
select ename,
hiredate,
monthname(hiredate)
from emp
where UPPER(monthname(hiredate)) like 'FEB%';

#26. ¿Cuantos empleados entraron a trabajar un Viernes?.
select count(*) as numEm
from emp
where dayname(hiredate) = 'FRIDAY';

#27. Hacer un listado de los nombres de empleado que tienen un letra A, una letra C o bien tiene las dos letras. El resultado son dos columnas una con el resultado en cuestión y otra con una explicación: 'TIENE UNA A', 'TIENE UNA C', 'TIENE AMBAS LETRAS'
select 
ename,
case 
	when ename like '%A%C%' or ename like '%C%A%' then 'TIENE AMBAS'
	when ename like '%A%' then 'TIENE UNA A'
	when ename like '%C%' then 'TIENE UNA C'
	else 'NINGUNA'
end as letras
from emp;

#28. Mostrar un listado con el nombre, fecha de entrada y la cadena 'PRIMER TRAMO', si entraron a trabajar desde Enero a Junio, 'SEGUNDO TRAMO' si entraron a trabajar desde Julio a Octubre 'TERCER TRAMO' y en caso contrario.
select 
ename,
hiredate,
case 
	when month(hiredate) between 1 and 6 then 'PRIMER TRAMO'
	when month(hiredate) between 7 and 10 then 'SEGUNDO TRAMO'
	else 'TERCER TRAMO'
end as tramos
from emp
end;

#29. Mostrar la suma del salario de los empleados cuyo salario es superior a 1.800.
select sum(sal) from emp where sal > 1800;

#30. ¿Cuantos oficios diferentes hay en el dpto 10?.
select count(distinct job) from emp where deptno=10;

#31. Mostrar la media del salario de los empleados cuyo oficio tenga 7 caracteres.
select avg(sal) as medio from emp where length(job) = 7;
