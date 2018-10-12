set serveroutput on;
DECLARE
	-- USERTABLE_1:
	cursor user_cur is select * from USERTABLE;
	theUser user_cur%rowtype;
	
	-- HOSPITAL_1:
	cursor hospital_cur is
	select * from HOSPITAL where location = 'Dhanmondi';
	theHospital hospital_cur%rowtype;

	-- PHARMACY_1:
	cursor pharmacy_cur is
	select * from PHARMACY
	where location = 'Banani';
	thePharmacy pharmacy_cur%rowtype;
	
	-- PHARMACY_3:
	cursor pharmacy_cur3 is
	select * from PHARMACY
	where location = 'Tejgaon';
	thePharmacy3 pharmacy_cur3%rowtype;
	
	-- ADMINTABLE_1:
	cursor admin_cur is
	select * from ADMINTABLE where admin_id <4;
	theAdmin admin_cur%rowtype;
	
	-- RECEPTIONIST_1:
	cursor recep_cur1 is 
	select * from RECEPTIONIST where recep_type = 'full-time';
	theRecep recep_cur1%rowtype;
	
	-- RECEPTIONIST_2: 
	cursor recep_cur2 is 
	select * from RECEPTIONIST
	where recep_type = 'part-time';
	theRecep2 recep_cur2%rowtype;
	
	-- EMERGENCY_1:
	cursor emer_cur1 is
	select * from EMERGENCY
	where location = 'Dhanmondi';
	theEmer emer_cur1%rowtype;
	
	-- EMERGENCY_3:
	cursor emer_cur3 is
	select * from EMERGENCY where location = 'Basundhara';
	theEmer3 emer_cur3%rowtype;
	
	-- DOCTOR_1:
	cursor doc_cur1 is
	select doc_id,hospital_id,visit_time from DOCTOR
	where dept = 'Cardiology';
	theDoc1 doc_cur1%rowtype;
	
	-- DOCTOR_2:
	cursor doc_cur2 is
	select doc_id,hospital_id,visit_time from DOCTOR
	where dept = 'Neurology';
	theDoc2 doc_cur2%rowtype;

	-- DOCTOR_3:
	cursor doc_cur3 is
	select doc_id,hospital_id,visit_time from DOCTOR
	where dept = 'Dermatology';
	theDoc3 doc_cur3%rowtype;

	-- DOCTOR_5:
	cursor doc_cur5 is
	select doc_id,hospital_id,visit_time from DOCTOR
	where dept = 'Diabetes';
	theDoc5 doc_cur5%rowtype;
	
	-- APPOINTMENT_1:
	cursor appoint_cur is
	select * from APPOINTMENT where status = 'confirm';
	theAppoint2 appoint_cur%rowtype;
	
