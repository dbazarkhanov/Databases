CREATE TABLE Students (
    full_name varchar(255),
    age int,
    birth_date date,
    gender varchar(255),
    avg_grade double precision,
    info text,
    dormitory boolean,
    add_info text
);

CREATE TABLE Instructors (
    full_name varchar(255),
    language varchar(255),
    work_exp int,
    remote_lessons boolean
);

CREATE TABLE Lesson_participants (
    title varchar(255),
    instructor varchar(255),
    students int,
    room int
);