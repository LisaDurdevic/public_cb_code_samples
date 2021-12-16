/* TENNIS ------------------------------------------------ */
/* output 1 ---------------------------------------------- */
SELECT *
FROM players p
WHERE EXISTS (
    SELECT playerno
    FROM matches
    GROUP BY playerno
    HAVING COUNT(DISTINCT teamno) > 1
        AND matches.playerno = p.playerno
    )
ORDER BY playerno;

/* output 2 ---------------------------------------------- */
SELECT name, initials
FROM players p
WHERE NOT EXISTS (
    SELECT *
    FROM penalties
    WHERE penalties.playerno = p.playerno
    )
ORDER BY name;
    
/* output 3 ---------------------------------------------- */
SELECT *
FROM players p
WHERE EXISTS (
    SELECT playerno
    FROM penalties
    WHERE amount > 80
        AND penalties.playerno = p.playerno
    )
ORDER BY playerno;
    
/* output 4 ---------------------------------------------- */
SELECT *
FROM players, penalties
WHERE players.playerno = penalties.playerno
    AND amount > 80
ORDER BY players.playerno;
    
/* EMP_DEPT ---------------------------------------------- */
/* output 5 ---------------------------------------------- */
SELECT *
FROM emp em
WHERE sal > (
    SELECT avg(sal)
    FROM emp
    WHERE deptno = em.deptno
    GROUP BY deptno
    );
    
/* output 6 ---------------------------------------------- */
SELECT *
FROM dept d
WHERE EXISTS (
    SELECT DISTINCT deptno
    FROM emp
    WHERE emp.deptno = d.deptno
    )
ORDER BY deptno;
    
/* output 7 ---------------------------------------------- */
SELECT *
FROM dept d
WHERE EXISTS (
    SELECT deptno
    FROM emp
    WHERE sal > 1000
        AND emp.deptno = d.deptno
    )
ORDER BY deptno;
    
/* output 8 ---------------------------------------------- */
SELECT *
FROM dept d
WHERE NOT EXISTS (
    SELECT deptno
    FROM emp
    WHERE sal <= 1000
        AND emp.deptno = d.deptno
    )
    AND EXISTS (
        SELECT deptno
        FROM emp
        WHERE emp.deptno = d.deptno)
ORDER BY deptno;