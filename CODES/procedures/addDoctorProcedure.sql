SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE addDoctor
    (doctor_name IN varchar2, department IN varchar2, visit_time IN varchar2, designation IN varchar2)
    IS

num NUMBER := 0;

CURSOR cursor IS
    SELECT doc_id FROM doctor;

BEGIN

    OPEN cursor;
    LOOP

        EXIT WHEN cursor%NOTFOUND;
        num := num + 1;
    END LOOP;

    IF num = 0 :
        DBMS_OUTPUT.PUT_LINE('NO DOCTOR');
    ELSE:
        DBMS_OUTPUT.PUT_LINE('DOCTOR');

    END IF;

    

END;
/