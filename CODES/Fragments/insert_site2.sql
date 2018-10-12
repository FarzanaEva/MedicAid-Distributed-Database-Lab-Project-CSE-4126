set serveroutput on;
DECLARE
	-- HOSPITAL_2:
	cursor hospital_cur is
	select * from HOSPITAL where location = 'Uttara';
	theHospital hospital_cur%rowtype;
	
	-- USERTABLE_2:
	cursor user_cur is
	select * from USERTABLE;
	theUser user_cur%rowtype;
	
	-- PHARMACY_1:
	cursor pharmacy_cur is
	select * from PHARMACY
	where location = 'Banani';
	thePharmacy pharmacy_cur%rowtype;
	
	-- PHARMACY_2:
	cursor pharmacy_cur2 is
	select * from PHARMACY
	where location = 'Motijhil';
	thePharmacy2 pharmacy_cur2%rowtype;
	
	-- ADMINTABLE_2:
	cursor admin_cur is
	select * from ADMINTABLE
    where admin_id >= 4 and admin_id < 7;
	theAdmin admin_cur%rowtype;
	
	-- RECEPTIONIST_2:	
	cursor recep_cur2 is 
	select * from RECEPTIONIST
	where recep_type = 'part-time';
	theRecep2 recep_cur2%rowtype;
	
	-- EMERGENCY_2:
	cursor emer_cur2 is
	select * from EMERGENCY
	where location = 'Tejgaon';
	theEmer2 emer_cur2%rowtype;
	
	-- EMERGENCY_3:
	cursor emer_cur3 is
	select * from EMERGENCY 
	where location = 'Basundhara';
	theEmer3 emer_cur3%rowtype;
	
	-- DOCTOR_6:
	cursor doc_cur6 is
	select doc_id,doc_name,qualification,designation from DOCTOR;
	theDoc6 doc_cur6%rowtype;
	
	-- DOCTOR_2:
	cursor doc_cur2 is
	select doc_id,hospital_id,visit_time from DOCTOR 
	where dept = 'Neurology';
	theDoc2 doc_cur2%rowtype;
	
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
	
	-- APPOINTMENT_1:
	cursor appoint_cur is
	select * from APPOINTMENT where status = 'confirm';
	theAppoint appoint_cur%rowtype;
	
	-- APPOINTMENT_3:
	cursor appoint_cur3 is
	select * from APPOINTMENT where status = 'cancel';
	theAppoint3 appoint_cur3%rowtype;
	
BEGIN
	-- HOSPITAL_2:
	open hospital_cur;
	loop
		fetch hospital_cur into theHospital;
		exit when hospital_cur%notfound;
		insert into HOSPITAL_2@site_2 values
		(theHospital.hospital_id,theHospital.hospital_name,theHospital.address,theHospital.location,theHospital.phn_no);
	end loop;
	close hospital_cur;
	
	-- USERTABLE_2:
	open user_cur;
	loop
		fetch user_cur into theUser;
		exit when user_cur%notfound;
		insert into USERTABLE_2@site_2 values(theUser.user_id,theUser.user_name,theUser.email_id);
	end loop;
	close user_cur;
	
	-- PHARMACY_1:
	open pharmacy_cur;
	loop
		FETCH pharmacy_cur INTO thePharmacy;
		exit when pharmacy_cur%notfound;
		insert into PHARMACY_1@site_2 values
		(thePharmacy.pharmacy_id,thePharmacy.pharmacy_name,thePharmacy.address,'Banani',thePharmacy.phn_no);
	end loop;
	close pharmacy_cur;
	
	-- PHARMACY_2:
	open pharmacy_cur2;
	loop
		FETCH pharmacy_cur2 INTO thePharmacy2;
		exit when pharmacy_cur2%notfound;
		insert into PHARMACY_2@site_2 values
		(thePharmacy2.pharmacy_id,thePharmacy2.pharmacy_name,thePharmacy2.address,'Motijhil',thePharmacy2.phn_no);
	end loop;
	close pharmacy_cur2;
	
	-- ADMINTABLE_2:
	open admin_cur;
	loop
		fetch admin_cur into theAdmin;
		exit when admin_cur%notfound;
		insert into ADMINTABLE_2@site_2 values(theAdmin.admin_id,theAdmin.Password);
	end loop;
	close admin_cur;
	
	-- RECEPTIONIST_2:
	open recep_cur2;
	loop
		fetch recep_cur2 into theRecep2;
		exit when recep_cur2%notfound;
		insert into RECEPTIONIST_2@site_2 values(theRecep2.recep_id,'part-time',theRecep2.start_work,theRecep2.end_work);
	end loop;
	close recep_cur2;
	
	-- EMERGENCY_2:
	open emer_cur2;
	loop
		fetch emer_cur2 into theEmer2;
		exit when emer_cur2%notfound;
		insert into EMERGENCY_2@site_2 values(theEmer2.emergency_id,theEmer2.emergency_name,'Tejgaon',theEmer2.phn_no);
	end loop;
	close emer_cur2;
	
	-- EMERGENCY_3:
	open emer_cur3;
	loop
		fetch emer_cur3 into theEmer3;
		exit when emer_cur3%notfound;
		insert into EMERGENCY_3@site_2 values(theEmer3.emergency_id,theEmer3.emergency_name,'Basundhara',theEmer3.phn_no);
	end loop;
	close emer_cur3;
	
	-- DOCTOR_6:
	open doc_cur6;
	loop
		fetch doc_cur6 into theDoc6;
		exit when doc_cur6%notfound;
		insert into DOCTOR_6@site_2 values(theDoc6.doc_id,theDoc6.doc_name,theDoc6.qualification,theDoc6.designation);
	end loop;
	close doc_cur6;
	
	-- DOCTOR_2:
	open doc_cur2;
	loop
		fetch doc_cur2 into theDoc2;
		exit when doc_cur2%notfound;
		insert into DOCTOR_2@site_2 values(theDoc2.doc_id,theDoc2.hospital_id,'Neurology',theDoc2.visit_time);
	end loop;
	close doc_cur2;
	
	-- DOCTOR_4:
	open doc_cur4;
	loop
		fetch doc_cur4 into theDoc4;
		exit when doc_cur4%notfound;
		insert into DOCTOR_4@site_2 values(theDoc4.doc_id,theDoc4.hospital_id,'Pediatrics',theDoc4.visit_time);
	end loop;
	close doc_cur4;
	
	-- DOCTOR_5:
	open doc_cur5;
	loop
		fetch doc_cur5 into theDoc5;
		exit when doc_cur5%notfound;
		insert into DOCTOR_5@site_2 values(theDoc5.doc_id,theDoc5.hospital_id,'Diabetes',theDoc5.visit_time);
	end loop;
	close doc_cur5;
	
	-- APPOINTMENT_1:
	open appoint_cur;
	loop
		fetch appoint_cur into theAppoint;
		exit when appoint_cur%notfound;
		insert into APPOINTMENT_1@site_2 values(theAppoint.appoint_id,theAppoint.user_id,theAppoint.doc_id,theAppoint.appoint_time,'confirm');
	end loop;
	close appoint_cur;
	
	-- APPOINTMENT_3:
	open appoint_cur3;
	loop
		fetch appoint_cur3 into theAppoint3;
		exit when appoint_cur3%notfound;
		insert into APPOINTMENT_3@site_2 values(theAppoint3.appoint_id,theAppoint3.user_id,theAppoint3.doc_id,theAppoint3.appoint_time,'cancel');
	end loop;
	close appoint_cur3;
	commit;

END;
/