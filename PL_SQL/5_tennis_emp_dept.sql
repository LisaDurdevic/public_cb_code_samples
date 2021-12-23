/* TENNIS */
/* output 1 */
SELECT year_joined, count(*) as "new player"
FROM players
GROUP BY year_joined;

/* output 2 */
SELECT 
    COUNT (paymentno) as "Number", 
    round(AVG(amount),0) "avg Amount",
    playerno "Player"
FROM penalties
GROUP BY playerno
ORDER BY 
    "Number" DESC,
    "Player";

/* output 3 */
SELECT COUNT(*) penalties
FROM penalties
WHERE pen_date < '01-01-83';

SELECT COUNT (*) penalties
FROM penalties
WHERE 
    EXTRACT(YEAR from TO_DATE(pen_date, 'DD-MM-YYYY')) 
    < 83;

/* output 4 */
SELECT DISTINCT town
FROM players
GROUP BY town
HAVING 
    COUNT (town) > 4;

/* output 5 */
SELECT playerno
FROM penalties
GROUP BY playerno
HAVING 
    SUM(amount) > 150;

/* output 6 */
SELECT name, initials
FROM players
WHERE playerno IN (
    SELECT playerno
    FROM penalties
    GROUP BY playerno
    HAVING 
        COUNT(*) > 1
    );

/* output 7 */
SELECT 
    EXTRACT(YEAR from TO_DATE(pen_date, 'dd-MM-yyyy')) 
        as year
FROM penalties
GROUP BY 
    EXTRACT(YEAR from TO_DATE(pen_date, 'dd-MM-yyyy'))
HAVING 
    COUNT(
        EXTRACT(YEAR from TO_DATE(pen_date, 'dd-MM-yyyy'))) 
        = 2;

/* output 8 */
SELECT name, initials
FROM players
WHERE playerno IN (
    SELECT playerno
    FROM penalties
    WHERE amount > 40
    );

/* output 9 */
SELECT name, initials
FROM players
WHERE playerno = (
    SELECT playerno
    FROM penalties
    GROUP BY playerno
    HAVING 
        SUM(amount) >= ALL (
            SELECT SUM(amount)
            FROM penalties
            GROUP BY playerno)
    );
    
/* output 10 */
SELECT 
    EXTRACT(YEAR from pen_date) 
        as year,
    COUNT(*) penalties
FROM penalties
GROUP BY 
    EXTRACT(YEAR from pen_date)
HAVING 
    COUNT(*) >= ALL (
        SELECT COUNT(*)
        FROM penalties
        GROUP BY 
            EXTRACT(YEAR from pen_date)
        );

/* output 11 */
SELECT playerno, teamno, (won - lost) quote
FROM matches
ORDER BY matchno DESC;

/* EMP_DEPT */
/* output 12 */
SELECT *
FROM emp
WHERE deptno = 30
ORDER BY sal DESC;

/* output 13 */
SELECT *
FROM emp
ORDER BY job, sal;

/* output 14 */
SELECT *
FROM emp
ORDER BY 
    EXTRACT(YEAR from TO_DATE(hiredate, 'dd-MM-yy')) DESC, 
    ename;

/* output 15 */
SELECT *
FROM emp
WHERE job = 'SALESMAN'
ORDER BY (comm/sal) DESC;

/* output 16 */
SELECT deptno, ROUND(AVG(sal)) "avg sal"
FROM emp
GROUP BY deptno
ORDER BY deptno;

/* output 17 */
SELECT job, ROUND(12*AVG(sal)) annual
FROM emp
GROUP BY job
HAVING COUNT(*) > 2;

/* output 18 */
SELECT deptno
FROM emp
WHERE job 
    NOT IN ('PRESIDENT', 'MANAGER')
GROUP BY deptno
HAVING COUNT(*) >= 2;

/* output 19 */
SELECT 
    ROUND(AVG(sal)) "avg sal", 
    ROUND(AVG(comm)) "avg comm"
FROM emp
WHERE deptno = 30;