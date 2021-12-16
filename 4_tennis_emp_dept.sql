/* TENNIS */
/* output 1 */
SELECT teamno 
FROM teams 
WHERE playerno != 27;

/* output 2 */
SELECT DISTINCT matches.playerno, players.name, players.initials 
FROM players, matches 
WHERE matches.won >= 1 
    AND players.playerno = matches.playerno 
ORDER BY matches.playerno;

/* output 3 */
SELECT DISTINCT penalties.playerno, players.name 
FROM penalties, players 
WHERE penalties.playerno = players.playerno 
ORDER BY penalties.playerno;

/* output 4 */
SELECT DISTINCT penalties.playerno, players.name 
FROM penalties, players 
WHERE penalties.playerno = players.playerno 
    AND penalties.amount > 50 
ORDER BY penalties.playerno;

/* output 5 */
SELECT playerno, name, year_of_birth 
FROM players 
WHERE year_of_birth = (
    SELECT year_of_birth 
    FROM players 
    WHERE name = 'Parmenter' 
        AND initials = 'R'
    );

/* output 6 */
SELECT playerno, name, year_of_birth 
FROM players 
WHERE year_of_birth = (
    SELECT min(year_of_birth) 
    FROM players 
    WHERE town = 'Stratford'
    );

/* EMP_DEPT */
/* output 7 */
SELECT dept.deptno, dept.dname, dept.loc
FROM dept, emp
WHERE emp.deptno (+) = dept.deptno
GROUP BY dept.deptno, dept.dname, dept.loc
HAVING 
    COUNT (emp.deptno) = 0;

SELECT deptno 
FROM dept
MINUS
SELECT deptno
FROM emp;

/* output 8 */
SELECT *
FROM emp
WHERE job = (
    SELECT job
    FROM emp
    WHERE ename = 'JONES'
    );

/* output 9 */
SELECT *
FROM emp
WHERE sal > (
    SELECT MIN(sal)
    FROM emp
    WHERE deptno = 30
    );

/* output 10 */
SELECT *
FROM emp
WHERE sal > (
    SELECT MAX(sal)
    FROM emp
    WHERE deptno = 30
    );

/* output 11 */
SELECT *
FROM emp
WHERE deptno = 10
    AND job NOT IN (
        SELECT DISTINCT job
        FROM emp
        WHERE deptno = 30
        );

/* output 12 */
SELECT *
FROM emp
WHERE sal = (
    SELECT MAX(sal)
    FROM emp
    );
    
SELECT *
FROM emp
WHERE sal = (
    SELECT MAX(sal)
    FROM emp
    WHERE job != 'PRESIDENT');