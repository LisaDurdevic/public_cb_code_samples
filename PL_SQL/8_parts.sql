/* PARTS ------------------------------------------------- */
/* creating ---------------------------------------------- */

/* hierarchy p3 and p9 ----------------------------------- */
SELECT super, LEVEL "LEVEL"
FROM parts
START WITH super = 'P3'
CONNECT BY  
    PRIOR super = sub
UNION
    SELECT super, LEVEL
    FROM parts
    START WITH super = 'P9'
    CONNECT BY  
        PRIOR super = sub  
ORDER BY "LEVEL";

SELECT sub, super, LEVEL "LEVEL"
FROM parts
START WITH sub = (
    SELECT super
    FROM parts
    WHERE sub = 'P3'
        OR sub = 'P9'
    GROUP BY super)
CONNECT BY
    PRIOR sub = super
ORDER BY "LEVEL", super, sub;

/* hierarchy level p12 ----------------------------------- */
SELECT max(l) "Level"
FROM (
    SELECT LEVEL l
    FROM parts
    START WITH sub = 'P12'
    CONNECT BY 
        PRIOR super = sub
    );

/* parts to P1 > 20$ ----------------------------------- */
SELECT COUNT(*)
FROM (
    SELECT sub
    FROM parts
    WHERE price > 20
    START WITH super = 'P1'
    CONNECT BY 
        PRIOR sub = super
    );
    
/* EMP_DEPT ---------------------------------------------- */
/* direct_indirect emp of JONES, without JONES ----------- */
SELECT *
FROM emp
START WITH mgr = (
    SELECT empno
    FROM emp
    WHERE ename = 'JONES')
CONNECT BY
    PRIOR empno = mgr;

/* direct_indirect superiors of SMITH including SMITH ----------- */
SELECT *
FROM emp
START WITH empno = (
    SELECT empno
    FROM emp
    WHERE ename = 'SMITH')
CONNECT BY
    PRIOR mgr = empno;

/* avg sal each hierarchy level -------------------------- */
SELECT
    LEVEL,
    ROUND(AVG(sal)) as avg
FROM emp
START WITH mgr is null
CONNECT BY 
    PRIOR empno = mgr
GROUP BY level
ORDER BY level;