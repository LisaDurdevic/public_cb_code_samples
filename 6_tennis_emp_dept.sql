/* TENNIS ------------------------------------------------ */
/* Output 1 ---------------------------------------------- */
SELECT name, initials, sum(won)
FROM players, matches
WHERE players.playerno = matches.playerno
GROUP BY name, initials;

/* Output 2 ---------------------------------------------- */
SELECT name, pen_date, amount 
FROM players, penalties
WHERE players.playerno = penalties.playerno
ORDER BY amount DESC;

/* Output 3 ---------------------------------------------- */
SELECT teamno, name captain
FROM teams, players
WHERE players.playerno = teams.playerno
ORDER BY teamno;

/* Output 4 ---------------------------------------------- */
SELECT name, won, lost
FROM matches, players
WHERE players.playerno = matches.playerno
    AND won > lost
ORDER BY name;

/* Output 5 ---------------------------------------------- */
SELECT 
    players.playerno, 
    players.name, 
    sum(NVL(amount, 0))
    as amount
FROM players, penalties
WHERE players.playerno = penalties.playerno (+)
GROUP BY players.playerno, players.name
ORDER BY amount DESC;

/* EMPT_DEPT --------------------------------------------- */
/* Output 6 ---------------------------------------------- */
SELECT ename, loc
FROM emp, dept
WHERE emp.deptno = dept.deptno
    AND ename
        LIKE 'ALLEN';
    
/* Output 7 ---------------------------------------------- */
SELECT *
FROM emp em
WHERE sal > (
    SELECT sal
    FROM emp
    WHERE empno = em.mgr
    );
    
/* Output 8 ---------------------------------------------- */
SELECT EXTRACT(YEAR from (hiredate)) year, COUNT(*) hired
FROM emp
GROUP BY EXTRACT(YEAR from (hiredate))
ORDER BY year;

/* Output 9 ---------------------------------------------- */
SELECT *
FROM emp
WHERE job IN (
    SELECT DISTINCT job
    FROM emp, dept
    WHERE emp.deptno = dept.deptno
        AND dept.loc = 'CHICAGO'
        )
    AND deptno != (
        SELECT deptno
        FROM dept
        WHERE loc = 'CHICAGO')
ORDER BY empno;