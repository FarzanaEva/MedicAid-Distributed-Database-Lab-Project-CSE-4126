CREATE OR REPLACE FUNCTION AppointInfo
(theDocName out varchar2, theAppointStatus out varchar2,theAppointTime out varchar2,theAppointId in number)
	return varchar2
	is
	theUserName varchar2(70);

BEGIN
	select user_name, doc_name, status, appoint_time into theUserName, theDocName, theAppointStatus, theAppointTime
	from ((USERTABLE@site_link inner join APPOINTMENT@site_link on USERTABLE.user_id = APPOINTMENT.user_id)
	inner join DOCTOR@site_link on DOCTOR.doc_id = APPOINTMENT.doc_id) where appoint_id = theAppointId;
	
	return theUserName;	

END;
/