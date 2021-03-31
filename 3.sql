CREATE TABLE user(
    Id int PRIMARY KEY,
    name varchar(50),
    cellphone varchar(11),
    referred_by int,
    credit int CHECK (user.credit > -1),
    FOREIGN KEY (referred_by) REFERENCES user(Id)
);

CREATE TABLE driver(
    Id int PRIMARY KEY,
    name varchar(50),
    cellphone varchar(11),
    address varchar(255),
    is_active BIT,
    score int
);

CREATE TABLE orders(
    Id int PRIMARY KEY,
    user_id int,
    driver_id int,
    estimated_value int,
    price int,
    is_round_trip BIT,
    start_time TIMESTAMP,
    finish_time TIMESTAMP,
    score int CHECK (score between 1 and 5),
    FOREIGN KEY (user_id) REFERENCES user(Id),
    FOREIGN KEY (driver_id) REFERENCES driver(Id)
);

CREATE TABLE payment(
    Id int PRIMARY KEY,
    user_id int,
    amount int CHECK (MOD(amount, 500) = 0),
    bank varchar(255) CHECK (bank in ('saderat', 'saman', 'sina', 'melli')),
    timing TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(Id)
);

INSERT INTO user VALUES (1, 'parham', 09390909432, NULL , 1000000);
INSERT INTO user VALUES (2, 'raha', 09205705423, 1 , 100000);
INSERT INTO user VALUES (3, 'maryam', 09126404312, NULL , 500000);
INSERT INTO user VALUES (4, 'pegah', 09336005876, 2 , 20000);
INSERT INTO user VALUES (5, 'parham', 09912658428, NULL , 0);
INSERT INTO user VALUES (6, 'sina', 09912238428, NULL , 0);
INSERT INTO user VALUES (7, 'kabir', 09124326785, NULL , 0);

INSERT INTO driver VALUES (1, 'ali kokabi', 09112389543, 'shiraz khiaban 3', 1, 50);
INSERT INTO driver VALUES (2, 'mohammad ziaiy', 09116541234, 'tehran baharestan pelak 2', 1, 150);
INSERT INTO driver VALUES (3, 'hossein shamsi', 09123360013, 'karaj fardis dehkade', 0, 20);
INSERT INTO driver VALUES (4, 'negin shamshiri', 09335994632, 'damavand', 1, 0);
INSERT INTO driver VALUES (5, 'aliakbar donyadoost', 09126589845, 'esfahan khiaban 3', 0, 50);
INSERT INTO driver VALUES (6, 'sina', 09124326785, NULL , 1, 10);

INSERT INTO orders VALUES (1, 1, 2, 5000000, 100000, 0, current_timestamp , NULL , NULL );
INSERT INTO orders VALUES (2, 3, 1, 300000, 20000, 0, '2021-02-10 21:11:37' , '2021-02-10 22:34:37' , 1 );
INSERT INTO orders VALUES (3, 4, 4, 1000, 2000, 0, '2021-02-20 11:11:37' , '2021-02-10 22:34:37' , 2 );
INSERT INTO orders VALUES (4, 5, 1, 400000, 70000, 0, '2021-04-10 13:11:37' , '2021-04-10 15:34:37' , 4 );
INSERT INTO orders VALUES (5, 2, 2, 6000000, 900000, 0, '2021-06-10 21:11:37' , '2021-06-10 21:34:37' , 3 );
INSERT INTO orders VALUES (6, 7, NULL, 500000, 950000, 0, NULL , NULL , NULL );
INSERT INTO orders VALUES (7, 7, NULL, 500000, 950000, 0, NULL , NULL , NULL );
INSERT INTO orders VALUES (8, 4, 4, 1000, 2000, 0, '2021-02-20 11:11:37' , '2021-02-21 22:34:37' , 2 );
INSERT INTO orders VALUES (9, 1, 3, 5000000, 100000, 0, '2021-02-20 11:11:37' , '2021-02-20 11:59:37' , 5 );

INSERT INTO payment VALUES (1, 1, 100000, 'sina', current_timestamp);
INSERT INTO payment VALUES (2, 2, 10000, 'saman', '2021-06-10 21:11:37');
INSERT INTO payment VALUES (3, 3, 200000, 'saderat', '2021-06-10 21:11:37');
INSERT INTO payment VALUES (4, 4, 50000, 'melli', '2021-06-10 21:11:37');
INSERT INTO payment VALUES (5, 5, 800000, 'sina', '2021-06-10 21:11:37');

UPDATE user SET name='farbod' WHERE Id=1;

SELECT name FROM user LEFT JOIN orders o on user.Id = o.user_id WHERE o.user_id IS NULL;

DELETE u FROM user u LEFT JOIN orders o on u.Id = o.user_id WHERE o.user_id IS NULL;

SELECT Id FROM user WHERE name='farbod';

SELECT cellphone FROM user WHERE cellphone IN (SELECT cellphone FROM driver);

SELECT name FROM user u JOIN (SELECT user_id, driver_id FROM orders WHERE driver_id IS NULL GROUP BY user_id, driver_id HAVING COUNT(*) > 1) o ON o.user_id = u.Id;

SELECT * FROM orders WHERE DATEDIFF(finish_time, start_time) = 1;

SELECT * FROM user WHERE Id IN (SELECT user_id FROM orders WHERE driver_id IS NOT NULL GROUP BY user_id, driver_id HAVING COUNT(*) > 1);

SELECT AVG(TIMESTAMPDIFF(SQL_TSI_MINUTE, start_time, finish_time)) AS minutes FROM orders WHERE score > 3;

SELECT u.*, AVG(score) FROM user u JOIN orders o ON u.Id = o.user_id GROUP BY user_id ORDER BY AVG(score) DESC LIMIT 5;

SELECT d.*, SUM(amount) FROM driver d JOIN orders o ON d.Id = o.driver_id JOIN payment p on p.user_id = o.user_id AND p.timing = o.start_time GROUP BY o.driver_id ORDER BY SUM(amount) DESC LIMIT 1;

SELECT AVG(score) FROM orders WHERE user_id IN (SELECT user_id FROM payment WHERE bank='sina');

SELECT SUM(amount) FROM payment WHERE user_id IN (SELECT a.Id FROM user a JOIN user b ON a.referred_by = b.Id WHERE b.name='farbod');
