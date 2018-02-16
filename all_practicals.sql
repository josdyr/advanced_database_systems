-- START OF PRACTICAL 1:

-- BEGIN 1.3:
-- DROP TABLE Branch;
CREATE TABLE Branch (
  b_id VARCHAR2(5) NOT NULL PRIMARY KEY,
  street VARCHAR2(20),
  city VARCHAR2(20),
  p_code VARCHAR2(7),
  b_phone VARCHAR2(8)
);

-- DROP TABLE Account;
CREATE TABLE Account (
  acc_num VARCHAR2(16),
  acc_type VARCHAR2(20),
  balance FLOAT(53),
  b_id VARCHAR2(5) NOT NULL,
  in_rate FLOAT(53),
  limit_of_free_od INT,
  open_date DATE
);

-- DROP TABLE Employee;
CREATE TABLE Employee (
  emp_id VARCHAR2(8),
  street VARCHAR2(30),
  city VARCHAR2(20),
  postcode VARCHAR2(8),
  firstname VARCHAR2(20),
  surename VARCHAR2(20),
  phone VARCHAR2(11)
);

-- DROP TABLE Customer;
CREATE TABLE Customer (
  cust_id VARCHAR2(6),
  city VARCHAR2(20),
  post_code VARCHAR2(8),
  firstname VARCHAR2(20),
  surename VARCHAR2(20),
  cust_mobile VARCHAR2(20),
  salary INT
);

--DROP TABLE Customer_Account;
CREATE TABLE Customer_Account (
  cust_id VARCHAR2(20),
  acc_num VARCHAR2(16)
);

INSERT INTO Branch VALUES ('55494','New Cathedral Street','Oslo','6th0w9l','64817894');
INSERT INTO Branch VALUES ('79274','Oldham Street','London','sd0s21e','81419399');
INSERT INTO Branch VALUES ('82629','Oxford Road','Dublin','m4yspoq','07423516');
INSERT INTO Branch VALUES ('49870','Portland Street','Edinburgh','n7mjd5y','37954073');
INSERT INTO Branch VALUES ('99194','King Street','Glasgow','ar5udij','19356430');

INSERT INTO Account VALUES ('3949724459285288','Debit',844.08,'82629',2,1000,TO_DATE('1989-12-09','YYYY-MM-DD'));
INSERT INTO Account VALUES ('9602535014261658','Credit',116.23,'55494',2,1000,TO_DATE('2017-11-11','YYYY-MM-DD'));
INSERT INTO Account VALUES ('9432453402335141','Debit',185.78,'49870',2,1000,TO_DATE('2018-01-11','YYYY-MM-DD'));
INSERT INTO Account VALUES ('0204240135646079','Mastercard',618.51,'99194',2,1000,TO_DATE('2010-01-11','YYYY-MM-DD'));
INSERT INTO Account VALUES ('1148417313054060','Mastercard',580.31,'79274',2,1000,TO_DATE('2006-03-11','YYYY-MM-DD'));

INSERT INTO Employee VALUES ('fvczbshm','Abby Park Street','Aberdeen','TS28 5NT','Isaac','Bartlett',39283381586);
INSERT INTO Employee VALUES ('gxr9eaq5','Corn Street','Bath','TF13 6EJ','Archie','Lane',39283381586);
INSERT INTO Employee VALUES ('yz88bf2n','Morningside Edinburgh','Belfast','PA9 1BW','Elliot','Hewitt',39283381586);
INSERT INTO Employee VALUES ('iw1doahu','Mitch Cromwood Avenue','Birmingham','M34 5RS','Caitlin','Bibi',39283381586);
INSERT INTO Employee VALUES ('njembj68','Mayores Road','Canterbury','M7 4JT','Louise','Harris',39283381586);


INSERT INTO Customer VALUES ('123456','Edinburgh','EH11 2BG','Jostein','Dyrseth','90840000', 500);
INSERT INTO Customer VALUES ('234567','Glasgow','EH22 2XX','Ross','Newtonshire','12332122', 3000);
INSERT INTO Customer VALUES ('789456','Edinburgh','GY29 2HM','Freddy','Bash','90840000', 2700);
INSERT INTO Customer VALUES ('555555','Sweeden','12 B 4','Sofie','Sof','12312322', 2900);
INSERT INTO Customer VALUES ('333333','Brasil','55 55 B','Max','Macintire','45216789', 3900);

