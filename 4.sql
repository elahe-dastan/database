CREATE TABLE grades(
    id int PRIMARY KEY,
    student_id int,
    course_id int,
    grade int
);

INSERT INTO grades VALUES (1, 1, 1, 12);
INSERT INTO grades VALUES (2, 2, 1, 17);
INSERT INTO grades VALUES (3, 1, 2, 13);
INSERT INTO grades VALUES (4, 2, 2, 15);

SELECT course_id, AVG(grade) FROM grades GROUP BY course_id;