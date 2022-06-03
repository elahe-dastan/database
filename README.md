# Database Course -- Spring 2021

## HW1

### Problem 3
Suppose you are a database manager at a company which deliver packages with online requests (such as SnappBox)
The company has a number of users and motor couriers that each order is created by one user and a courier accepts it.
The database design and queries for this system is described in [3.sql](./3.sql).

### Problem 4
The following is a table of students' student numbers and their grades.

```sql
GRADES (id, student_id, course_id, grade)
```

Write a query that returns the average grades of each lesson in the table in [4.sql](./4.sql).

We have tables of student course database and operating system grades (grades are 20).

```sql
DB_GRADES (id, student_id, grade)
OS_GRADES (id, student_id, grade)
```

Note that students in two classes are not necessarily the same, and a student may have only one of these two classes.

Write a query that returns the student number of students who passed the database course while not being rejected in the operating system course.
(If they have not taken the operating system lesson they are also included) in [4.sql](./4.sql).


We have a table called BST that represents a binary search tree and for each node, it specifies the parent of that node.

| N | P |
|:-:|:-:|
| 1 | 2 |
| 3 | 2 |
| 6 | 8 |
| 9 | 8 |
| 2 | 5 |
| 8 | 5 |
| 5 | null |

Write a query that identifies the role of each node among the Leaf, Inner, or Root roles in [4.sql](./4.sql).

```
1 Leaf
2 Inner
3 Leaf
5 Root
6 Leaf
8 Inner
9 Leaf
```

We have a table containing 2 columns named X and Y (x and y are both integers).

```sql
Table1 (x, y)
```

Two rows (X1, Y1) and (X2, Y2) are symmetric if and only if there is a relationship between X2 = Y1 and X1 = Y2.
Write a query that returns all rows whose symmetries are also in the existing table in [4.sql](./4.sql).
