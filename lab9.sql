--1 JOINS
SELECT * FROM dealer CROSS JOIN client;--a
SELECT d.name, c.name, priority, date, amount FROM dealer d--b
    JOIN client c on d.id = c.dealer_id
    JOIN sell s on d.id = s.dealer_id and c.id = s.client_id;
SELECT d.name, c.name, location, city FROM dealer d--c
    JOIN client c on d.location = c.city;
SELECT s.id, amount, c.name, c.city FROM sell s--d
    JOIN client c on client_id = c.id WHERE amount BETWEEN 100 and 500;
SELECT d.name, c.name FROM dealer d--e
    JOIN client c on d.id = c.dealer_id;
SELECT d.name, c.name, city, charge as comission FROM dealer d--f
    JOIN client c on d.id = c.dealer_id
    JOIN sell s on c.id = s.client_id and s.dealer_id = d.id;
SELECT c.name, city, d.name, charge as comission FROM dealer d--g
    JOIN client c on d.id = c.dealer_id
    JOIN sell s on c.id = s.client_id and s.dealer_id = d.id WHERE charge > 0.12;
SELECT c.name, city, s.id, date, amount, d.name, charge as comission FROM dealer d--h
    JOIN client c on d.id = c.dealer_id
    JOIN sell s on c.id = s.client_id and s.dealer_id = d.id;
SELECT c.name, priority, d.name, s.id, amount FROM dealer d--i
    JOIN client c on d.id = c.dealer_id
    JOIN sell s on c.id = s.client_id and s.dealer_id = d.id where priority IS NOT NULL;
--2 VIEWS
CREATE OR REPLACE VIEW view AS--a
    SELECT date, count(c.id), avg(s.amount), sum(s.amount)
    FROM client c, sell s GROUP BY date;
CREATE OR REPLACE VIEW view AS--b
    SELECT date, sum(amount)
    FROM sell GROUP BY date ORDER BY sum(amount) DESC LIMIT 5;
CREATE OR REPLACE VIEW view AS--c
    SELECT count(s.id), avg(s.id), sum(s.id)
    FROM sell s, dealer d WHERE s.dealer_id = d.id
    GROUP BY d.id;
CREATE OR REPLACE VIEW view AS--d
    SELECT sum(earn), d.location
    FROM sell s, (SELECT d.id, amount*charge as earn, amount, charge, location
                  FROM sell s , dealer d WHERE s.dealer_id = d.id) as d
    WHERE s.dealer_id = d.id
    GROUP BY d.location;
CREATE OR REPLACE VIEW view AS--e
    SELECT count(s.id), avg(s.amount), sum(amount), d.location
    FROM sell s, dealer d WHERE d.id = s.dealer_id
    GROUP BY location;
CREATE OR REPLACE VIEW view AS--f
    SELECT count(s.id), avg(s.amount), sum(s.amount)
    FROM sell s, client c WHERE c.id = s.client_id
    GROUP BY city;
CREATE OR REPLACE VIEW view AS--g
    SELECT * FROM (SELECT sum(amount) as expenses, city
                   FROM sell s, client c WHERE s.client_id = c.id
                                         GROUP BY city) AS exus
    FULL JOIN (SELECT sum(amount) as amount, location
               FROM sell s, dealer d WHERE s.dealer_id = d.id
                                     GROUP BY location) as amou on city = location
    WHERE expenses > amount or expenses ISNULL or amount ISNULL;

DROP VIEW view;
