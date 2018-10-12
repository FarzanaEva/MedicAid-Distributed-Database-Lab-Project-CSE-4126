CREATE OR REPLACE TRIGGER display_appoint_status
BEFORE DELETE OR INSERT OR UPDATE ON appointment
FOR EACH ROW
WHEN (NEW.appoint_id > 0)

BEGIN
	DBMS_OUTPUT.PUT_LINE('Previous Status: ' || TO_CHAR(:OLD.status));
	DBMS_OUTPUT.PUT_LINE('New Status: ' || TO_CHAR(:New.status));
END;
/
	