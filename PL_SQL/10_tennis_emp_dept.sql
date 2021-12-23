SET AUTOCOMMIT OFF;

DELETE FROM penalties;
insert into penalties values (1,6,'08-12-80',100.0);
insert into penalties values (2,44,'05-05-81',75.0);
insert into penalties values (3,27,'10-09-83',100.0);
insert into penalties values (4,104,'08-12-84',50.0);
insert into penalties values (5,44,'08-12-80',25.0);
insert into penalties values (6,8,'08-12-80',25.0);
insert into penalties values (7,44,'30-12-82',30.0);
insert into penalties values (8,27,'12-12-84',75.0);

COMMIT;

DELETE FROM emp;
alter table emp disable constraint EMP_SELF_KEY;
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'17-12-80',800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'20-02-81',1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'22-02-81',1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'2-04-81',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'28-09-81',1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'1-05-81',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'9-06-81',2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'09-12-82',3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'17-11-81',5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'8-08-81',1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'12-01-83',1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'3-12-81',950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'3-12-81',3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'23-01-82',1300,NULL,10);
alter table emp enable constraint EMP_SELF_KEY;

COMMIT;

/* TENNIS */
/* 1 */

BEGIN
    INSERT INTO players
    VALUES (
        200,
        'Durdevic',
        'L',
        1991,
        'F',
        2021,
        'Salzburger St',
        70,
        4030,
        'Linz',
        '5555-25358',
        null);
COMMIT;
END;


/* 2 */
BEGIN
    UPDATE players
    SET sex = 'W'
    WHERE playerno = 200;
COMMIT;
END;

/* 3 */   
DECLARE
    avg_pen int;
BEGIN
    SELECT AVG(amount)
        INTO avg_pen
    FROM penalties;
    
    UPDATE penalties
    SET amount = amount * 1.2
    WHERE amount > avg_pen;
COMMIT;
END;

/* 4 */
DECLARE
    new_street varchar2(15);
    new_houseno varchar2(4);
    new_postcode varchar2(6);
    new_town varchar(10);
BEGIN
    SELECT street, houseno, postcode, town
        INTO new_street, new_houseno, new_postcode, new_town
        FROM players
        WHERE playerno = 6;
        
    UPDATE players
    SET street = new_street,
        houseno = new_houseno,
        postcode = new_postcode,
        town = new_town        
    WHERE playerno = 95;
COMMIT;
END;

/* 5 */
BEGIN
    DELETE FROM penalties
    WHERE playerno = 44
        AND EXTRACT(YEAR from pen_date) = '1980';
COMMIT;
END;

/* 6 */
BEGIN
    SAVEPOINT task_6; 

    /* 7 */

    DELETE FROM penalties
    WHERE paymentno IN (
        SELECT paymentno
        FROM penalties NATURAL JOIN matches
        WHERE teamno = 2);
    
    
    /* 8 */
    ROLLBACK TO SAVEPOINT task_6;
    COMMIT;
END;

/* EMP_DEPT */
/* 9 */

SELECT ROUND(AVG(sal) *0.8)
FROM emp;

DECLARE
    avg_sal number(7,2);
BEGIN
    SELECT AVG(sal) *0.8
        INTO avg_sal
    FROM emp;
    
    UPDATE emp
    SET sal = avg_sal
    WHERE sal < avg_sal;
COMMIT;
END;

SELECT MIN(sal)
FROM emp;

/* 10 */
BEGIN
    UPDATE emp
    SET mgr = null
    WHERE empno IN (
    SELECT empno 
        FROM emp
        WHERE 40 > (EXTRACT (YEAR from (sysdate)) - EXTRACT (YEAR from (hiredate)) - 1900)
        );
        
COMMIT;   

    DELETE FROM emp
    WHERE empno IN (
        SELECT empno 
        FROM emp
        WHERE 40 <= (EXTRACT (YEAR from (sysdate)) - EXTRACT (YEAR from (hiredate)) - 1900)
        );
COMMIT;
END;  
        
/* 11 */
DROP SEQUENCE number_seq;

CREATE SEQUENCE number_seq
    START WITH 50
    INCREMENT BY 10
    NOCACHE
    NOCYCLE;

COMMIT;

/* 12 */
DECLARE
    new_deptno NUMBER(2,0) := number_seq.nextval;
    new_dname VARCHAR2(14) := 'HTL';
    new_loc VARCHAR2(13) := 'LEONDING';
BEGIN    
    INSERT INTO dept
    VALUES (new_deptno, new_dname, new_loc);
COMMIT;
END;