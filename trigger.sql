CREATE TABLE employee (
    id int PRIMARY KEY,
    name varchar,
    date_of_birth date,
    age int,
    salary int,
    work_exp int,
    discount int
);

CREATE TABLE time_of_op(
    time timestamp
);
--1
CREATE OR REPLACE FUNCTION _time()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
    BEGIN
        INSERT INTO time_of_op
        VALUES (now());
        RETURN new;
    END; $$;

CREATE OR REPLACE TRIGGER time_tg
    AFTER INSERT ON employee
    FOR EACH ROW
EXECUTE PROCEDURE _time();
--2
CREATE OR REPLACE FUNCTION age_calc()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
    BEGIN
        UPDATE employee SET age = EXTRACT(year from age(CURRENT_DATE, date_of_birth));
        RETURN new.age;
    END; $$;

CREATE OR REPLACE TRIGGER age_calc_tgg
    AFTER INSERT on employee
EXECUTE PROCEDURE age_calc();
--3
CREATE OR REPLACE FUNCTION inc_tax()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
    BEGIN
        UPDATE employee SET salary =+ salary*0.12;
        RETURN new;
    END; $$;

CREATE OR REPLACE TRIGGER inc_tax_tgg
    AFTER INSERT on employee
    FOR EACH ROW
EXECUTE PROCEDURE inc_tax();
--4
CREATE OR REPLACE FUNCTION prev_del()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
    BEGIN
        IF tg_op = 'DELETE' THEN RETURN new;
        END IF;
    END; $$;

CREATE OR REPLACE TRIGGER prev_del_tgg
    BEFORE DELETE on employee
    FOR EACH ROW
EXECUTE PROCEDURE prev_del();
--5
CREATE OR REPLACE FUNCTION validation() RETURNS TRIGGER LANGUAGE plpgsql AS $$
    BEGIN
        CASE WHEN tg_argv = (SELECT tg_argv WHERE tg_argv ~ '[0-9]') THEN RETURN TRUE;
        ELSE RETURN FALSE;
        END CASE;
    END; $$;

CREATE OR REPLACE FUNCTION outputs() RETURNS TRIGGER LANGUAGE plpgsql AS $$
    BEGIN
        RETURN tg_nargs^2;
        RETURN tg_nargs^3;
    END; $$;

CREATE OR REPLACE TRIGGER ln_d_tgg
    BEFORE UPDATE on employee
    FOR EACH ROW
EXECUTE PROCEDURE outputs();

CREATE OR REPLACE TRIGGER ln_e_tgg
    BEFORE UPDATE on employee
    FOR EACH ROW
EXECUTE PROCEDURE validation();

INSERT INTO employee VALUES (1, 'Sergey', '12-04-1982', default, 150000, 5, 15);
DELETE FROM employee;
SELECT * FROM employee;
UPDATE employee SET id = 3;

-- alter table employee
-- disable trigger time_tg;
-- disable trigger ln_e_tgg;
