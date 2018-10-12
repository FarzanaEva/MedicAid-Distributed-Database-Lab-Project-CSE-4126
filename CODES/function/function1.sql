CREATE OR REPLACE FUNCTION DocName
(theHospName in varchar2, theDept in varchar2)
	return varchar2
	is
	doctor_name varchar2(70);
	
BEGIN
	select doc_name into doctor_name from DOCTOR@site_link where dept = theDept and 
	hospital_id = (select hospital_id from HOSPITAL@site_link where hospital_name = theHospName);
	
	return doctor_name;
END;
/