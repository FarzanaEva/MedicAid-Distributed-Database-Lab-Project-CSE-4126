set serveroutput on;

DECLARE
	theDocName varchar2(70);
	theVisitTime varchar2(30);

BEGIN
	theDocName := DocName('Apollo Hospital','Cardiology');
	select visit_time into theVisitTime from DOCTOR where doc_name = theDocName;
	DBMS_OUTPUT.PUT_LINE('Doctor Name : ' || theDocName ||' ' || 'Visiting Time : ' || theVisitTime);

END;
/