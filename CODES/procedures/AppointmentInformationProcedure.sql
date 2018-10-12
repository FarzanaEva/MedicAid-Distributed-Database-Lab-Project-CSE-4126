set serveroutput on;
create or replace procedure appointmentDetails(
	userId in number, docId in number)
	is
	userName varchar2(50);
	docName varchar2(50);
	appointId number;
	appointTime varchar2(50);
	statusTemp varchar2(50);
	cursor appointCursor is select appoint_id , appoint_time,status from appointment@site_link 
	where user_id = userId and doc_id = docId;
	
	counter number := 0;
	
BEGIN
	select user_name  into userName from usertable@site_link where user_id = userId;
	select doc_name  into docName from doctor@site_link where doc_id = docId;
	
	DBMS_OUTPUT.PUT_LINE('User Name ' || userName);
	DBMS_OUTPUT.PUT_LINE('Doctor Name ' || docName);
	
	open appointCursor;
	
	loop
	FETCH appointCursor INTO appointId,appointTime,statusTemp;
	EXIT WHEN appointCursor%notfound;
	counter := counter +1;
	DBMS_OUTPUT.PUT_LINE(appointId || ' ' || appointTime|| ' ' || statusTemp);

	END LOOP;
	
	if counter = 0
		then
		DBMS_OUTPUT.PUT_LINE('No Appointment Details');
	end if;
	
	close appointCursor;
	
	
END;
/