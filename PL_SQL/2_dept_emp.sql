/* simple output */
SELECT dname as "Department Name" FROM dept;

/* date output */
SELECT empno, ename, TO_CHAR(hiredate, 'dd. MM YY') FROM emp; 

/* date output 2 */
SELECT ename, sysdate - hiredate as days FROM emp;
SELECT ename, trunc(sysdate) - hiredate as days FROM emp;

/* simple output 2 */
SELECT DISTINCT job FROM emp;

/* minmax output */
SELECT min(sal) as min, max(sal) as max, trunc(avg(sal)) as average FROM emp;
SELECT min(sal) as min, max(sal) as max, avg(sal) as average FROM emp;

/* count 1 how many employees*/
SELECT COUNT (ename) FROM emp;
SELECT max(ROWNUM) FROM emp;
SELECT COUNT (*) FROM emp;

/* count 2 how many different jobs */
SELECT COUNT (DISTINCT job) FROM emp;