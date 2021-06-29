create table Salespeople(SNUM int PRIMARY KEY,
SNAME varchar(100) NOT NULL,CITY varchar(50),COMM int
);

insert into Salespeople VALUES(1001,"Peel","London",12);

insert into Salespeople VALUES(1002,"Serres","SanJose",13);

insert into Salespeople VALUES(1004,"Motika","London",11);

insert into Salespeople VALUES(1007,"Rifkin","Barcelona",15);

insert into Salespeople VALUES(1003,"AxelRod","New York",10);

insert into Salespeople VALUES(1008,"Fran","London",25);




create table Customers(CNUM int PRIMARY KEY,CNAME varchar(50) NOT NULL,CITY varchar(50),
RATING int,SNUM int, FOREIGN KEY(SNUM) REFERENCES Salespeople(SNUM)
);

insert into Customers VALUES(2001,"Hoffman","London",100,1001);



insert into Customers VALUES(2002,"Giovami","Rome",200,1003);

insert into Customers VALUES(2003,"Liu","SanJose",200,1002);

insert into Customers VALUES(2004,"Grass","Berlin",300,1002);

insert into Customers VALUES(2006,"Ciemens","London",100,1001);

insert into Customers VALUES(2008,"Cisneros","SanJose",300,1007);

insert into Customers VALUES(2007,"Pereira","Rome",100,1004);



create table Orders(ONUM int PRIMARY KEY,AMT float,ODATE DATE,CNUM int,SNUM int, 
FOREIGN KEY(CNUM) REFERENCES Customers(CNUM), FOREIGN KEY(SNUM) REFERENCES Salespeople(SNUM)
);


insert into Orders VALUES(3001,18.69,'90-03-10',2008,1007);

insert into Orders VALUES(3003,767.19,'90-03-10',2001,1001);

insert into Orders VALUES(3002,1900.10,'90-03-10',2007,1004);


insert into Orders VALUES(3005,5160.45,'90-03-10',2003,1002);

insert into Orders VALUES(3006,1098.16,'90-03-10',2008,1007);

insert into Orders VALUES(3009,1713.23,'90-04-10',2002,1003);

insert into Orders VALUES(3007,75.75,'90-04-10',2004,1002);

insert into Orders VALUES(3008,4723.00,'90-05-10',2006,1001);


insert into Orders VALUES(3010,1309.95,'90-06-10',2004,1002);

insert into Orders VALUES(3011,9891.88,'90-06-10',2006,1001);












