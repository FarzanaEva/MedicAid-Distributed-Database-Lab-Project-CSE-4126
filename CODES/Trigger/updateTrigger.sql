CREATE or REPLACE TRIGGER update_recep 

BEFORE UPDATE OF recep_type 

ON RECEPTIONIST 

FOR EACH ROW 

BEGIN 

INSERT INTO RECEPTIONIST_History

VALUES 

(:old.recep_id, 

 :old.recep_type, 

 :old.start_work, 

 :old.end_work); 

END; 

/ 