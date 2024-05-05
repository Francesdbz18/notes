use rrhh;

-- PARTE 1: RESOLUCIÓN DE CONSULTAS --
#1. Mostrar el nombre del empleado en formato “Apellido, Nombre” con el nombre de columna "Empleado", código de trabajo y el salario de los empleados que son Manager (su código de trabajo acaba en ‘MAN’ o ‘MGR’) y cuyo salario sea mayor de 12000 ordenados alfabéticamente por apellido.
select concat(last_name, ', ', first_name) as Empleado, job_id, salary
from employee
where salary > 12000 and job_id like '%MAN' OR job_id like '%MGR' 
order by last_name;

#2. Mostrar el nombre del empleado en formato "Nombre, Apellido” con el nombre de columna "Empleado", el salario, porcentaje de comisión (0.20 es el 20%) con el título '% Comision' (debe aparecer sin decimales), la comisión correspondiente y salario total (salario + comisión) para los empleados cuyo salario sea superior a 10000. Para aquellos empleados que no tengan comisión se debe de indicar 'NO TIENE' tanto en la columna correspondiente al porcentaje de la comisión como en la comisión resultado de aplicar dicho porcentaje. Se debe de ordenar el resultado de menor a mayor salario total. Todos los resultados deben aparecer sin decimales. 
select concat(first_name, ', ', last_name) as Empleado, salary, 
case when commission_pct is not null then concat(round(commission_pct*100), '%') else 'NO TIENE' end  as '% Comision',
case when commission_pct is not null then floor(salary * commission_pct) else 'NO TIENE' end as Comision,
salary + coalesce(round(salary * commission_pct), 0) as Salario_Total
from employee
where salary > 10000
order by Salario_Total;

#3. Mostrar un listado con el código de empleado, fecha de contratación en formato ‘DDMMM-YY’ y una columna que muestre si el día uno de febrero de 2015 llevaba más de 2 años y tres meses con el nombre de columna “BONUS”, indicando "BONUS" en el caso de tener o "NO" en caso contrario para todos los empleados que ganen más de 12000 y hayan entrado antes del 1 de mayo de 2015. 
select employee_id as Código, date_format(hire_date, '%d%b-%y') as Fecha_Contratación,
if(date_add(hire_date, interval 15 MONTH) < '2015-02-01', 'BONUS', 'NO') as BONUS
from employee
where salary > 12000 AND hire_date < '2015-05-01';

#4. Mostrar un listado que muestre el código de empleado, apellido, salario y una columna que se llame “STARS” que muestre una cadena formada por una estrella (asterisco *) por cada 5000 unidades de salario que tiene el empleado (ejemplo: si alguien tiene de salary = 10000, se mostrará en dicha columna **), si gana menos de 5000 debe mostrar la cadena ‘#’. Ordenar el resultado de mayor a menor salario (salary). 
select employee_id, last_name, salary,
case when salary < 5000 then '#' else rpad('*', floor(salary/5000), '*') end as STARS
from employee
order by salary desc;

#5. Mostrar un listado que contenga el código de empleado, su apellido en mayúscula, longitud de su apellido y el nombre del empleado de tal manera que las 4 primeras letras del nombre y la última estén en minúsculas y el resto en mayúsculas, para todos los empleados cuya la longitud de su nombre esté entre seis y nueve caracteres. 
select employee_id as Código, upper(last_name) as Apellido,
length(last_name),
concat(lower(left(first_name, 4)), upper(substring(first_name, 5, length(first_name) - 5)), lower(right(first_name, 1))) as nombreMod
from employee
where length(first_name) between 6 and 9;

#6. Mostrar cuántos países empiezan por A y cuantos por C. No se puede usar CASE-WHEN ni LIKE. 
select 
sum(if(substring(country_name, 1, 1) = 'A', 1, 0)) as A,
sum(if(substring(country_name, 1, 1) = 'C', 1, 0)) as C
from country;

#7. Mostrar para cada año, entre 2012 y 2015 el número de empleados, así como el salario más alto y el más bajo que ha tenido la empresa, para aquellos años en los que el salario más alto no excediera de 17000 y el más bajo fuera de al menos 2600. 
select 
year(hire_date) as Anyo,
count(employee_id) as nEmpleados,
max(salary) as salMax,
min(salary) as salMin
from employee
where year(hire_date) between 2012 and 2015
group by year(hire_date)
having max(salary) <= 17000 and min(salary) >= 2600;