INSERT INTO Customer_Account VALUES ('qelLZY6fkiKy','zrczvquyprqgceqd');
INSERT INTO Customer_Account VALUES ('hvVD0pe0NmRp','mmsstqszjnbgvhsh');
INSERT INTO Customer_Account VALUES ('Nqi7FQx8E0zv','dhckthxfbblnyttj');
INSERT INTO Customer_Account VALUES ('fHVsyfNYWAhz','zxfkqyoapscgrjhj');
INSERT INTO Customer_Account VALUES ('phWX7n0JpNOO','wkqveertwhgeilko');

-- BEGIN: 1.2
SELECT * FROM Customer
WHERE firstname LIKE '%Jo%';

-- BEGIN: 1.3
SELECT * FROM Customer
WHERE salary > 2800;

-- BEGIN: 1.4
SELECT * FROM Employee
WHERE street = 'Morningside Edinburgh';

-- BEGIN: 1.5
-- SKIPPED: Do not have attribute 'SupervisorID' implemented yet.

-- BEGIN: 1.6
SELECT * FROM Employee
WHERE street = 'Morningside Edinburgh'
AND salary > 2000;

-- BEGIN: 1.7
SELECT * FROM Account
WHERE open_date < TO_DATE('2016-01-09','YYYY-MM-DD');

-- BEGIN: 1.8
SELECT MAX(balance) FROM Account;

-- END OF PRACTICAL 1:


-- 🙂


-- START OF PRACTICAL 2:

-- BEGIN 1.2:
-- drop type NameType force;
create type NameType as object(
  first_name varchar2(30),
  middle_name varchar2(30),
  last_name varchar2(30)
);

-- drop type Street force;
create type Street as object(
  street_number number,
  street_name varchar2(30)
);

-- drop type Address force;
create type Address as object(
  street_and_number Street,
  post_code varchar2(8),
  flat_number number,
  city varchar2(30),
  conuntry varchar2(30)
);

-- drop type Phone force;
create type Phone as object(
  home varchar2(11),
  mobile varchar2(11),
  business varchar2(11)
);

-- drop type Person force;
create type Person as object(
  p_name NameType,
  p_phone Phone,
  p_address Address,
  gender varchar2(6)
) not final;

-- drop table Person_Table;
create table Person_Table of Person;
-- END 1.2

-- BEGIN 2.2:
insert into Person_Table values(NameType('Jostein', 'H', 'Dyrseth'), Phone('53808599289', '90264748141', '84042285297'), Address(Street(39, 'Watson Cresent'), 'EH11 1ER', 6, 'Edinburgh', 'Scotland'), 'male');
insert into Person_Table values(NameType('Frode', null, 'Dyrseth'), Phone('28690014259', '56289249963', '71126010960'), Address(Street(12, 'Aurdalsveien'), '5576', 5, 'Vats', 'Norway'), 'male');
insert into Person_Table values(NameType('Britt', 'E', 'Haugland'), Phone('21895836859', '25191818995', '09526048173'), Address(Street(14, 'Melkeveien'), '5565', 10, 'Tysver', 'Norway'), 'female');
insert into Person_Table values(NameType('Evy', 'E', 'Dyrseth'), Phone('93081478672', '64104064080', '43540940170'), Address(Street(39, 'Evy Veien'), '4489', 6, 'Vindafjord', 'Norway'), 'female');
insert into Person_Table values(NameType('Asbjorn', 'H', 'Dyrseth'), Phone('96017719078', '13869922648', '72511560363'), Address(Street(39, 'Aurdalsveien'), '4489', 6, 'Vindafjord', 'Norway'), 'male');
-- END 2.2

-- BEGIN 2.3:
select p.p_name.last_name, p.p_address.street_and_number.street_number, p.p_address.street_and_number.street_name from Person_Table p
where p.p_name.first_name = 'Jostein'
and p.p_name.last_name = 'Dyrseth';
-- END 2.3

-- BEGIN 2.4:
SELECT *
FROM Person_Table;
/
SELECT p_name
FROM Person_Table;
/
SELECT p.p_name.last_name
FROM Person_Table p;
/
SELECT p.p_name.last_name
FROM Person_Table p
WHERE p.p_name.first_name = 'Jostein';
/
-- END 2.4

