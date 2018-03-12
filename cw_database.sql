--COURSEWORK

--TYPES
create type NameType as object (
  title varchar2(30),
  first_name varchar2(30),
  last_name varchar2(30)
);

create type Address as object (
  street varchar2(30),
  city varchar2(30),
  post_code varchar2(30)
);

create type Phone as object (
  home varchar2(30),
  mobile_1 varchar2(30),
  mobile_2 varchar2(30)
);

create type Person as object (
  my_name NameType,
  address Address,
  phone Phone
);

create type Job as object (
  position varchar2(30),
  salary float,
  date_joined date,
  supervisor_id varchar2(30)
);
--END TYPES






--TABLES
create table Branch (
  branch_id varchar2(20) primary key,
  address Address,
  phone Phone
);

create table Employee (
  
);
--END TABLES















