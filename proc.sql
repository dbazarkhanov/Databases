CREATE OR REPLACE PROCEDURE inc_sal("work_exp" int)
    LANGUAGE plpgsql
    AS $$
    BEGIN
        FOR i IN SELECT work_exp/2 LOOP
            UPDATE employee SET salary =+ salary*0.1;
            UPDATE employee SET discount = 10;
        END LOOP;
        IF work_exp > 5 THEN UPDATE employee SET discount =+ 1;
        END IF;
    END; $$;

CREATE OR REPLACE PROCEDURE after_40("age" int, "work_exp" int)
    LANGUAGE plpgsql
    AS $$
    BEGIN
        IF age >= 40 THEN UPDATE employee SET salary =+ salary*0.15;
        END IF;
        IF work_exp > 8 THEN UPDATE employee SET salary =+ salary*0.15 AND discount = 20;
        END IF;
    END; $$;

CALL after_40(40, 5);