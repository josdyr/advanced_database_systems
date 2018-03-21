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
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('57 Greenwood', 'Birmingham', 'B25 8YU'), jd_Phone('226748586', '640583018', '420716567'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('30 Prince Philip Ave', 'Grays', 'RM16 2BT'), jd_Phone('226748586', '640583018', '420716567'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('7 Rectory St, Middleton', 'Manchester ', 'M24 5TN'), jd_Phone('226748586', '640583018', '420716567'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('17 Wyedale', 'Ellesmere Port', 'CH65 6RJ'), jd_Phone('226748586', '640583018', '420716567'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('9 Barnwood Cl', 'London', 'W9 2RD'), jd_Phone('226748586', '640583018', '420716567'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('320 Sicey Ave', 'Sheffield', 'S5 0EF'), jd_Phone('226748586', '640583018', '420716567'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('50 Dinorben Ave', 'Fleet', 'GU52 7SH'), jd_Phone('226748586', '640583018', '420716567'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('81-87 St John St', 'London', 'EC1M 4NQ'), jd_Phone('226748586', '640583018', '420716567'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('Oldbury Ln, Thornbury', 'Bristol', 'BS35'), jd_Phone('226748586', '640583018', '420716567'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('Norwich Mail Centre', 'Norwich', 'NR1 1AA'), jd_Phone('226748586', '640583018', '420716567'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('1 Sercombes Gardens, Starcross', 'Exeter', 'EX6 8SB'), jd_Phone('226748586', '640583018', '420716567'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('2 Stallington Gardens', 'Stoke', 'ST11 9QG'), jd_Phone('226748586', '640583018', '420716567'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('2 Marshbrook Way', 'Telford', 'TF2 8RN'), jd_Phone('226748586', '640583018', '420716567'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('2 Downe St, Liverton', 'Saltburn', 'TS13 4QQ'), jd_Phone('226748586', '640583018', '420716567'));
insert into jd_Branch_Table values (seq_branch_id.nextval, jd_Address('3 School Ln', 'Stortford', 'CM22 6PH'), jd_Phone('226748586', '640583018', '420716567'));

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
insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Sally', 'Silly'), jd_Address('2 Silly Road', 'Glasgow', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'DX8ZLA25J'), jd_JobType('cashier', 11.6, '04-Dec-2009', '100'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '902', jd_Person(jd_NameType('Mr', 'Freddy', 'Frank'), jd_Address('2 Circus Rd', 'Liverpool', 'RS33 2EF'), jd_Phone('026388971', '293152681', '109093387'), 'PTHR2SC2H'), jd_JobType('manager', 13.4, '08-Jul-2007', '100'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '903', jd_Person(jd_NameType('Mr', 'Rylee', 'Pitt'), jd_Address('2 Central Parade', 'Harrow', 'HA1 2TW'), jd_Phone('418148905', '468212682', '605287140'), '2HALV8UL8'), jd_JobType('project leader', 15.9, '12-Dec-2016', '102'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '904', jd_Person(jd_NameType('Mrs', 'Marsha', 'Draper'), jd_Address('Unnamed Road', 'Betchworth', 'RH3 7AR'), jd_Phone('481906256', '912798671', '275580867'), '1Y7BJS471'), jd_JobType('accountant', 12.3, '14-Sep-2014', '102'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '909', jd_Person(jd_NameType('Mrs', 'Bernadette', 'Baird'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'F9BGHMCGC'), jd_JobType('cashier', 11.7, '04-Dec-2009', '6'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '903', jd_Person(jd_NameType('Mrs', 'Chelsie', 'Rennie'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), '57SJAF6DC'), jd_JobType('cashier', 11.7, '04-Dec-2009', '6'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '903', jd_Person(jd_NameType('Mr', 'Donte', 'Mills'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'P21LXTLSW'), jd_JobType('manager', 11.7, '04-Dec-2009', '6'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '903', jd_Person(jd_NameType('Mrs', 'Lily-Ann', 'Hurst'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'JXLSVBV05'), jd_JobType('project leader', 11.7, '04-Dec-2009', '6'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '900', jd_Person(jd_NameType('Mrs', 'Gina', 'Keeling'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), '1WGDNND1U'), jd_JobType('accountant', 11.7, '04-Dec-2009', '6'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mr', 'Mathew', 'Stein'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'PP4FXISVW'), jd_JobType('cashier', 11.7, '04-Dec-2009', '6'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Gene', 'Ballard'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), '9Y1ZVXB4K'), jd_JobType('accountant', 11.7, '04-Dec-2009', '6'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '901', jd_Person(jd_NameType('Mrs', 'Ella', 'Schneider'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'W8SKR3BW7'), jd_JobType('manager', 11.7, '04-Dec-2009', '6'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '902', jd_Person(jd_NameType('Mr', 'Shani', 'Cooke'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'BMGTEWTK8'), jd_JobType('cashier', 11.7, '04-Dec-2009', '6'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '902', jd_Person(jd_NameType('Mr', 'Yash', 'Maddox'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'P3M3DNLUC'), jd_JobType('cashier', 11.7, '04-Dec-2009', '6'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '903', jd_Person(jd_NameType('Mr', 'Sue', 'Mckay'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), '3WYCGAR67'), jd_JobType('project leader', 11.7, '04-Dec-2009', '6'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '912', jd_Person(jd_NameType('Mrs', 'Vikram', 'Hendricks'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'MTQKRKQ1F'), jd_JobType('manager', 11.7, '04-Dec-2009', '6'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '912', jd_Person(jd_NameType('Mr', 'Aj', 'Dennis'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'WEUP1LT1J'), jd_JobType('cashier', 11.7, '04-Dec-2009', '6'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '917', jd_Person(jd_NameType('Mr', 'Zak', 'Gilmour'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'RM6O5KGIL'), jd_JobType('accountant', 11.7, '04-Dec-2009', '6'));
insert into jd_Employee_Table values (seq_emp_id.nextval, '905', jd_Person(jd_NameType('Mr', 'Eden', 'Devine'), jd_Address('2 Silly Road', 'Edinburgh', 'RS33 2EF'), jd_Phone('844676677', '300341038', '378804980'), 'B66IKICDQ'), jd_JobType('project leader', 11.7, '04-Dec-2009', '6'));

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
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mrs', 'Beatrix', 'Dalby'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Cohen', 'Wicks'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mrs', 'Ella-Louise', 'Sparks'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Lucas', 'Shepherd'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mrs', 'Serena', 'Skinner'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mrs', 'Vanesa', 'Ferreira'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Nelson', 'Bevan'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Bruce', 'Mccormack'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Dustin', 'Whitehouse'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mrs', 'Marwa', 'Leech'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mrs', 'Martyna', 'Horn'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Hareem', 'Woolley'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mrs', 'Eliana', 'Chandler'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mrs', 'Gabriele', 'Betts'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));
insert into jd_Customer_Table values (seq_cust_id.nextval, jd_Person(jd_NameType('Mr', 'Allegra', 'Mohamed'), jd_Address('3 Silly Mountain', 'Singapore', 'RS33 2EF'), jd_Phone('904528551', '142290432', '936200516'), 'K9VXAL5B7'));

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
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '901'), 150.05, 6.2, 800, '27-May-2014', 'current');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '902'), 241.89, 5.6, 1599, '22-Jun-2017', 'savings');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '903'), 43.23, 6.8, 1000, '19-Mar-2016', 'savings');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '903'), 68.07, 5.9, 0, '05-May-2005', 'current');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '902'), 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '902'), 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '900'), 43.23, 6.8, 0.7, '22-Jan-2008', 'savings');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '903'), 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '912'), 43.23, 6.8, 0.7, '22-Jan-2008', 'savings');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '913'), 43.23, 6.8, 0.7, '22-Jan-2008', 'savings');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '918'), 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '903'), 43.23, 6.8, 0.7, '22-Jan-2008', 'savings');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '903'), 43.23, 6.8, 0.7, '22-Jan-2008', 'savings');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '901'), 43.23, 6.8, 0.7, '22-Jan-2008', 'savings');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '902'), 43.23, 6.8, 0.7, '22-Jan-2008', 'current');
insert into jd_Account_Table values (seq_acc_id.nextval, (select ref(b) from jd_Branch_Table b where branch_id = '900'), 43.23, 6.8, 0.7, '22-Jan-2008', 'current');

