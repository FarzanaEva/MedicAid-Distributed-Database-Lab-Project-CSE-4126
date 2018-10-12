clear screen;

DROP TABLE USERTABLE_1 CASCADE CONSTRAINTS;
DROP TABLE DOCTOR_1 CASCADE CONSTRAINTS;
DROP TABLE DOCTOR_3 CASCADE CONSTRAINTS;
DROP TABLE DOCTOR_4 CASCADE CONSTRAINTS;
DROP TABLE DOCTOR_5 CASCADE CONSTRAINTS;
DROP TABLE DOCTOR_6 CASCADE CONSTRAINTS;
DROP TABLE HOSPITAL_3 CASCADE CONSTRAINTS;
DROP TABLE ADMINTABLE_3 CASCADE CONSTRAINTS;
DROP TABLE RECEPTIONIST_1 CASCADE CONSTRAINTS;
DROP TABLE APPOINTMENT_2 CASCADE CONSTRAINTS;
DROP TABLE APPOINTMENT_3 CASCADE CONSTRAINTS;
DROP TABLE EMERGENCY_4 CASCADE CONSTRAINTS;

CREATE TABLE USERTABLE_1
(
	user_id number,
	user_name varchar2(70),
	email_id varchar2(70),
	primary key(user_id)
);

CREATE TABLE HOSPITAL_3
(
	hospital_id number,
	hospital_name varchar2(150),
	address varchar2(300),
	location varchar2(170),
	phn_no varchar2(20),
	primary key(hospital_id)
);

CREATE TABLE ADMINTABLE_3
(
	admin_id number,
	password varchar2(30),
	primary key(admin_id)
);

CREATE TABLE RECEPTIONIST_1
(
	recep_id number,
	recep_type varchar2(20),
	start_work varchar2(30),
	end_work varchar2(30),
	primary key(recep_id)
);

CREATE TABLE EMERGENCY_4
(
	emergency_id number,
	emergency_name varchar2(30),
	location varchar2(100),
	phn_no VARCHAR2(20),
	primary key(emergency_id)
);

CREATE TABLE DOCTOR_1
(
	doc_id number,
	hospital_id number,
	dept varchar2(30),
	visit_time varchar2(30),
	primary key(doc_id),
	foreign key(hospital_id) references HOSPITAL(hospital_id)
);

CREATE TABLE DOCTOR_3
(
	doc_id number,
	hospital_id number,
	dept varchar2(30),
	visit_time varchar2(30),
	primary key(doc_id),
	foreign key(hospital_id) references HOSPITAL(hospital_id)
);

CREATE TABLE DOCTOR_4
(
	doc_id number,
	hospital_id number,
	dept varchar2(30),
	visit_time varchar2(30),
	primary key(doc_id),
	foreign key(hospital_id) references HOSPITAL(hospital_id)
);

CREATE TABLE DOCTOR_5
(
	doc_id number,
	hospital_id number,
	dept varchar2(30),
	visit_time varchar2(30),
	primary key(doc_id),
	foreign key(hospital_id) references HOSPITAL(hospital_id)
);

CREATE TABLE DOCTOR_6
(
	doc_id number,
	doc_name varchar2(30),
	qualification varchar2(350),
	designation varchar2(230),
	primary key(doc_id)
);

CREATE TABLE APPOINTMENT_2
(
	appoint_id number,
	user_id number,
	doc_id number,
	appoint_time varchar2(30),
	status varchar2(20),
	primary key(appoint_id),
	foreign key(user_id) references USERTABLE(user_id),
	foreign key(doc_id) references DOCTOR(doc_id)
);

CREATE TABLE APPOINTMENT_3
(
	appoint_id number,
	user_id number,
	doc_id number,
	appoint_time varchar2(30),
	status varchar2(20),
	primary key(appoint_id),
	foreign key(user_id) references USERTABLE_1(user_id),
	foreign key(doc_id) references DOCTOR_6(doc_id)
);