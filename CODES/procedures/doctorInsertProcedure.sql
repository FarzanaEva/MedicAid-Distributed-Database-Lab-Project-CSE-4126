set serveroutput on;

create or replace procedure addDoctor
	(hospId in number,doctor_name in varchar2, doctor_designation in varchar2, doctor_department in varchar2)
	is
	
	theDocID number:= 0;
	DocID number;
	cursor doc_cur is
	select doc_id from doctor@site_link;
	
	cursor doc_check is
	select doc_id from doctor@site_link where doc_name = doctor_name;
	
BEGIN

	open doc_check;
	loop
	fetch doc_check into theDocID;
	exit when doc_check%notfound;
	end loop;
	close doc_check;

	open doc_cur;
	loop
	fetch doc_cur into DocID;
	exit when doc_cur%notfound;
	end loop;
	close doc_cur;
	
	if theDocID <= 0
	then
	DocID := DocID + 1;
	insert into doctor@site_link values(DocID,hospId,doctor_name,'MBBS',doctor_designation,doctor_department,'19:00:00-23:00:00');
	DBMS_OUTPUT.PUT_LINE('New Doctor added, ID is : '|| DocID );
	else
	DBMS_OUTPUT.PUT_LINE('Doctor already exists, ID is : '|| DocID );
	end if;
END;
/