-- CREATING THE DATABASE

create DATABASE user_roles
use user_roles


--CREATING ALL THE TABLES

create table role (ID int PRIMARY KEY,role_name varchar(100))

create table user_account(
    ID int PRIMARY KEY,
    user_name varchar(100),
    email VARCHAR(254),
    PASSWORD varchar (200),
    password_salt VARCHAR(50) NULL,
    PASSWORD_hash_algorithm VARCHAR(50)
    )

CREATE TABLE user_has_role (
    id INT PRIMARY KEY,
    role_start_time DATETIME,
    role_end_time DATETIME NULL,
    user_account_id INT FOREIGN KEY REFERENCES user_account(id),
    role_id INT FOREIGN KEY REFERENCES role(id)
)

CREATE TABLE status (
    id INT PRIMARY KEY,
    status_name VARCHAR(100),
    is_user_working BIT
)

create TABLE user_has_status(
    ID int PRIMARY KEY,
    status_start_time DATETIME,
    status_end_time DATETIME NULL,
    user_account_id int FOREIGN KEY REFERENCES user_account(id), 
    status_id int FOREIGN KEY REFERENCES status(id)
)

--INESETING THE DATA INTO THE TABLES

INSERT INTO role VALUES 
(1, 'Admin'),
(2, 'Editor');

INSERT INTO user_account VALUES
(1, 'keerat_singh', 'keerat@email.com', 'pass123', 'salt1', 'SHA256'),
(2, 'john_doe', 'john@email.com', 'pass456', 'salt2', 'SHA256');

INSERT INTO status VALUES
(1, 'Active', 1),
(2, 'Inactive', 0);

INSERT INTO user_has_role VALUES
(1, '2024-01-01', NULL, 1, 1),
(2, '2024-02-01', NULL, 2, 2);

INSERT INTO user_has_status VALUES
(1, '2024-01-01', NULL, 1, 1),
(2, '2024-02-01', NULL, 2, 2);


-- DELETING ALL DATA
DELETE FROM user_has_status;
DELETE FROM user_has_role;
DELETE FROM status;
DELETE FROM user_account;
DELETE FROM role;