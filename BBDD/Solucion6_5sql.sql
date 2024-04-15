use emple;

#1.	Muestra los números de departamento, número de empleados, máximo salario, mínimo salario y salario medio de cada uno de los departamentos. 
select deptno, count(empno), max(sal), min(sal), avg(sal) from emp group by DEPTNO;


#2.	Muestra los diversos trabajos y el número total de empleados con cada grupo de trabajo que ganen más de 1500.
select distinct job, count(empno)  from emp where (sal > 1500) group by job;


#3.	Muestra los números de departamento y el salario total de los departamentos que tengan más de cuatro empleados.
select deptno, sum(sal) from emp group by deptno having count(*) > 4;


#4.	Crear un informe en el que se muestre el número de ‘CLERK’ y ‘SALESMAN’ se han contratado por cada mes del año. El informe debe estar ordenado por el mes del año. 
select extract(MONTH from hiredate) as 'Mes', count(*) from emp where job like 'CLERK' or 'SALESMAN' group by extract(month from hiredate) order by extract(month from hiredate);


#5.	Análogamente al anterior, mostrar para cada mes de treinta días cuantos empleados de cada oficio se han contratado.
select extract(MONTH from hiredate), job, count(empno) from emp where DAY(LAST_DAY(HIREDATE)) < 31 and DAY(LAST_DAY(HIREDATE)) > 28 group by extract(month from hiredate), job;


#6.	Mostrar un informe que muestre para cada número de letras del nombre de empleado, cuantos empleados hay y su salario medio redondeado a dos decimales.
select char_length(ename), count(ename), round(avg(sal), 2) from emp group by char_length(ename); 


#7.	Visualizar los números de departamento con más de tres empleados en cada departamento cuyo gasto salarial total del departamento sea mayor que 10,000.
select deptno, sum(sal) from emp group by deptno having sum(sal) > 10000 and count(ENAME) > 3;


#8.	Mostrar para cada uno de los empleados que tiene subordinados a su cargo que número de subordinados y la suma total de sus salarios. El listado debe mostrar las cantidades formateadas y debe estar ordenado por número de subordinados descendentemente.
select count(*), round(sum(sal),2), mgr from emp where mgr is not null group by mgr;


#9.	Mostrar cuantos empleados de cada departamento tienen superior.
select deptno, count(*) from emp where mgr is not null group by deptno order by count(*) desc;


#10.	Mostrar cuantos empleados de cada oficio han entrado en cada año. Mostrar el año con cuatro cifras y el listado ordenado por año y por oficio.
select year(HIREDATE) as 'AÑO', count(*), job from emp group by job, year(hiredate) order by year(HIREDATE), job;
