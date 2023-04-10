INSERT INTO locations VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas');
INSERT INTO locations VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California');
INSERT INTO locations VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington');
INSERT INTO locations VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario');
INSERT INTO locations VALUES (2400,'8204 Arthur St',NULL,'London',NULL);
INSERT INTO locations VALUES (2500,'The Oxford Science Park','OX9 9ZB','Oxford','Oxford');
INSERT INTO locations VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria');

INSERT INTO departments VALUES (1,'Administration',150000,1700);
INSERT INTO departments VALUES (2,'Marketing',200000,1800);
INSERT INTO departments VALUES (3,'Purchasing',130000,1700);
INSERT INTO departments VALUES (4,'Human Resources',140000,2400);
INSERT INTO departments VALUES (5,'Shipping',125000,1500);
INSERT INTO departments VALUES (6,'IT',250000,1400);
INSERT INTO departments VALUES (7,'Public Relations',170000,2700);
INSERT INTO departments VALUES (8,'Sales',180000,2500);
INSERT INTO departments VALUES (9,'Executive',120000,1700);
INSERT INTO departments VALUES (10,'Finance',200000,1700);
INSERT INTO departments VALUES (11,'Accounting',180000,1700);

INSERT INTO employees VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568',17000,NULL,9);
INSERT INTO employees VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569',17000,NULL,9);
INSERT INTO employees VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567',9000,102,6);
INSERT INTO employees VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568',6000,103,6);
INSERT INTO employees VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569',4800,103,6);
INSERT INTO employees VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560',4800,103,6);
INSERT INTO employees VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567',4200,103,6);
INSERT INTO employees VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569',12000,101,10);
INSERT INTO employees VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169',9000,108,10);
INSERT INTO employees VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269',8200,108,10);
INSERT INTO employees VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369',7700,108,10);
INSERT INTO employees VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469',7800,108,10);
INSERT INTO employees VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567',6900,108,10);
INSERT INTO employees VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561',11000,NULL,3);
INSERT INTO employees VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562',3100,114,3);


INSERT INTO job_grades VALUES ('1',4200,9000);
INSERT INTO job_grades VALUES ('2',8200,16000);
INSERT INTO job_grades VALUES ('3',3000,6000);
INSERT INTO job_grades VALUES ('4',20000,40000);
INSERT INTO job_grades VALUES ('5',15000,30000);