#8. Mostrar el oficio, el salario medio de dicho oficio, y el número de empleados que hay de cada uno de ellos, cuyo salario medio está comprendido en la franja de 3000 a 5000. 
select job_id as Oficio, 
avg(salary) as salAvg, 
count(employee_id) as nEmpleados
from employee
group by job_id
having avg(salary) between 3000 and 5000;

#9. Mostrar un listado con el nombre del empleado (formato Apellido, Nombre), el salario y el nombre del departamento en el que trabaja para todos los empleados cuyo apellido empieza por la letra K. 
select concat(last_name, ', ', first_name) as Empleado, salary, department_name
from employee
join department on employee.department_id = department.department_id
where last_name like 'K%';

#10. Mostrar para cada nombre de departamento y para cada nombre de puesto de trabajo cuántos empleados hay. Tener en cuenta que es posible que haya empleados que no estén asignados a un departamento. 
select coalesce(d.department_name, 'Sin asignar') as Departamento,
j.job_title as Puesto,
count(e.employee_id) as nEmpleados
from employee e
left join department d on e.department_id = d.department_id
left join job j on e.job_id = j.job_id
group by d.department_name, j.job_title
order by d.department_name, j.job_title;

#11. Mostrar cuantos empleados y cuál es el salario medio de los empleados que trabajan en cada país (se debe de mostrar el nombre del país). Tener en cuenta que hay un empleado sin departamento asignado. Para los empleados sin país asignado se debe mostrar "Sin asignar".
select coalesce(c.country_name, 'Sin asignar') as País,
count(e.employee_id) as nEmpleados,
avg(e.salary) as salAvg
from employee e
left join department d on e.department_id = d.department_id
left join location l on d.location_id = l.location_id
left join country c on l.country_id = c.country_id 
group by c.country_name;

#12. Mostrar el apellido y el oficio de los empleados y su superior de aquellos empleados que no trabajan en el mismo país que su superior.
select e1.last_name as 'Apellido', 
e1.job_id as 'Oficio', 
e2.last_name as 'Superior',
e2.job_id as 'OficioSup'
from employee e1
join employee e2 on e1.manager_id = e2.employee_id
join department d1 on e1.department_id = d1.department_id
join department d2 on e2.department_id = d2.department_id
join location l1 on d1.location_id = l1.location_id
join location l2 on d2.location_id = l2.location_id 
where l2.country_id != l1.country_id;

-- PARTE 2: CREACIÓN DE CONSULTAS --

#1. Obtener una lista de empleados cuyo año de contratación sea superior a 2017. Mostrar los dos primeros caracteres del nombre y su apellido, separados con un punto y un espacio (ej. Cl. Vishney), así como la fecha de contratación en formato 'DD-MM-YY'.
select concat(SUBSTR(first_name, 1, 2), '. ', last_name) AS nombre,
       DATE_FORMAT(hire_date, '%d-%m-%y') AS Fecha_Contratación
from employee
where YEAR(hire_date) > 2017;

#2. Obtener el número total de empleados, el salario promedio, el salario máximo y el salario mínimo por departamento. Se deben incluir únicamente aquellos departamentos que tengan al menos 5 empleados y cuyo salario promedio sea superior a 5000. No se deben incluir empleados que no estén afiliados a un departamento.
select department_name as Departamento,
count(employee_id) as nEmpleados,
round (AVG(salary), 2) as salAvg,
max(salary) as salMax,
min(salary) as salMin
from employee e
JOIN department d on e.department_id = d.department_id
where e.department_id is not null
group by department_name
having count(employee_id) >= 5 and salAvg > 5000;

#3. Obtener el apellido, nombre de departamento y nombre de país de los empleados que son Manager.
select e.last_name as Apellido,
d.department_name as Departamento,
coalesce(c.country_name, 'Sin asignar') as País
from employee e
left join department d on e.department_id = d.department_id
left join location l on d.location_id = l.location_id 
left join country c on l.country_id = c.country_id
where e.job_id like '%MAN' OR e.job_id like '%MGR';