---

create type jd_CustomerAccountType as object (
    cusomter ref jd_CustomerType,
    account_type ref jd_AccountType
);
/

create table jd_CustomerAccount_Table(
    customer ref jd_CustomerType scope is jd_Customer_Table,
    account_type ref jd_AccountType scope is jd_Account_Table
);
/

-- populate the jd_CustomerAccount_Table:
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1000'), (select ref(a) from jd_Account_Table a where a.account_id = '8000'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1001'), (select ref(a) from jd_Account_Table a where a.account_id = '8001'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1002'), (select ref(a) from jd_Account_Table a where a.account_id = '8002'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1003'), (select ref(a) from jd_Account_Table a where a.account_id = '8002'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1000'), (select ref(a) from jd_Account_Table a where a.account_id = '8003'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1001'), (select ref(a) from jd_Account_Table a where a.account_id = '8000'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1001'), (select ref(a) from jd_Account_Table a where a.account_id = '8001'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1000'), (select ref(a) from jd_Account_Table a where a.account_id = '8002'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1003'), (select ref(a) from jd_Account_Table a where a.account_id = '8002'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1003'), (select ref(a) from jd_Account_Table a where a.account_id = '8003'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1005'), (select ref(a) from jd_Account_Table a where a.account_id = '8000'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1008'), (select ref(a) from jd_Account_Table a where a.account_id = '8001'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1005'), (select ref(a) from jd_Account_Table a where a.account_id = '8002'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1003'), (select ref(a) from jd_Account_Table a where a.account_id = '8002'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1000'), (select ref(a) from jd_Account_Table a where a.account_id = '8003'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1009'), (select ref(a) from jd_Account_Table a where a.account_id = '8000'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1010'), (select ref(a) from jd_Account_Table a where a.account_id = '8001'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1013'), (select ref(a) from jd_Account_Table a where a.account_id = '8002'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1018'), (select ref(a) from jd_Account_Table a where a.account_id = '8002'));
insert into jd_CustomerAccount_Table values ((select ref(c) from jd_Customer_Table c where c.customer_id = '1019'), (select ref(a) from jd_Account_Table a where a.account_id = '8003'));


---

-- Queries:

-- Query a:
column first_name heading 'First|Name', format A10
column last_name heading 'Last|Name', format A10

select e.person.my_name.first_name as first_name,
e.person.my_name.last_name as last_name
from jd_Employee_Table e
where e.person.my_name.first_name like '%Jos%';

-- Query b:

select count(*)
  from jd_Account_Table a, jd_Branch_Table b
  where a.ref_to_branch.branch_id = b.branch_id
    and a.account_type = 'savings'
  group by b.branch_id;

select b.branch_id, (
  select count(*)
    from jd_Account_Table a, jd_Branch_Table b
    where a.ref_to_branch.branch_id = b.branch_id
      and a.account_type = 'savings'
    group by b.branch_id
  )
from jd_Branch_Table b
group by b.branch_id;

-- Query c:
column full_name heading 'Full Name', format A20
column balance heading 'Balance', format A10
column branch_id heading 'Branch ID', format 120

with total_balance_per_customer (branch_id, customer_id, balance) as (
  select a.ref_to_branch.branch_id, c.customer.customer_id, sum(a.balance)
    from jd_CustomerAccount_Table c
      inner join jd_Account_Table a
        on a.account_id = c.account_type.account_id
    where a.account_type = 'savings'
    group by c.customer.customer_id, a.ref_to_branch
)

select c.person.my_name.last_name || ', ' || c.person.my_name.first_name as full_name
    ,t.balance as balance
    ,t.branch_id as branch_id
  from total_balance_per_customer t
    left join jd_Customer_Table c
      on c.customer_id = t.customer_id
  where balance = (select max(balance)
                      from total_balance_per_customer t_2
                      where t.branch_id = t_2.branch_id)

