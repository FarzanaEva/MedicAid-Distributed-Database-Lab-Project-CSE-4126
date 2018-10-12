create or replace function updateAppointment
(theAppointId in number)
	return varchar2
	is
	theMsg varchar(50);
	flag number;
cursor status_cur is
select * from Appointment_2@site_3 where appoint_id = theAppointId;
theApp status_cur%rowtype;
BEGIN
	flag:= 0;
	open status_cur;
	loop
		fetch status_cur into theApp;
		exit when status_cur%notfound;
		flag := 1;
		INSERT into Appointment_1@site_1 values(theApp.appoint_id,theApp.user_id,
		theApp.doc_id,theApp.appoint_time,'confirm');
		INSERT into Appointment_1@site_2 values(theApp.appoint_id,theApp.user_id,
		theApp.doc_id,theApp.appoint_time,'confirm');
	end loop;
	close status_cur;	
	if flag=0 
		then
		theMsg:='No appointment found with this id';
	else
		theMsg:='Appointment updated';
	end if;	
	return theMsg;	
	DELETE Appointment_2@site_3 where appoint_id = theAppointId;

END;
/