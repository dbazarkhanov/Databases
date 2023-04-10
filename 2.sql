CREATE TABLE students (
    student_id int NOT NULL PRIMARY KEY ,
    full_name varchar NOT NULL,
    age int NOT NULL,
    birth_date date NOT NULL,
    gender varchar NOT NULL,
    GPA numeric(3, 2),
    info text,
    need_dormitory boolean,
    additional_info text
);

CREATE TABLE lesson_participants (
    lesson_id int NOT NULL PRIMARY KEY ,
    lesson_title varchar NOT NULL ,
    teaching_instructor varchar NOT NULL ,
    studying_students int,
    room_number varchar NOT NULL
);

CREATE TABLE instructor (
    instructor_id int NOT NULL PRIMARY KEY ,
    full_name varchar NOT NULL ,
    speaking_languages varchar NOT NULL ,
    work_experience text,
    remote_lessons_possibility boolean
);

INSERT INTO students
VALUES (1, 'Adam', 19, '03-05-2003', 'M', 2.43, 'a', TRUE, 'a'),
       (2, 'Maria', 19, '23-08-2003', 'F', 3.43, 'a', FALSE, 'a'),
       (3, 'John', 18, '19-03-2004', 'M', 2.73, 'a', FALSE, 'a'),
       (4, 'Kevin', 20, '15-02-2002', 'M', 2.03, 'a', TRUE, 'a'),
       (5, 'Eva', 19, '01-10-2003', 'F', 3.03, 'a', TRUE, 'a'),
       (6, 'Lina', 19, '17-01-2003', 'F', 3.53, 'a', TRUE, 'a'),
       (7, 'Durant', 19, '10-09-2003', 'M', 1.93, 'a', TRUE, 'a'),
       (8, 'Oliver', 18, '26-07-2004', 'M', 1.42, 'a', FALSE, 'a'),
       (9, 'Bale', 18, '12-03-2004', 'M', 2.75, 'a', FALSE, 'a'),
       (10, 'Paul', 19, '28-02-2003', 'M', 3.01, 'a', FALSE, 'a');

UPDATE students SET gender = 'F' where student_id = 3;
UPDATE students SET GPA = 3.23 where student_id = 2;
UPDATE students SET full_name = 'Nelson' where student_id = 7;
UPDATE students SET info = 'WHO?' where student_id = 5;
UPDATE students SET GPA = 3.73 where student_id = 7;

ALTER TABLE students
DROP COLUMN additional_info;
ALTER TABLE students
DROP COLUMN birth_date;
ALTER TABLE students
ADD COLUMN address varchar;
ALTER TABLE students
DROP COLUMN info;
ALTER TABLE students
ADD COLUMN county varchar;

DELETE FROM students where student_id = 4;
DELETE FROM students where GPA < 1.5;

INSERT INTO instructor
VALUES (1, 'Mike', 'English', 'a', TRUE),
       (2, 'Ivan', 'Russian', 'a', FALSE),
       (3, 'Dimitri', 'Rumanian', 'a', FALSE),
       (4, 'Hilda', 'German', 'a', FALSE),
       (5, 'Jake', 'English', 'a', TRUE),
       (6, 'Bill', 'English', 'a', FALSE),
       (7, 'Afia', 'African', 'a', TRUE),
       (8, 'Danish', 'Indian', 'a', TRUE),
       (9, 'Yu', 'Chinese', 'a', FALSE),
       (10, 'Andre', 'French', 'a', TRUE);

UPDATE instructor SET speaking_languages = 'English' where instructor_id = 2;
UPDATE instructor SET remote_lessons_possibility = FALSE where speaking_languages = 'African';
UPDATE instructor SET work_experience = '12 years' where instructor_id = 3;
UPDATE instructor SET work_experience = '34 years' where full_name = 'Danish';
UPDATE instructor SET full_name = 'Yu Lin' where instructor_id = 9;

ALTER TABLE instructor
DROP COLUMN work_experience;
ALTER TABLE instructor
ADD COLUMN salary int;
ALTER TABLE instructor
ADD COLUMN country varchar;
ALTER TABLE instructor
DROP COLUMN country;
ALTER TABLE instructor
ADD COLUMN graduate varchar;

DELETE FROM instructor where instructor_id = 1;
DELETE FROM instructor where remote_lessons_possibility = FALSE;

INSERT INTO lesson_participants
VALUES (1, 'Calculus', 'Ivan', '8', 235),
       (2, 'Physics', 'Mike', '5', 345),
       (3, 'Philosophy', 'Dimitri', '6', 124),
       (4, 'English', 'Mike', '10', 325),
       (5, 'French', 'Andre', '4', 127),
       (6, 'German', 'Hilda', '3', 174),
       (7, 'Programming', 'Danish', '7', 236),
       (8, 'History', 'Dimitri', '10', 352),
       (9, 'Chinese', 'Yu', '6', 382),
       (10, 'Economics', 'Mike', '4', 209);

UPDATE lesson_participants SET lesson_title = 'Politics' where lesson_id = 3;
UPDATE lesson_participants SET teaching_instructor = 'Bill' where lesson_title = 'English';
UPDATE lesson_participants SET teaching_instructor = 'Jake' where lesson_title = 'Economics';
UPDATE lesson_participants SET teaching_instructor = 'Yu Lin' where lesson_id = 9;
UPDATE lesson_participants SET room_number = 111 where lesson_title = 'Calculus';

ALTER TABLE lesson_participants
DROP COLUMN teaching_instructor;
ALTER TABLE lesson_participants
ADD COLUMN lesson_time time;
ALTER TABLE lesson_participants
ADD COLUMN remote_lesson boolean;
ALTER TABLE lesson_participants
ADD COLUMN duration int;
ALTER TABLE lesson_participants
DROP COLUMN duration;

DELETE FROM lesson_participants where lesson_title = 'German';
DELETE FROM lesson_participants where studying_students <= 4;

SELECT * FROM students order by student_id;
SELECT * FROM instructor order by instructor_id;
SELECT * FROM lesson_participants order by lesson_id;


--DROP TABLE students, instructor, lesson_participants;