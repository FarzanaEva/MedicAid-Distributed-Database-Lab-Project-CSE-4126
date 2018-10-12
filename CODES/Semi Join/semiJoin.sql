set serveroutput on;

DECLARE

    doc_name varchar2(50);

    CURSOR doc_cur is 
    SELECT doc_name FROM doctor@site_3 doc INNER JOIN hospital@site_3 hos ON doc.hospital_id = hos.hospital_id;

    CURSOR doc_cur_semi_join is 
    SELECT doc_name FROM doctor@site_3 doc JOIN (hospital@site_3 hos LEFT JOIN 
    (select hospital_id from Doctor@site_3) doc3  ON doc3.hospital_id = hos.hospital_id)  ON doc.hospital_id = hos.hospital_id;

begin

    DBMS_OUTPUT.PUT_LINE('Without semi join applied:'|| chr(10));

    OPEN doc_cur;

    Loop

        FETCH doc_cur INTO doc_name;
        EXIT WHEN doc_cur%notfound;

        DBMS_OUTPUT.PUT_LINE(doc_name);

    end loop;

    CLOSE doc_cur;

    OPEN doc_cur_semi_join;

    DBMS_OUTPUT.PUT_LINE(chr(10) || 'With semi join applied:'|| chr(10));
    Loop

        FETCH doc_cur_semi_join INTO doc_name;
        EXIT WHEN doc_cur_semi_join%notfound;

        DBMS_OUTPUT.PUT_LINE(doc_name);

    end loop;

    CLOSE doc_cur_semi_join;

end;
/