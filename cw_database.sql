--COURSEWORK

-- Drop Types and Tables
drop type jd_NameType force;
drop type jd_Address force;
drop type jd_Phone force;
drop type jd_Person force;
drop type jd_JobType force;
drop type jd_BranchType force;
drop type jd_EmployeeType force;
drop table jd_Employee_Table;
drop type jd_CustomerType force;
drop table jd_Customer_Table;
drop type jd_AccountType force;
drop table jd_Account_Table;
drop type jd_CustomerAccountType force;
drop table jd_CustomerAccount_Table;
drop table jd_Branch_Table;


--TYPES
create type jd_NameType as object (
  title varchar2(3),
  first_name varchar2(30),
  last_name varchar2(30)
);
/
create type jd_Address as object (
  street varchar2(30),
  city varchar2(30),
  post_code varchar2(8)
);
/
create type jd_Phone as object (
  home varchar2(9),
  mobile_1 varchar2(9),
  mobile_2 varchar2(9)
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
  supervisor_id varchar2(4)
);
/


---


create type jd_BranchType as object (
    branch_id varchar2(4),
    address jd_Address,
    phone jd_Phone
);
/

drop sequence seq_branch_id;
create sequence seq_branch_id minvalue 900 start with 900 increment by 1 cache 10;
create table jd_Branch_Table of jd_BranchType;

insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('33 Banking Street', 'Edinburgh', 'EH52 1BR'), jd_Phone('605512336', '200501952', '362008274'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('34 MoneyLand', 'Glasgow', 'EH12 1FF'), jd_Phone('598466542', '271075788', '718898143'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('145 Dollar St S', 'Manchester', 'M14 7LA'), jd_Phone('979489180', '957926665', '452269442'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('9 Cash Corner', 'Cairndow', 'PA26 8BL'), jd_Phone('852898633', '526498213', '845160644'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));
--insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));
--insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));
--insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));
--insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));
--insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));
--insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));
--insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));
--insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));
--insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));
--insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));
--insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));
--insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));
--insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));
--insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));
--insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 Greedy Pl', 'Coldstream', 'TD12 4BF'), jd_Phone('226748586', '640583018', '420716567'));

---

create type jd_EmployeeType as object(
    emp_id varchar2(4),
    branch_id varchar2(4),
    person jd_Person,
    job jd_JobType
);
/

drop sequence seq_emp_id;
create sequence seq_emp_id minvalue 100 start with 100 increment by 1 cache 10;
create table jd_Employee_Table of jd_EmployeeType(
    constraint job_position check (job.position in ('head', 'manager', 'project leader', 'accountant', 'cashier'))
);

insert into jd_Employee_Table values (seq_emp_id.nextval, '900', jd_Person(jd_NameType('Mr', 'Jostein', 'Dyrseth'), jd_Address('39 Watson Circ', 'Edinburgh', 'EH22 2BD'), jd_Phone('637189720', '329257287', '828613241'), 'SEB5JCKTP'), jd_JobType('head', 15.7, '22-May-2012', null));
insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Glasgow', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('cashier', 11.6, '04-Dec-2009', '100'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '902', jd_Person(jd_NameType('Mr', 'Freddy', 'Frank'), jd_Address('2 Circus Rd', 'Liverpool', 'RS33 2EF'), jd_Phone('026388971', '293152681', '109093387'), 'K9VXAL5B7'), jd_JobType('manager', 13.4, '08-Jul-2007', '100'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '903', jd_Person(jd_NameType('Mr', 'Rylee', 'Pitt'), jd_Address('2 Central Parade', 'Harrow', 'HA1 2TW'), jd_Phone('418148905', '468212682', '605287140'), 'K9VXAL5B7'), jd_JobType('project leader', 15.9, '12-Dec-2016', '102'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '904', jd_Person(jd_NameType('Mrs', 'Joy', 'Gallegos'), jd_Address('Unnamed Road', 'Betchworth', 'RH3 7AR'), jd_Phone('481906256', '912798671', '275580867'), 'K9VXAL5B7'), jd_JobType('accountant', 12.3, '14-Sep-2014', '102'));
--insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));
--insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));
--insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));
--insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));
--insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));
--insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));
--insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));
--insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));
--insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));
--insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));
--insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));
--insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));
--insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));
--insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));
--insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'K9VXAL5B7'), jd_JobType('Cashier', 11.7, '04-Dec-2009', '6'));

