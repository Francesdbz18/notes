create database emple;
use emple;

CREATE TABLE DEPT (
    DEPTNO INT PRIMARY KEY,
    DNAME VARCHAR(14),
    LOC VARCHAR(13)
);

CREATE TABLE EMP (
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR INT,
    HIREDATE DATE,
    SAL DEC(7,2),
    COMM DEC(7,2),
    DEPTNO INT
);

ALTER TABLE EMP ADD CONSTRAINT fk_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO);

INSERT INTO DEPT VALUES
    (10,'ACCOUNTING','NEW YORK'),
    (20,'RESEARCH','DALLAS'),
    (30,'SALES','CHICAGO'),
    (40,'OPERATIONS','BOSTON');

INSERT INTO EMP VALUES
    (7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
    (7499,'ALLEN','SALESMAN',7698,'1981-2-20',1600,300,30),
    (7521,'WARD','SALESMAN',7698,'1981-2-22',1250,500,30),
    (7566,'JONES','MANAGER',7839,'1981-4-2',2975,NULL,20),
    (7654,'MARTIN','SALESMAN',7698,'1981-9-28',1250,1400,30),
    (7698,'BLAKE','MANAGER',7839,'1981-5-1',2850,NULL,30),
    (7782,'CLARK','MANAGER',7839,'1981-6-9',2450,NULL,10),
    (7788,'SCOTT','ANALYST',7566,'1987-7-13',3000,NULL,20),
    (7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
    (7844,'TURNER','SALESMAN',7698,'1981-9-8',1500,0,30),
    (7876,'ADAMS','CLERK',7788,'1987-7-13',1100,NULL,20),
    (7900,'JAMES','CLERK',7698,'1981-12-3',950,NULL,30),
    (7902,'FORD','ANALYST',7566,'1981-12-3',3000,NULL,20),
    (7934,'MILLER','CLERK',7782,'1982-1-23',1300,NULL,10);

CREATE TABLE BONUS (
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    SAL DEC(7,2),
    COMM DEC(7,2)
);

CREATE TABLE SALGRADE (
    GRADE INT,
    LOSAL INT,
    HISAL INT
);

INSERT INTO SALGRADE VALUES (1,700,1200),
    (2,1201,1400),
    (3,1401,2000),
    (4,2001,3000),
    (5,3001,9999);

COMMIT;

-- 1 ---
select * from emp where ename < "Martin" order by ename asc;
-- 2 --
select ename, job, sal from emp order by job, sal desc;
-- 3 --
select ename, coalesce(sal+comm, sal) as TOTAL from emp where (sal+comm) > 1800;
-- 4 --
select ename, job from emp where deptno = 30 and job not like "Salesman";
-- 5 --
select ename, job from emp where deptno = 10 and job not like "Manager" and job not like "President";
-- 6 --
select ename, job, deptno from emp where deptno > 20 and (job like "Analyst" or job like "Clerk" or job like "Manager" or job like "President");
-- 7 --
select * from emp where HIREDATE between '1981-01-01' and '1981-12-31';
-- 8 --
select ENAME from emp where ename between 'James' and 'Scott' order by ename asc;
-- 9 --
select ename, HIREDATE from emp where HIREDATE not between '1981-01-01' and '1981-12-31' order by HIREDATE ;
-- 10 --
select ename, job, comm from emp where deptno = 30 and comm is not null;
-- 11 --
select ename, job from emp where ename like '%E%';
-- 12 --
select ename, job from emp where ename like '%A%S%';
-- 13 --
select ename, job from emp where ename like '%A%S%' or ename like '%S%A%';
-- 14 --
select concat(ename,' is a ',job) from emp;
-- 15 --
select * from emp where mgr not like 7782 and mgr not like 7839;
-- 16 --
select ename, sal, round(sal*1.0125,2) as aumento from emp;
-- 17 --
select avg(comm) from emp;
-- 18 --
select distinct job from emp;
-- 19 --
select avg(ifnull(comm, 0)) as comm from emp;
-- 20 --
#Ni puta idea, mi negro.