use WFA3DotNet

--Creating Product Table

create table Product(
	ProductId int not null primary key identity (1,1),
	Discription varchar(30) not null unique,
	SetQty int not null 
	check (SetQty=1 or SetQty=5 or SetQty=10) 
	default 1,
	Rate decimal(10,2)
	check (Rate >=51 and Rate <=5000)
)

exec sp_columns Product

--Insert 20 Records in the above table

insert into Product values('Sennheiser',10,4999.99)
insert into Product values('Boat',5,1000.40)
insert into Product values('JBL',5,4500.00)
insert into Product values('Skullcandy',1,799.00)
insert into Product values('Sony',10,3490.00)
insert into Product values('Bose',5,1450.00)
insert into Product values('AKG',10,1300.00)
insert into Product values('Beats',10,4500.00)
insert into Product values('Audio-Technica',1,3500.00)
insert into Product values('Marshall',1,2000.00)
insert into Product values('Samsung',5,500.00)
insert into Product values('Xiaomi',10,499.00)
insert into Product values('Jabra',10,1200.00)
insert into Product values('Bang & Olufsen',1,3000.00)
insert into Product values('Philips',5,2000.00)
insert into Product values('Shure',1,500.00)
insert into Product values('Realme',5,1499.99)
insert into Product values('HyperX',1,1990.45)
insert into Product values('Boult',10,499.00)
insert into Product values('Oremo',1,100.00)

select * from Product

--3.Update all rates with 10% hike

update Product set Rate=Rate*1.1 where Rate<4000

select * from Product

--4. Delete last record by using Product ID

delete from Product where ProductId=20

--5. Alter the table and add a column

alter table Product add MarginCode char(1)
check (MarginCode='A' or MarginCode='B' or MarginCode=null)

--6. Set MarginCode to A or B

update Product set MarginCode='A' where Rate>=2500

update Product set MarginCode='B' where Rate<2500

--7.	Update all the SetQty to 10 for all Items which have MarginCode A and whose original SetQty is 1.

update Product set SetQty = 10 where MarginCode='A' and SetQty=1

--2 rows affected

select * from Product