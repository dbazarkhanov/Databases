CREATE OR REPLACE FUNCTION inc(x int) RETURNS int AS $$
    BEGIN
        RETURN x + 1;
    END; $$
    LANGUAGE plpgsql;

SELECT inc(1);

CREATE OR REPLACE FUNCTION sum(x int, y int) RETURNS int AS $$
    BEGIN
        RETURN x + y;
    END; $$
    LANGUAGE plpgsql;

SELECT sum(1, 2);

CREATE OR REPLACE FUNCTION div_bl(x int) RETURNS boolean AS $$
    BEGIN
        IF x%2 = 0 THEN RETURN True;
        ELSE RETURN FALSE;
        END IF;
    END; $$
    LANGUAGE plpgsql;

SELECT div_bl(5);

CREATE OR REPLACE FUNCTION validation(x varchar) RETURNS varchar AS $$
    BEGIN
        CASE WHEN x = (SELECT x WHERE x ~ '[0-9]') THEN RETURN TRUE;
        ELSE RETURN FALSE;
        END CASE;
    END; $$
    LANGUAGE plpgsql;

SELECT validation('lakefj21');

CREATE OR REPLACE FUNCTION outputs(x int, out y int, out z int) AS $$
    BEGIN
        y = x^2;
        z = x^3;
    END; $$
    LANGUAGE plpgsql;

SELECT outputs(2);
