CREATE TABLE IF NOT EXISTS Persons (
    id IDENTITY PRIMARY KEY auto_increment,
    firstName varchar(200),
    lastName varchar(200)
);

INSERT INTO Persons (firstName, lastName) values ('Billy', 'Korando');
INSERT INTO Persons (firstName, lastName) values ('Johnny', 'Appleseed');
INSERT INTO Persons (firstName, lastName) values ('Roger', 'Goodell');