use mysql;
create table car(
  reg_num varchar(20),
  model varchar(20),
  year int,
  primary key(reg_num)
);
create table person(
driver_id varchar(20),
    name varchar(20),
    address varchar(30),
    primary key(driver_id)
);
create table accident2(
report_num int,
    accident_date date,
    location varchar(30),
    primary key(report_num)
);

create table owns(
driver_id varchar(20),
    reg_num varchar(20),
    primary key(driver_id,reg_num),
    foreign key(driver_id) references person(driver_id),
    foreign key(reg_num) references car(reg_num)
    );
create table participated(
driver_id varchar(20),
    reg_num varchar(20),
    report_num int,
    damage_amount int,
    primary key(driver_id,reg_num,report_num),
    foreign key(driver_id) references person(driver_id),
    foreign key(reg_num) references car(reg_num),
    foreign key(report_num) references accident2(report_num)
);
insert into accident2(report_num,accident_date,location) values (11, '2003-01-01','Mysore raod');
insert into accident2(report_num,accident_date,location) values (12, '2004-01-01','south end circle');
insert into accident2(report_num,accident_date,location) values (13, '2003-01-01','bull temple');
insert into accident2(report_num,accident_date,location) values (14, '2008-01-01','Mysore raod');
insert into accident2(report_num,accident_date,location) values (15, '2004-01-01','kanakpura road');

insert into car(reg_num,model,year) values ('B01','MODEL1',2000);
insert into car(reg_num,model,year) values ('B02','MODEL2',2001);
insert into car(reg_num,model,year) values ('B03','MODEL3',2002);
insert into car(reg_num,model,year) values ('B04','MODEL4',2003);
insert into car(reg_num,model,year) values ('B05','MODEL5',2004);

insert into person(driver_id,name,address) values ('KA01','navneet1','basvangudi');
insert into person(driver_id,name,address) values ('KA02','navneet2','hanumanthanagar');
insert into person(driver_id,name,address) values ('KA03','navneet3','nr colony');
insert into person(driver_id,name,address) values ('KA04','navneet4','ashok nagar');
insert into person(driver_id,name,address) values ('KA05','navneet5','thaygraj nagar');

insert into owns(driver_id,reg_num) values ('KA01','B01');
insert into owns(driver_id,reg_num) values ('KA02','B02');
insert into owns(driver_id,reg_num) values ('KA03','B03');
insert into owns(driver_id,reg_num) values ('KA04','B04');
insert into owns(driver_id,reg_num) values ('KA05','B05');


insert into participated(driver_id,reg_num,report_num,damage_amount) values ('KA01','B01',11,2000);
insert into participated(driver_id,reg_num,report_num,damage_amount) values ('KA02','B02',12,2800);
insert into participated(driver_id,reg_num,report_num,damage_amount) values ('KA03','B03',13,2900);
insert into participated(driver_id,reg_num,report_num,damage_amount) values ('KA04','B04',14,3000);
insert into participated(driver_id,reg_num,report_num,damage_amount) values ('KA05','B05',15,1000);

SELECT *
FROM car;
SELECT *
from person;
SELECT *
FROM owns;
select *
from participated;

update participated set damage_amount = 2500
where reg_num = 'B02' and report_num = 12;

select * from participated;

select * FROM participated order by damage_amount DESC;

select avg(damage_amount) from participated;

DELETE FROM participated where damage_amount < (select avg(damage_amount) from participated);

select * from participated;

select a.name from person as a,participated as b
where a.driver_id = b.driver_id and
b.damage_amount > (select avg(damage_amount) from participated);

select max(damage_amount) from participated;
