CREATE TABLE Warehouses (
    code_integer int NOT NULL PRIMARY KEY,
    location_character_varying varchar(255),
    capacity_integer int NOT NULL
);

CREATE TABLE Boxes (
    code_character varchar(4),
    contents_character_varying varchar(255),
    value_real int NOT NULL,
    warehouse_integer int NOT NULL,
    FOREIGN KEY (warehouse_integer) references Warehouses
);

SELECT * FROM Warehouses;
SELECT * FROM Boxes WHERE value_real > 150;
SELECT DISTINCT contents_character_varying FROM Boxes;
SELECT code_integer, count(warehouse_integer) FROM Boxes, Warehouses
WHERE warehouse_integer = Warehouses.code_integer
GROUP BY code_integer ORDER BY code_integer;
SELECT code_integer, count(warehouse_integer) FROM Boxes, Warehouses
WHERE warehouse_integer = Warehouses.code_integer AND warehouse_integer > 2
GROUP BY code_integer ORDER BY code_integer;
INSERT INTO Warehouses VALUES (6, 'New York', 3);
INSERT INTO Boxes VALUES ('H5RT', 'Papers', 200, 2);
UPDATE Boxes
SET value_real = value_real + value_real*0.15
WHERE value_real = (SELECT value_real FROM (SELECT value_real FROM Boxes ORDER BY value_real DESC LIMIT 1 OFFSET 2) as Top3); --wrong one
SELECT * FROM Boxes ORDER BY value_real DESC;
DELETE FROM Boxes WHERE value_real <= 150;
DELETE FROM Boxes WHERE warehouse_integer = (SELECT code_integer FROM Warehouses WHERE location_character_varying = 'New York')
RETURNING *;

--DROP TABLE Boxes, Warehouses;