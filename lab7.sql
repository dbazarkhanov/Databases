CREATE TABLE students (
    student_id int NOT NULL PRIMARY KEY,
    full_name varchar NOT NULL,
    age int NOT NULL CHECK (age >= 0),
    birth_date date NOT NULL,
    gender varchar NOT NULL,
    GPA numeric(3, 2) CHECK (GPA >= 0),
    info text,
    need_dormitory boolean,
    additional_info text
);

CREATE TABLE instructor (
    instructor_id int ,
    full_name varchar NOT NULL PRIMARY KEY ,
    speaking_languages varchar NOT NULL ,
    work_experience text ,
    remote_lessons_possibility boolean
);

CREATE TABLE lesson_participants (
    lesson_id int NOT NULL PRIMARY KEY ,
    lesson_title varchar NOT NULL,
    teaching_instructor varchar NOT NULL REFERENCES instructor,
    studying_students int,
    room_number varchar NOT NULL
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

ALTER TABLE lesson_participants
ADD UNIQUE (lesson_id);

ALTER TABLE instructor
ADD UNIQUE (instructor_id);

SELECT * FROM instructor CROSS JOIN lesson_participants;
SELECT * FROM lesson_participants CROSS JOIN students;
SELECT * FROM students CROSS JOIN instructor;

SELECT * FROM instructor INNER JOIN lesson_participants
on instructor.full_name = lesson_participants.teaching_instructor;
SELECT * FROM lesson_participants INNER JOIN students USING (student_id);
SELECT * FROM lesson_participants INNER JOIN students
on student_id = studying_students;

SELECT * FROM lesson_participants RIGHT JOIN students
on studying_students = student_id;
SELECT * FROM instructor RIGHT JOIN students
on remote_lessons_possibility = need_dormitory;
SELECT * FROM lesson_participants RIGHT JOIN students
on studying_students = age WHERE age = 19;

SELECT * FROM lesson_participants LEFT JOIN students
on studying_students = student_id WHERE studying_students <= 5;
SELECT * FROM instructor LEFT JOIN students
on remote_lessons_possibility = need_dormitory WHERE age < 19;
SELECT * FROM lesson_participants LEFT JOIN students
on studying_students != age;