---

create type jd_CustomerType as object (
    customer_id varchar2(4),
    person jd_Person
);
/

drop sequence seq_cust_id;
create sequence seq_cust_id minvalue 1000 start with 1000 increment by 1 cache 10;
create table jd_Customer_Table of jd_CustomerType;

insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mrs', 'Britt', 'Haugland'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'SEB5JCKTP'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Michael', 'Bochdaniec'), jd_Address('38 Fredora Ave', 'Hayes', 'UB4 8RD'), jd_Phone('435025996', '449949966', '769475178'), '57WGKFJOU'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Kristian', 'Kristiansen'), jd_Address('2 Pulshayes Cottages', 'Honiton', 'EX14 3NW'), jd_Phone('053540658', '928199935', '255653093'), '1KSGU5EFV'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Peter', 'Pan'), jd_Address('88 Gores Ln, Formby', 'Liverpool', 'L37 7DE'), jd_Phone('488474030', '301728216', '949549920'), 'AYFTT5AM7'));
--insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
--insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
--insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
--insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
--insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
--insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
--insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
--insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
--insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
--insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
--insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
--insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
--insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
--insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
--insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Frode', 'Dyrseth'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));

---

-- drop type jd_AccountType force;
create type jd_AccountType as object (
    account_id varchar2(30),
    ref_to_branch REF jd_branchType,
    balance float,
    interest_rate float,
    od_limit float,
    date_opened date,
    account_type varchar2(30)
);
/

drop sequence seq_acc_id;
create sequence seq_acc_id minvalue 8000 start with 8000 increment by 1 cache 10;
create table jd_Account_Table of jd_AccountType(
    constraint account_id_constraint unique (account_id),
    constraint account_type_constraint check (account_type in ('current', 'savings'))
);
/

insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '900'), 56.89, 2.5, 800, '24-Mar-2015', 'savings');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '900'), 80.97, 3.8, 1000, '12-Feb-2018', 'savings');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '900'), 12.06, 2.2, 300, '13-Jan-2004', 'savings');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '901'), 330.43, 1.9, 450, '04-Dec-2015', 'savings');
--insert into jd_Account_Table values (seq_acc_id.nextval, '900', 150.05, 6.2, 800, '27-May-2014', 'current');
--insert into jd_Account_Table values (seq_acc_id.nextval, '901', 241.89, 5.6, 1599, '22-Jun-2017', 'current');
--insert into jd_Account_Table values (seq_acc_id.nextval, '901', 43.23, 6.8, 1000, '19-Mar-2016', 'savings');
--insert into jd_Account_Table values (seq_acc_id.nextval, '901', 68.07, 5.9, 0, '05-May-2005', 'current');
--insert into jd_Account_Table values (seq_acc_id.nextval, '900', 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
--insert into jd_Account_Table values (seq_acc_id.nextval, '900', 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
--insert into jd_Account_Table values (seq_acc_id.nextval, '900', 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
--insert into jd_Account_Table values (seq_acc_id.nextval, '900', 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
--insert into jd_Account_Table values (seq_acc_id.nextval, '900', 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
--insert into jd_Account_Table values (seq_acc_id.nextval, '900', 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
--insert into jd_Account_Table values (seq_acc_id.nextval, '900', 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
--insert into jd_Account_Table values (seq_acc_id.nextval, '900', 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
--insert into jd_Account_Table values (seq_acc_id.nextval, '900', 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
--insert into jd_Account_Table values (seq_acc_id.nextval, '900', 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
--insert into jd_Account_Table values (seq_acc_id.nextval, '900', 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
--insert into jd_Account_Table values (seq_acc_id.nextval, '900', 43.23, 6.8, 0.7, '22-Jan-2008', 'current');

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

---

-- Queries:

-- Query a:
column first_name heading 'First|Name'
column first_name format A10
column last_name heading 'Last|Name'
column last_name format A10

select e.person.my_name.first_name as first_name,
e.person.my_name.last_name as last_name
from jd_Employee_Table e
where e.person.my_name.first_name like '%Jos%';

-- Query b:


--select distinct a.ref_to_branch.branch_id,
--count(a.account_type) from jd_Account_Table a
--where a.account_type = 'savings'
--group by a.account_id,a.ref_to_branch.branch_id;


select b.branch_id, (select count(*) from jd_account_table a where a.)
from jd_Branch_Table b
group by branch_id;

