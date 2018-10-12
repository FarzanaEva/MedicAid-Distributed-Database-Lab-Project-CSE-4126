set serveroutput on;

DECLARE
	-- USERTABLE_1:
	cursor user_cur is select * from USERTABLE;
	theUser user_cur%rowtype;
	
	-- HOSPITAL_3:
	cursor hospital_cur is
	select * from HOSPITAL where location = 'Sylhet';
	theHospital hospital_cur%rowtype;
	
	-- ADMINTABLE_3:
	cursor admin_cur is
	select * from ADMINTABLE where admin_id >=7;
	theAdmin admin_cur%rowtype;
	
	-- RECEPTIONIST_1:
	cursor recep_cur is 
	select * from RECEPTIONIST where recep_type = 'full-time';
	theRecep recep_cur%rowtype;
	
	-- EMERGENCY_4:
	cursor emer_cur is
	select * from EMERGENCY where location = 'Srimongol';
	theEmer emer_cur%rowtype;
	
	-- DOCTOR_1:
	cursor doc_cur1 is
	select doc_id,hospital_id,visit_time from DOCTOR
	where dept = 'Cardiology';
	theDoc1 doc_cur1%rowtype;
	
	-- DOCTOR_3:
	cursor doc_cur3 is
	select doc_id,hospital_id,visit_time from DOCTOR
	where dept = 'Dermatology';
	theDoc3 doc_cur3%rowtype;
	
	-- DOCTOR_4:
	cursor doc_cur4 is
	select doc_id,hospital_id,visit_time from DOCTOR
	where dept = 'Pediatrics';
	theDoc4 doc_cur4%rowtype;
	
	-- DOCTOR_5:
	cursor doc_cur5 is
	select doc_id,hospital_id,visit_time from DOCTOR
	where dept = 'Diabetes';
	theDoc5 doc_cur5%rowtype;
	
	-- DOCTOR_6:
	cursor doc_cur6 is
	select doc_id,doc_name,qualification,designation from DOCTOR;
	theDoc6 doc_cur6%rowtype;
	
	-- APPOINTMENT_2:
	cursor appoint_cur is
	select * from APPOINTMENT where status = 'pending';
	theAppoint2 appoint_cur%rowtype;
	
	-- APPOINTMENT_3:
	cursor appoint_cur3 is
	select * from APPOINTMENT where status = 'cancel';
	theAppoint3 appoint_cur3%rowtype;

BEGIN
	-- USERTABLE_1:
	open user_cur;
	loop
		fetch user_cur into theUser;
		exit when user_cur%notfound;
		insert into USERTABLE_1 values(theUser.user_id,theUser.user_name,theUser.email_id);
	end loop;
	close user_cur;
	
	-- HOSPITAL_3:
	open hospital_cur;
	loop
		fetch hospital_cur into theHospital;
		exit when hospital_cur%notfound;
		insert into HOSPITAL_3 values
		(theHospital.hospital_id,theHospital.hospital_name,theHospital.address,theHospital.location,theHospital.phn_no);
	end loop;
	close hospital_cur;
	
	-- ADMINTABLE_3:
	open admin_cur;
	loop
		fetch admin_cur into theAdmin;
		exit when admin_cur%notfound;
		insert into ADMINTABLE_3 values(theAdmin.admin_id,theAdmin.Password);
	end loop;
	close admin_cur;
	
	-- RECEPTIONIST_1:
	open recep_cur;
	loop
		fetch recep_cur into theRecep;
		exit when recep_cur%notfound;
		insert into RECEPTIONIST_1 values(theRecep.recep_id,'full-time',theRecep.start_work,theRecep.end_work);
	end loop;
	close recep_cur;
	
	-- EMERGENCY_4:
	open emer_cur;
	loop
		fetch emer_cur into theEmer;
		exit when emer_cur%notfound;
		insert into EMERGENCY_4 values(theEmer.emergency_id,theEmer.emergency_name,'Srimongol',theEmer.phn_no);
	end loop;
	close emer_cur;
	
	-- DOCTOR_1:
	open doc_cur1;
	loop
		fetch doc_cur1 into theDoc1;
		exit when doc_cur1%notfound;
		insert into DOCTOR_1 values(theDoc1.doc_id,theDoc1.hospital_id,'Cardiology',theDoc1.visit_time);
	end loop;
	close doc_cur1;
	
	-- DOCTOR_3:
	open doc_cur3;
	loop
		fetch doc_cur3 into theDoc3;
		exit when doc_cur3%notfound;
		insert into DOCTOR_3 values(theDoc3.doc_id,theDoc3.hospital_id,'Dermatology',theDoc3.visit_time);
	end loop;
	close doc_cur3;
	
	-- DOCTOR_4:
	open doc_cur4;
	loop
		fetch doc_cur4 into theDoc4;
		exit when doc_cur4%notfound;
		insert into DOCTOR_4 values(theDoc4.doc_id,theDoc4.hospital_id,'Pediatrics',theDoc4.visit_time);
	end loop;
	close doc_cur4;
	
	-- DOCTOR_5:
	open doc_cur5;
	loop
		fetch doc_cur5 into theDoc5;
		exit when doc_cur5%notfound;
		insert into DOCTOR_5 values(theDoc5.doc_id,theDoc5.hospital_id,'Diabetes',theDoc5.visit_time);
	end loop;
	close doc_cur5;
	
	-- DOCTOR_6:
	open doc_cur6;
	loop
		fetch doc_cur6 into theDoc6;
		exit when doc_cur6%notfound;
		insert into DOCTOR_6 values(theDoc6.doc_id,theDoc6.doc_name,theDoc6.qualification,theDoc6.designation);
	end loop;
	close doc_cur6;
	
	-- APPOINTMENT_2:
	open appoint_cur;
	loop
		fetch appoint_cur into theAppoint2;
		exit when appoint_cur%notfound;
		insert into APPOINTMENT_2 values(theAppoint2.appoint_id,theAppoint2.user_id,theAppoint2.doc_id,theAppoint2.appoint_time,'pending');
	end loop;
	close appoint_cur;
	
	-- APPOINTMENT_3:
	open appoint_cur3;
	loop
		fetch appoint_cur3 into theAppoint3;
		exit when appoint_cur3%notfound;
		insert into APPOINTMENT_3 values(theAppoint3.appoint_id,theAppoint3.user_id,theAppoint3.doc_id,theAppoint3.appoint_time,'cancel');
	end loop;
	close appoint_cur3;
	
	commit;
END;
/
	
	
	
	