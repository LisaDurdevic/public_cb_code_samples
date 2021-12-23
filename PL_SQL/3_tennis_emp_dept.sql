/* TENNIS QUERIES */
/* output 1 */
SELECT playerno, name
FROM players
WHERE year_of_birth > 1960
ORDER BY playerno;

/* output 2 */
SELECT playerno, name, town
FROM players
WHERE sex = 'F'
    AND town != 'Stratford'
ORDER BY playerno;

/* output 3 */
SELECT playerno
FROM players
WHERE year_joined 
    BETWEEN 1970 
        AND 1980
ORDER BY playerno;

/* output 4 */
SELECT playerno "PlayerId", name "Name", year_of_birth "Year of Birth"
FROM players
WHERE mod(year_of_birth, 4) = 0
    AND mod(year_of_birth, 100) != 0
    OR mod(year_of_birth, 400) = 0
ORDER BY playerno;

/* output 5 */
SELECT paymentno
FROM penalties
WHERE amount 
    BETWEEN 50 
        AND 100
ORDER BY paymentno;

/* output 6 */
SELECT playerno "PlayerId", name "Name"
FROM players
WHERE town != 'Stratford'
    AND town != 'Douglas'
ORDER BY playerno;

/* output 7 */
SELECT playerno "PlayerId", name "Name"
FROM players
WHERE name
    LIKE '%is%'
ORDER BY playerno;

/* output 8 */
SELECT *
FROM players
WHERE leagueno is null
ORDER BY playerno;

/* EmpDeptQueries */
/* output 9 */
SELECT *
FROM emp
WHERE comm > sal
ORDER BY comm;

/* output 10 */
SELECT *
FROM emp
WHERE deptno = 30
    AND sal >= 1500
ORDER BY sal;

/* output 11 */
SELECT *
FROM emp
WHERE deptno != 30
    AND job = 'MANAGER'
ORDER BY deptno;

/* output 12 */
SELECT *
FROM emp
WHERE deptno = 10
    AND job != 'CLERK'
    AND job != 'MANAGER'
    ;

/* output 13 */
SELECT *
FROM emp
WHERE sal 
    BETWEEN 1200
        AND 1300
ORDER BY sal;

/* output 14 */
SELECT *
FROM emp
WHERE ename
    LIKE 'ALL__'
ORDER BY ename;

/* output 15 */
SELECT empno, ename, (
    CASE WHEN comm > 0
        THEN comm+sal
        ELSE sal
        END) total
FROM emp
ORDER BY total;

/* output 16 */
SELECT *
FROM emp
WHERE comm > (sal*0.25)
ORDER BY sal;

/* output 17 */
SELECT ROUND(AVG(sal), 2)
FROM emp;

/* output 18 */
SELECT COUNT(comm)
FROM emp
WHERE comm > 0;

/* output 19 */
SELECT COUNT(DISTINCT job)
FROM emp
WHERE deptno = 30;

/* output 20 */
SELECT COUNT(*)
FROM emp
WHERE deptno = 30;

/* output 21 */
SELECT *
FROM emp
WHERE TO_DATE(hiredate, 'dd-MM-yy')
    BETWEEN '04-01-81'
        AND '15-04-81';