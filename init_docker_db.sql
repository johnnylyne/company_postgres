CREATE ROLE admin_role WITH SUPERUSER;
CREATE USER administrator WITH PASSWORD 'adminpassword';
GRANT admin_role TO administrator;

SET ROLE=admin_role;
CREATE ROLE main_client;
CREATE SCHEMA main;

CREATE TABLE main.branch(ID INT PRIMARY KEY NOT NULL, ADDRESS TEXT NOT NULL);
CREATE TABLE main.department(ID INT PRIMARY KEY NOT NULL, branch_id INT NOT NULL, NAME VARCHAR(50), CONSTRAINT department_fk_branch FOREIGN KEY (branch_id) REFERENCES main.branch(ID));
CREATE TABLE main.employee(ID INT PRIMARY KEY NOT NULL, department_id INT, FORENAME VARCHAR(25), SURNAME VARCHAR(25) NOT NULL, CONSTRAINT employee_fk_department FOREIGN KEY (department_id) REFERENCES main.department(ID));

GRANT USAGE ON SCHEMA main TO main_client;
GRANT INSERT, DELETE, UPDATE, SELECT ON ALL TABLES IN SCHEMA main TO main_client;

ALTER ROLE main_client SET search_path TO "main", public;
CREATE USER application_user WITH PASSWORD 'password';
GRANT main_client TO application_user;




