use rrhh;
#POR FRANCESCO FEVOLI CHACÓN - 22/05/2024
#1. 
select substring(country_name, 1, 1) as vocal, count(country_name) from country
where country_name like 'A%' or country_name like 'E%' or country_name like 'I%' or country_name like 'o%' or country_name like 'U%'
group by vocal;

#2. 
select department_id, replace(department_name, 'r', 'R') as Nombre, location_id
from department d
where LCASE(department_name) like '%o%o%';

#3. 
select country_id, country_name,
case region_id
when 10 then 'EUROPA'
when 20 then 'AMERICA'
end as REGION
from country
where region_id = 10 or region_id = 20;

#4. 
select concat(e1.last_name, ', ', e1.first_name) as SUPERVISOR, count(e2.employee_id) as EMPLEADOS
from employee e1
join employee e2 on e1.employee_id = e2.manager_id
where substr(e2.last_name, length(e2.last_name), 1) = substr(e1.last_name, length(e1.last_name), 1)
group by concat(e1.last_name, ', ', e1.first_name)
order by count(e2.employee_id) desc;

#5. 
select concat(e1.last_name, ', ', SUBSTR(e1.first_name, 1, 1), '.') as EMPLEADO, j.job_title as TRABAJO
from employee e1
join job j on e1.job_id = j.job_id
left join employee e2 on e1.employee_id = e2.manager_id
where e2.manager_id is null
order by job_title; 

#6. 
select j.job_title as TRABAJO, l.city as CIUDAD
from job j
join employee e on e.job_id = j.job_id
join department d on e.department_id = d.department_id
join location l on d.location_id = l.location_id
group by j.job_title, l.city
having count(e.employee_id) = 1
order by l.city, job_title asc;

#7. 
select concat(e1.last_name, ', ', e1.first_name) as EMPLEADOS, date_format(e1.hire_date, '%d-%m-%Y') as COMIENZO, department_name as DEPARTAMENTO
from employee e1
join department d on e1.department_id = d.department_id
where month(e1.hire_date) between 0 and 6;

#8. 
select d.department_name as DEPARTMENT, count(employee_id) as EMPLEADOS
from job_history jh
join department d on jh.department_id = d.department_id
where timestampdiff(year, start_date, end_date) < 1
group by department_name
having count(employee_id) > 1;

#9. 
select c.country_name, count(e.employee_id)
from country c 
join location l on l.country_id = c.country_id 
join department d on d.location_id = l.location_id 
join employee e on e.department_id = d.department_id
group by c.country_name
having avg(e.salary) >= 3000 and max(e.salary) <= 15000;

#10. 
select d.department_name as departamento, year(start_date) as anyo, sum(TIMESTAMPDIFF(hour, start_date, end_date)) as horas
from department d
join employee e on e.department_id = d.department_id 
join job_history jh on jh.employee_id = e.employee_id
where start_date between '2005-01-01' and '2015-12-31'
group by anyo, department_name
having count(jh.employee_id) >= 1;
#Deberían salir 5 filas, salen 6. No sé por qué lol