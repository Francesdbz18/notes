use emple;

#1. Obtener el nombre completo y la antigüedad de los empleados (en años y meses) que tienen más de 10 años de servicio
select ename, concat(year(now()) - year(hiredate), ' años, ', month(hiredate), ' meses') as Antigüedad from emp where year(HIREDATE) < (year(now()) - 10);

#2. Obtener el nombre del departamento junto con el número total de caracteres en los nombres de todos los empleados en ese departamento.
select dname, sum(char_length(e.ename)) from dept d
join emp e on d.DEPTNO = e.DEPTNO
group by dname;

#3. Mostrar el nombre completo y la fecha de contratación de los empleados que fueron contratados en el mismo día que otro empleado en el mismo departamento.
select e1.ename, e1.hiredate
from emp e1
join emp e2 on e2.DEPTNO = e1.DEPTNO 
where e1.hiredate = e2.hiredate and e1.EMPNO != e2.EMPNO
order by e1.hiredate;
-- ta bien :)

#4. Obtener el nombre del departamento junto con el salario máximo y mínimo de los empleados, excluyendo aquellos empleados cuyo salario esté fuera del rango salarial definido para ese departamento en la tabla SALGRADE.
select d.dname, max(e.sal), min(e.sal)
from dept d
join emp e on d.deptno = e.DEPTNO
join salgrade s on e.sal between s.LOSAL and s.HISAL
group by d.dname;

#5. Mostrar el nombre completo y el salario de los empleados que fueron contratados en el último trimestre del año.
select ename, sal
from emp
where month(hiredate) between 10 and 12;

#6. Obtener el nombre del departamento junto con el salario promedio de los empleados en cada departamento, mostrando todos los departamentos incluso si no tienen empleados, y ordenarlos por el salario promedio de manera descendente, excluyendo aquellos departamentos donde todos los empleados ganen menos de 3000.
select d.dname, avg(e.sal)
from dept d
left join emp e on d.DEPTNO = e.deptNO 
group by d.DNAME
having max(e.sal) >= 3000
order by avg(e.sal);

#7. Mostrar el nombre y el trabajo con el formato ‘nombre, trabajo’ y eliminando los posibles espacios en blancos que existan delante del nombre y el salario de los empleados que tienen el salario más alto en su departamento.
select if(e.sal = max(e.sal), concat(trim(e.ename), ', ', trim(e.job)), null)
from emp e
join emp e2 on e2.DEPTNO = e.deptno
where e2.EMPNO != e.EMPNO
group by e.deptno;

-- ta mal ;(