--COURSEWORK

-- Drop Types and Tables
drop type jd_NameType force;
drop type jd_Address force;
drop type jd_Phone force;
drop type jd_Person force;
drop type jd_JobType force;
drop type jd_BranchType force;
drop type jd_EmployeeType force;

--TYPES
create type jd_NameType as object (
  title varchar2(4),
  first_name varchar2(30),
  last_name varchar2(30)
);
/
create type jd_Address as object (
  street varchar2(30),
  city varchar2(30),
  post_code varchar2(30)
);
/
create type jd_Phone as object (
  home varchar2(30),
  mobile_1 varchar2(30),
  mobile_2 varchar2(30)
);
/
create type jd_Person as object (
  my_name jd_NameType,
  address jd_Address,
  phone jd_Phone,
  nin varchar2(9)
);
/
create type jd_JobType as object (
  position varchar2(30),
  salary float,
  date_joined date,
  supervisor_id varchar2(30)
);
/


---


create type jd_BranchType as object (
    branch_id varchar2(20),
    address jd_Address,
    phone jd_Phone
);
/
create sequence seq_branch_id minvalue 1 start with 1 increment by 1 cache 10;
create table jd_Branch_Table of jd_BranchType;

insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('33 Banking Street', 'Edinburgh', 'EH52 1BR'), jd_Phone('605512336', '200501952', null));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('34 MoneyLand', 'Glasgow', 'EH12 1FF'), jd_Phone('598466542', 'null', null));

---

create type jd_EmployeeType as object(
    emp_id varchar2(20),
    branch_id varchar2(20),
    person jd_Person,
    job jd_JobType
);
/
create sequence seq_emp_id minvalue 1 start with 1 increment by 1 cache 10;
create table jd_Employee_Table of jd_EmployeeType;

insert into jd_Employee_Table values (seq_emp_id.nextval, '1', jd_Person(jd_NameType('Mr', 'Jostein', 'Dyrseth'), jd_Address('39 Watson Circ', 'Edinburgh', 'EH22 2BD'), jd_Phone('637189720', '329257287', '828613241'), 'SEB5JCKTP'), jd_JobType('Project Leader', 15.7, '22-May-2012', '1'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '2', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));

---

create type jd_CustomerType as object (
    customer_id varchar2(30),
    person jd_Person
);
/

create sequence seq_cust_id minvalue 1 start with 1 increment by 1 cache 10;
create table jd_Customer_Table of jd_CustomerType;

insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Jostein', 'Dyrseth'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'SEB5JCKTP'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mrs', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));

---

create type jd_AccountType as object (
    account_id varchar2(30),
    branch_id varchar2(30),
    balance float,
    in_rate float,
    od_limit float,
    date_opened date,
    account_type varchar2(30) -- add constraint
);
/

create sequence seq_acc_id minvalue 1 start with 1 increment by 1 cache 10;
create table jd_Account_Table of jd_AccountType;

insert into jd_Account_Table values (seq_acc_id.nextval, '1', 56.89, 2.5, 0.3, '24-Mar-2011', 'savings');
insert into jd_Account_Table values (seq_acc_id.nextval, '2', 43.23, 6.8, 0.7, '22-Jan-2008', 'current');

---

create type jd_CustomerAccountType as object (
    cusomter_id ref jd_CustomerType,
    account_id ref jd_AccountType
);
/

create table jd_CustomerAccount_Table(
    customer_id ref jd_CustomerType scope is jd_Customer_Table,
    account_id ref jd_AccountType scope is jd_Account_Table
);
/

-- populate the jd_CustomerAccount_Table:
insert into jd_CustomerAccount_Table
select ref(c), ref(a)
from jd_Customer_Table c, jd_Account_Table a;
/