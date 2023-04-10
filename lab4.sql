--#1
SELECT * FROM course WHERE credits  > 3;
SELECT * FROM classroom WHERE building = 'Watson' or building = 'Packard';
SELECT * FROM course WHERE dept_name = 'Comp. Sci.';
SELECT course.course_id, title FROM course, section WHERE course.course_id = section.course_id and section.semester = 'Fall';
SELECT * FROM student WHERE tot_cred  < 90 and tot_cred  > 45;
SELECT * FROM student WHERE name LIKE '%[aeoui]'; --wrong one
SELECT course.course_id, title FROM course, prereq WHERE course.course_id = prereq.course_id and prereq_id = 'CS-101';
--#2
SELECT dept_name, avg(salary) FROM instructor GROUP BY dept_name ORDER BY avg(salary);
SELECT building, count(course_id) FROM department, course WHERE course.dept_name = department.dept_name
GROUP BY building ORDER BY count(course_id) DESC;
SELECT dept_name, count(course_id) FROM course GROUP BY dept_name ORDER BY count(course_id);
SELECT DISTINCT student.id, student.name, count(takes.course_id) FROM student, course, takes
WHERE course.dept_name = 'Comp. Sci.' AND takes.id = student.id AND takes.course_id = course.course_id
GROUP BY student.id HAVING count(course.course_id) > 3;
SELECT name, dept_name FROM instructor WHERE dept_name in (SELECT dept_name FROM department WHERE building = 'Taylor');
SELECT DISTINCT teaches.id, name FROM teaches, instructor WHERE teaches.id = instructor.id AND year = 2018
EXCEPT
SELECT DISTINCT teaches.id, name FROM teaches, instructor WHERE teaches.id = instructor.id AND year = 2017;
--#3
SELECT DISTINCT student.id, student.name, grade FROM student, takes WHERE dept_name = 'Comp. Sci.' AND takes.id = student.id AND (grade = 'A' or grade = 'A-');
SELECT DISTINCT i_id FROM advisor, student, takes
WHERE student.id = advisor.s_id AND student.id = takes.id
AND grade = 'B-' or grade = 'C' or grade = 'C+' or grade = 'C-' or grade = 'F';
SELECT dept_name FROM student, takes
EXCEPT
SELECT DISTINCT dept_name FROM student, takes WHERE takes.id = student.id AND (grade = 'C' OR grade = 'F');
SELECT DISTINCT name FROM instructor, takes, teaches WHERE instructor.id = teaches.id AND takes.course_id = teaches.course_id AND takes.semester = teaches.semester
EXCEPT
SELECT DISTINCT name FROM instructor, takes, teaches WHERE instructor.id = teaches.id AND takes.course_id = teaches.course_id AND takes.semester = teaches.semester AND grade = 'A';
SELECT * FROM course WHERE course_id IN (SELECT section.course_id FROM section
WHERE time_slot_id IN (SELECT time_slot_id FROM time_slot WHERE end_hr < 13));