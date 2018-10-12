set serveroutput on;

-- Simplified Q : PJ doc_name (PJ DocId SL dept = “cardiology” JN DocId = DocId PJ DocId , doc_name Doctor6)

CREATE OR REPLACE PROCEDURE GetCardiologyDoctorsSimplified
	is
	doctor_name varchar2(50);

	CURSOR doctor_cur is 
	select doc_name from doctor_6@site_3 doc6 
    INNER JOIN doctor_1@site_2 doc1 ON 
    doc6.doc_id = doc1.doc_id where doc1.dept = 'Cardiology';
	
BEGIN
	
	DBMS_OUTPUT.PUT_LINE('From Simplified Procedure');

	OPEN doctor_cur;

	LOOP

		FETCH doctor_cur INTO doctor_name;
		
		EXIT WHEN doctor_cur%notfound;

		DBMS_OUTPUT.PUT_LINE('Doctor Name ' || doctor_name);

	END LOOP;

	CLOSE doctor_cur;

END;
/