-- BEGIN 2.5:
-- SEE TASK 2.1: Already implemented
-- END 2.5

-- BEGIN 2.6:
-- SEE TASK 2.1: Already implemented
-- END 2.6

-- BEGIN 2.7:
-- SEE TASK 2.1: Already implemented
-- END 2.7

-- BEGIN 2.8:
-- SEE TASK 2.2: Already done
-- END 2.8

-- BEGIN 2.9:
-- SEE TASK 2.1: Already implemented
-- END 2.9

-- BEGIN 2.10:
-- drop type Employee force;
create type Employee under Person(
  emp_id int
) not final;
-- END 2.10

-- BEGIN 2.11:
-- drop table Emplayee_Table;
create table employee_table of Employee;

insert into employee_table values(NameType('Jostein', 'H', 'Dyrseth'), Phone('53808599289', '90264748141', '84042285297'), Address(Street(39, 'Watson Cresent'), 'EH11 1ER', 6, 'Edinburgh', 'Scotland'), 'male', 3672);
insert into employee_table values(NameType('Frode', null, 'Dyrseth'), Phone('28690014259', '56289249963', '71126010960'), Address(Street(12, 'Aurdalsveien'), '5576', 5, 'Vats', 'Norway'), 'male', 8231);
insert into employee_table values(NameType('Britt', 'E', 'Haugland'), Phone('21895836859', '25191818995', '09526048173'), Address(Street(14, 'Melkeveien'), '5565', 10, 'Tysver', 'Norway'), 'female', 1665);
-- END 2.11

-- BEGIN 2.12:
-- drop type Job force;
create type Job as object(
  jobtitle varchar2(20),
  job_id int,
  salary_amout int,
  years_of_experience int
);
-- END 2.12

-- BEGIN 2.13:
-- drop table job_table force;
create table job_table of Job;

insert into job_table values('Software Engineer', 3672, 82814, 8);
insert into job_table values('Mechanical Engineer', 3128, 55323, 5);
insert into job_table values('System IT', 6008, 67864, 12);
insert into job_table values('DB Admin', 8778, 77223, 6);
insert into job_table values('Intern', 6050, 46846, 2);
-- END 2.13

-- BEGIN 2.14:
alter table job_table add primary key (job_ID);
alter table employee_table add primary key (emp_ID);
-- END 2.14

-- END OF PRACTICAL 2


-- 🙂


-- START OF PRACTICAL 3:

-- BEGIN NOTES:
-- 'ref' is used to make a key in a table
-- ref() takes in a table asias associated with a row of an object table, and returns the ref to that object
-- value() takes as its argument a table asias associated with a row of an object table and retyrns object instances stored in the object table
-- deref() takes the ref to an object as its argument and returns the instance of the object type
-- END NOTES

-- BEGIN TASK 3.2:
create type employment as object (
  employee_r ref employee,
  position ref job
);
/
create table employment_table (
  employee ref employee scope is employee_table,
  position ref job scope is job_table
);
/
insert into employment_table table
select ref(e), ref(j)
from job_table j, employee_table e
where e.emp_ID = 12
and j.job_ID = 1;
/
insert into employment_table
select ref(e), ref(j)
from job_table j, employee_table e
where e.emp_ID = 13
and j.job_ID = 2;
/
insert into employment_table
select ref(e), ref(j)
from job_table j, employee_table e
where e.emp_ID = 14
and j.job_ID = 3;
-- END TASK 3.2

-- START TASK 3.3:
select * from employment_table;
-- END TASK 3.3

-- START TASK 3.4:
-- END TASK 3.4

-- START TASK 3.5:
-- END TASK 3.5

-- START TASK 3.6:
-- END TASK 3.6

-- START TASK 3.7:
-- END TASK 3.7

-- START TASK 3.8:
-- END TASK 3.8

-- START TASK 3.0:
-- END TASK 3.9

-- START TASK 3.10:
-- END TASK 3.10

-- START TASK 3.11:
-- END TASK 3.11

-- START TASK 3.12:
-- END TASK 3.12

-- START TASK 3.13:
-- END TASK 3.13







-- END OF PRACTICAL 3


-- 🙂


-- START OF PRACTICAL 4:
-- END OF PRACTICAL 4
