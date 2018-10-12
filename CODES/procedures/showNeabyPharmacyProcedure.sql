set serveroutput on;

CREATE OR replace procedure findPharmacy
    (user_location in varchar2)
    IS

p_count number;

p_name pharmacy.pharmacy_name%type;

p_loc pharmacy.location%type:= user_location;

CURSOR p_cursor IS
    select pharmacy_name FROM pharmacy@site_link WHERE location = p_loc;

BEGIN

    p_count := 0;

    open p_cursor;

    loop

        fetch p_cursor into p_name;

        exit WHEN p_cursor%notfound;

        p_count := p_count + 1;

        dbms_output.put_line(p_count || ': ' ||p_name);

    end loop;

    -- dbms_output.put_line('found: ' || p_count);

    IF p_count = 0
        THEN
        dbms_output.put_line('No Pharmacy found!');

    end if;

    close p_cursor;

end;
/