BEGIN
	-- USERTABLE_1:
	open user_cur;
	loop
		fetch user_cur into theUser;
		exit when user_cur%notfound;
		insert into USERTABLE_1@site_1 values(theUser.user_id,theUser.user_name,theUser.email_id);
	end loop;
	close user_cur;
	
	-- HOSPITAL_1:
	open hospital_cur;
	loop
		fetch hospital_cur into theHospital;
		exit when hospital_cur%notfound;
		insert into HOSPITAL_1@site_1 values
		(theHospital.hospital_id,theHospital.hospital_name,theHospital.address,theHospital.location,theHospital.phn_no);
	end loop;
	close hospital_cur;

	-- PHARMACY_1:
	open pharmacy_cur;
	loop
		FETCH pharmacy_cur INTO thePharmacy;
		exit when pharmacy_cur%notfound;
		insert into PHARMACY_1@site_1 values
		(thePharmacy.pharmacy_id,thePharmacy.pharmacy_name,thePharmacy.address,'Banani',thePharmacy.phn_no);
	end loop;
	close pharmacy_cur;
	
	-- PHARMACY_3:
	open pharmacy_cur3;

	loop

		FETCH pharmacy_cur3 INTO thePharmacy3;
		exit when pharmacy_cur3%notfound;
		insert into PHARMACY_3@site_1 values
		(thePharmacy3.pharmacy_id,thePharmacy3.pharmacy_name,thePharmacy3.address,'Tejgaon',thePharmacy3.phn_no);
	end loop;

	close pharmacy_cur3;
	
	-- ADMINTABLE_1:
	open admin_cur;
	loop
		fetch admin_cur into theAdmin;
		exit when admin_cur%notfound;
		insert into ADMINTABLE_1@site_1 values(theAdmin.admin_id,theAdmin.Password);
	end loop;
	close admin_cur;
	
	-- RECEPTIONIST_1:
	open recep_cur1;
	loop
		fetch recep_cur1 into theRecep;
		exit when recep_cur1%notfound;
		insert into RECEPTIONIST_1@site_1 values(theRecep.recep_id,'full-time',theRecep.start_work,theRecep.end_work);
	end loop;
	close recep_cur1;
	
	-- RECEPTIONIST_2:
	open recep_cur2;
	loop
		fetch recep_cur2 into theRecep2;
		exit when recep_cur2%notfound;
		insert into RECEPTIONIST_2@site_1 values(theRecep2.recep_id,'part-time',theRecep2.start_work,theRecep2.end_work);
	end loop;
	close recep_cur2;

	-- EMERGENCY_1:
	open emer_cur1;
	loop
		fetch emer_cur1 into theEmer;
		exit when emer_cur1%notfound;
		insert into EMERGENCY_1@site_1 values(theEmer.emergency_id,theEmer.emergency_name,'Dhanmondi',theEmer.phn_no);
	end loop;
	close emer_cur1;
	
	-- EMERGENCY_3:
	open emer_cur3;
	loop
		fetch emer_cur3 into theEmer3;
		exit when emer_cur3%notfound;
		insert into EMERGENCY_3@site_1 values(theEmer3.emergency_id,theEmer3.emergency_name,'Basundhara',theEmer3.phn_no);
	end loop;
	close emer_cur3;
	
	-- DOCTOR_1:
	open doc_cur1;
	loop
		fetch doc_cur1 into theDoc1;
		exit when doc_cur1%notfound;
		insert into DOCTOR_1@site_1 values(theDoc1.doc_id,theDoc1.hospital_id,'Cardiology',theDoc1.visit_time);
	end loop;
	close doc_cur1;
	
	-- DOCTOR_2:
	open doc_cur2;
	loop
		fetch doc_cur2 into theDoc2;
		exit when doc_cur2%notfound;
		insert into DOCTOR_2@site_1 values(theDoc2.doc_id,theDoc2.hospital_id,'Neurology',theDoc2.visit_time);
	end loop;
	close doc_cur2;

	-- DOCTOR_3:
	open doc_cur3;
	loop
		fetch doc_cur3 into theDoc3;
		exit when doc_cur3%notfound;
		insert into DOCTOR_3@site_1 values(theDoc3.doc_id,theDoc3.hospital_id,'Dermatology',theDoc3.visit_time);
	end loop;
	close doc_cur3;
	
	-- DOCTOR_5:
	open doc_cur5;
	loop
		fetch doc_cur5 into theDoc5;
		exit when doc_cur5%notfound;
		insert into DOCTOR_5@site_1 values(theDoc5.doc_id,theDoc5.hospital_id,'Diabetes',theDoc5.visit_time);
	end loop;
	close doc_cur5;
	
	-- APPOINTMENT_1:
	open appoint_cur;
	loop
		fetch appoint_cur into theAppoint2;
		exit when appoint_cur%notfound;
		insert into APPOINTMENT_1@site_1 values(theAppoint2.appoint_id,theAppoint2.user_id,theAppoint2.doc_id,theAppoint2.appoint_time,'confirm');
	end loop;
	close appoint_cur;
	commit;

END;
/