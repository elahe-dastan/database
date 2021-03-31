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



CREATE TABLE db_grades(
    id int PRIMARY KEY,
    student_id int,
    grade int
);

INSERT INTO db_grades VALUES (1, 1, 8);
INSERT INTO db_grades VALUES (2, 2, 17);
INSERT INTO db_grades VALUES (3, 3, 9);
INSERT INTO db_grades VALUES (4, 4, 15);
INSERT INTO db_grades VALUES (5, 5, 16);

CREATE TABLE os_grades(
    id int PRIMARY KEY,
    student_id int,
    grade int
);

INSERT INTO os_grades VALUES (1, 3, 8);
INSERT INTO os_grades VALUES (2, 4, 17);
INSERT INTO os_grades VALUES (3, 5, 9);
INSERT INTO os_grades VALUES (4, 6, 15);
INSERT INTO os_grades VALUES (5, 7, 9);

SELECT dg.student_id FROM db_grades dg LEFT JOIN os_grades og on dg.student_id = og.student_id WHERE dg.grade > 9 AND (og.grade < 10 OR og.grade IS NULL);

CREATE TABLE bts(
    N int PRIMARY KEY,
    P int
);

INSERT INTO bts VALUES (1, 2);
INSERT INTO bts VALUES (3, 2);
INSERT INTO bts VALUES (6, 8);
INSERT INTO bts VALUES (9, 8);
INSERT INTO bts VALUES (2, 5);
INSERT INTO bts VALUES (8, 5);
INSERT INTO bts VALUES (5, NULL);

SELECT N, 'ROOT' FROM bts WHERE P IS NULL
UNION
SELECT DISTINCT P, 'INNER' FROM bts WHERE P IS NOT NULL
UNION
SELECT DISTINCT a.N, 'leaf' FROM bts a LEFT JOIN bts b ON a.N = b.P WHERE  b.P IS NULL;