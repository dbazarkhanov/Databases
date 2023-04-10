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

INSERT INTO instructor
VALUES (1, 'Mike', 'English', '12.03.2018', TRUE),
       (2, 'Ivan', 'Russian', '24.06.2020', FALSE),
       (3, 'Dimitri', 'Rumanian', '02.12.2021', FALSE),
       (4, 'Hilda', 'German', '23.02.2020', FALSE),
       (5, 'Jake', 'English', '30.01.2019', TRUE),
       (6, 'Bill', 'English', '15.05.2015', FALSE),
       (7, 'Afia', 'African', '06.09.2021', TRUE),
       (8, 'Danish', 'Indian', '02.11.2019', TRUE),
       (9, 'Yu', 'Chinese', '17.04.2019', FALSE),
       (10, 'Andre', 'French', '04.12.2020', TRUE);

INSERT INTO lesson_participants
VALUES (1, 'Calculus', 'Ivan', 8, '235'),
       (2, 'Physics', 'Mike', 5, '345'),
       (3, 'Philosophy', 'Dimitri', 6, '124'),
       (4, 'English', 'Mike', 10, '325'),
       (5, 'French', 'Andre', 4, '127'),
       (6, 'German', 'Hilda', 3, '174'),
       (7, 'Programming', 'Danish', 7, '236'),
       (8, 'History', 'Dimitri', 10, '352'),
       (9, 'Chinese', 'Yu', 6, '382'),
       (10, 'Economics', 'Mike', 4, '209');
--1
SELECT * FROM instructor WHERE speaking_languages = 'English' AND remote_lessons_possibility = TRUE;
SELECT * FROM students WHERE age = 20 OR need_dormitory = FALSE;
SELECT * FROM lesson_participants WHERE NOT lesson_title = 'History';
--2
SELECT * FROM instructor WHERE instructor_id BETWEEN 3 AND 6;
SELECT * FROM students WHERE GPA < 2 OR GPA > 3;
SELECT * FROM lesson_participants WHERE studying_students NOT BETWEEN 4 AND 6;
--3
SELECT * FROM instructor WHERE instructor_id = cbrt(8) + 3;
SELECT * FROM students WHERE GPA < round(8.43) / 4;
SELECT * FROM lesson_participants WHERE studying_students = div(12, 5) * 2;
--4
SELECT format('This is %s. He speaks %s', full_name, speaking_languages) FROM instructor;
SELECT B'1011' || B'1010';
SELECT * FROM students WHERE full_name LIKE '%e';
SELECT to_date(work_experience, 'DD-MM-YYYY') FROM instructor;
SELECT *,
        CASE WHEN speaking_languages = 'English' THEN 'En'
        END
FROM instructor;
SELECT COALESCE(NULL, full_name, speaking_languages) FROM instructor;
SELECT NULLIF(work_experience, '04.12.2020') FROM instructor;
SELECT DISTINCT greatest(24, 342, 45, 12, 335, 43), least('aad', 'hjh', 'cb', 's', 'dff', 'sd');
SELECT ARRAY[3, 4, 2] > ARRAY[3, 1, 5];
SELECT unnest(ARRAY['A1', 'B2']);
SELECT int4range(4, 5) = int4range(5, 8);
SELECT upper(int8range(12, 453));
SELECT max(GPA), min(GPA) FROM students;
SELECT * FROM lesson_participants
         WHERE exists(SELECT * FROM instructor WHERE full_name = 'Mike' AND full_name = teaching_instructor);
SELECT * FROM lesson_participants WHERE lesson_title IN (SELECT speaking_languages FROM instructor);
SELECT * FROM lesson_participants WHERE lesson_title NOT IN (SELECT speaking_languages FROM instructor);
SELECT * FROM students WHERE GPA >= ANY (SELECT GPA FROM students WHERE full_name = 'Eva');
SELECT * FROM students WHERE GPA < ALL (SELECT GPA FROM students WHERE need_dormitory = TRUE)