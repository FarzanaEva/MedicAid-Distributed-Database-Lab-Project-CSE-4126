-- Q: PJ doc_name SL dept = “Cardiology” Doctor

set serveroutput on;
CREATE OR REPLACE PROCEDURE GetCardiologyDoctors
	is
	doctor_name varchar2(70);

	CURSOR doctor_cur is 
	select doc_name from DOCTOR@site_3 
	where dept = 'Cardiology';
	
BEGIN

	DBMS_OUTPUT.PUT_LINE('From Main Procedure');
	
	OPEN doctor_cur;

	LOOP

		FETCH doctor_cur INTO doctor_name;

		EXIT WHEN doctor_cur%notfound;

		DBMS_OUTPUT.PUT_LINE('Doctor Name ' || doctor_name);

	END LOOP;

	CLOSE doctor_cur;

END;
/