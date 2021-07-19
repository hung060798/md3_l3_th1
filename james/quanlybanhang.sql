create database quanlybanhang;

create table CUstomer(
cID int primary key,
Name varchar(25),
cAge tinyint
);

create table Oder(
oID int primary key,
cID int,
foreign key (cID) references Customer(cID),
oDate Datetime,
oTutalPrice int
);

create table Product(
pID int primary key,
pName varchar(255),
oPrice int
);

create table OderDetail(
oID int,
foreign key (oID) references Oder(OID),

);

use quanlybanhang;

