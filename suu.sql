/*1 List all the columns of the Salespeople table*/
 
select* from salespeople;

/*2List all customers with a rating of 100
  this query return all the customers whose rating is 100*/

select *from Customers where RATING=100;


/*3 Find the largest order taken by each salesperson on each date
    in this query i have used join operation for retrive largest Order*/

select MAX(AMT) from Orders join Salespeople where Orders.SNUM=Salespeople.SNUM;

select MAX(AMT) fro Orders where 

/*4 Arrange the Order table by descending customer number.
  in this query i have used order by for arrange the customer number in descending order*/
  

select *from Orders order by CNUM DESC;

/* 5 Find which salespeople currently have orders in the order table*/
   
select DISTINCT(SNAME) from Salespeople LEFT JOIN Orders ON Salespeople.SNUM=Orders.SNUM;

/*6 List names of all customers matched with the salespeople serving them */
  
Select CNAME from Customers LEFT JOIN Salespeople ON Customers.SNUM=Salespeople.SNUM;

/*7) Find the names and numbers of all salespeople who have more than one customer.
select count(*) AS COUNT ,c.SNUM,s.SNAME from customer c,salespeople s WHERE c.SNUM=s.SNUM GROUP BY c.SNUM ;


 /*8Count the orders of each of the salespeople and output the results in descending order.*/

select count(O.SNUM) from Orders O LEFT JOIN Salespeople S ON O.SNUM =S.SNUM GROUP BY O.snum order by count(O.snum) DESC;





/*9List the customer table if and only if one or more of the customers in the Customer table are located in SanJose.
  in this query return customers table whose belong in  Sanjose*/
select * from Customers where CITY="Sanjose";

/*10 Match salespeople to customers according to what city they live in.
   this query i have applied JOIN for matching salespeople to customers according to there SNUM and CITY they live in*/

Select * from Salespeople INNER JOIN Customers where Salespeople.SNUM=Customers.SNUM AND Salespeople.CITY=Customers.CITY;

/*11 ) Find all the customers in SanJose who have a rating above 200.
 this query return only those customers who have rating more than 200 */

Select * from Customers where CITY=Sanjose AND RATING>200;

/*12  List the names and commissions of all salespeople in London.
  this query return whose salespeople name and there commision those belongs in London*/

select SNAME,COMM from Salespeople where CITY="london";

/* 13 List all the orders of Salesperson Motika from the orders table
   in this i have applied join operation for retrive Orders from Orders table and there salespeople name is motika*/

Select ONUM from Salespeople INNER JOIN Orders where Salespeople.SNUM=Orders.SNUM AND salespeople.SNAME="Motika";

/*14 Find all customers who booked orders on October 3.
  this query return all the customers whose book order on October 3 */

Select CNAME from Orders JOIN Customers where Orders.CNUM=Customers.CNUM AND ODATE='1990-03-10';


/*15 Give the sums of the amounts from the Orders table, grouped by date, eliminating all those dates where the SUM was not at least 2000 above
    the maximum Amount.




/*16 ) Select all orders that had amounts that were greater than at least one of the orders from October 6
  in this query i have applied subquery concept so in question asked select all the orders that amount were grater than at least on of the orders from october 6 so
   i take min amt as a base condition for output*/

select * from Orders where Orders AMT>(select MIN(AMT)from Orders where ODATE='1990-06-10);

/* 17) Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300
   in this i have used subquery and EXISTS operator to extract all salespeople who have customers and customers rating is 300*/
  
select SNAME From Salespeople WHERE EXISTS(Select SNUM from Customers where salespeople.SNUM=Customers.SNUM AND RATING=300);

/* 18)Find all customers whose cnum is 1000 above the snum of Serres.
  in this query return subquery in which internal query return SNUM from salespeople table where Salespeople name is serres
  and external query return CNAME from Customers whose CNUM 1000 greater than SNUM*/
 
select CNAME from Customers where CNUM>=1000+(select SNUM from Salespeople where SNAME="Serres");

/*19 Give the salespeople’s commissions as percentages instead of decimal numbers.*/



/*20  Find the largest order taken by each salesperson on each date, eliminating those Maximum orders, which are less than 3000
   in this i have used JOIN then mathch the SNUM from both the table and apply condtion for eliminating those orders which are less than 3000*/

 
select * from Orders JOIN Salespeople where Orders.SNUM=Salespeople.SNUM AND AMT>3000;

/*21  Find the largest order taken by each salesperson on each date, eliminating those Maximum orders, which are less than 3000*/


/*22 Find all customers located in cities where Serres has customers.
   this query return Customers CITY from customers where salespeople SNUM and customers SNUM are matched and salespeople name is Serres*/

select Customers.CITY from Salesepeople,Customers where Salespeople.SNUM=Customers.SNUM AND Salespeople.SNAME="Serres";

/*23 Select all customers with a rating above 200.
  this query return all the customers whose rating greater than 200*/

Select* from Customers where RATING>200;

/*24 Count the number of salespeople currently having orders in the orders table*/
 
select count(Salespeople.SNUM) where Salespeople INNER JOIN Orders where Salespeople.SNUM=Orders.SNUM;

/*25 Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name,
salesperson’s name and the salesperson’s rate of commission*/

select SNAME,CNAME,COMM from  salespeople JOIN customers ON Salespeople.snum=Customers.SNUM COMM>12;

/*26 ) Find salespeople who have multiple customers.





/*27 Find salespeople with customers located in their own cities.
   in this i have applied join then query return those CNAME ,SNAME who have belong in same city*/

select CNAME,SNAME from Salespeople INNER JOIN Orders where Salespeople.CITY=Orders.CITY;

/*28 Find all salespeople whose name starts with ‘P’ and fourth character is ‘I’.
   this query return salesspeople name there first character is'P' and fourth character is 'I'*/


select SNAME from Salespeople where SNAME like'P__l%';


/*29 Write a query that uses a subquery to obtain all orders for the customer named ‘Cisneros’. Assume you do not know his customer number.*/
   
select* from Orders where SNUM=(select SNUM from Customers where CNAME="Sernose')

//30
select MAX(AMT) from Salespeople s INNER JOIN Customers c where s.snum=c.snum AND s.sname IN ("Serres"."Rifkin");

/*31 
select SNUM,SNAME,COMM,CITY from salespeople;

/*32 select CNAME from customers where CNAME like 'A%G';
/*33select c1.cname,c2.name from Customers c1,Customers c2 where c1.snum=c2.snum AND c1.CITY=c2.CITY;
 
/*34 Select all orders that are greater than the average for October 4.
  here inner query return average amount of orders on date 4 October and
   outer query return ONUM and amount whosw greater than average amount*/

select ONUM,AMT from Orders  where AMT>(select AVG(AMT) from orders where ODATE='1990-04-10');

/*35 Write a select command using correlated subquery that selects the names and numbers of all customers with ratings equal to the maximum
  for their city.
  here inner query return maximum rating and outer query return CNUM and customer name whose rating equal to output of inner query*/  
select CNUM,CNAME from Customers where RATING=(select MAX(RATING) from Customers);

/*37 Write a select command that produces the rating followed by the name of each customer in SanJose.
  this return customer name and its Rating whose live in "Sanjose"*/

select CNAME,RATING From Customers where CITY="Sanjose";

/*38 Find all orders with amounts smaller than any amount for a customer in SanJose.
  here i used subquery inner query return average amount from orders whose customers live in "sanjose" and outer query return 
   all orders which is have less amount of output of inner query*/

select * from Orders where AMT<(select AVG(AMT)from Orders,Customers where Customers.CITY="Sanjose");

/*39 Find all orders with above average amounts for their customers
  here inner query return average amount from customers where customers having orders in order table
 and outer query return all orders whose amount greater than average amount of inner query*/

select* from Orders where AMT>(select AVG(AMT) from Orders,Customers where Customer.CNUM=Orders.CNUM);

/*40
select CNAME,MAX(RATING) from customers group by  CITY;

/*41 select COMM fro customers c INNER JOIN Salespeople s where c.snum=s.sum AND RATING>100;


/*42  Count the customers with ratings above SanJose’s average.
     here inner query return average rating of those customers who lives in "sanjose"
    and outer query return count all the customers whose rating greater than outpute of inner query*/

select count(*) from Customers where RATING>(select AVG(RATING) from Customers where CITY="Sanjose");

/*43Find all salespeople that are located in either Barcelona or London.
   this query return all the salespeople who live in either "Barcelon" or "London"*/
select * from Salespeople where CITY="Barcelona" OR CITY="London";

/*44 select 



/*46 Write a query that will give you all orders for more than $1000.00
  this query return all the order whose amount greater than 1000*73.28*/

select* from Orders where AMT>(1000.00*73.28);

/*47 Write a query that lists each order number followed by the name of the customer who made that order
   here i have used INNER JOIN for retrive Order num and Customer num*/
select Orders.ONUM,Customers.CNUM from Orders INNER JOIN Customers where Orders.CNUM=Customers.CNUM;

/*48Write a query that selects all the customers whose ratings are equal to or greater than ANY(in the SQL sense) of ‘Serres’.
  in this question i have used 2 subquery first subquery return SNUM from salespeople where salespeople name "Serres"
  and second query return minimum rating from customers whose cnum matching from output of first subquery then outer query return 
   all customers where rating greater than equal to output of second subquery.*/

select* from Customers where RATING>=(Select MIN(RATING) from Customers where Customers.CNUM=(Select SNUM from Salespeople where SNAME="Serres"));


/*49Write two queries that will produce all orders taken on October 3 or October 4
   first query return all orders on date october 3
   and second query return all orders on date october 4*/
select* from Orders where ODATE='1990-03-10';
select* from Orders where ODATE='1990-04-10';


/*50 ) Find only those customers whose ratings are higher than every customer in Rome.
    in this i have used subquery inner query return Maximum rating from customers where city is Rome and 
     outer query return customers whose rating is greater than output of inner query*/
select*from Customers where RATING>(Select MAX(RATING) from Customers where CITY="Rome");

/*51 Write a query on the Customers table whose output will exclude all customers with a rating<= 100.00, unless they are located in Rome
    this query return all customers excluding those customers rating is less than 100*/
select * from Customers where RATING>100;

/*52) Find all rows from the customer’s table for which the salesperson number is 1001.
 this query return all the customers where SNUM is 1001*/
select* from Customers where SNUM=1001;

//53

/*54) Write a query that selects all orders save those with zeroes or NULL in the amount file
    return those Orders where amount either 0 or NULL*/
select * from Orders where AMT=0 OR AMT=NULL;

/*56 Find all salespeople name and commission.
   this query return name and commision of salespeople*/
select SNAME,COMM from Salespeople;

/*57 ) Write a query that produces the names and cities of all customers with the same rating as Hoffman. Write the query using Hoffman’s cnum
      rather than his rating, so that it would still be usable if his rating is changed.
      in this i have used 2 subquery first inner query return CNUM from customers where  customer name is "Hoffman"  then second inner query return
      RATING from customers where CNUM equal to result of first inner subquery then outer query return customers name and city whose rating is equal to
      output of second inner subquery*/

select CNAME,CITY from Customers where RATING=(Select RATING FROM Customers where CNUM=(Select CNUM from Customers where CNAME="Hoffman"));


/*59) Write a query that produces the names and ratings of all customers who have average orders.
      in this question i used subquery inner query return average amount from orders table and outer query return
     which Customers name and rating there amount greater than average amount*/
 
select CNAME,RATING from Customers,Orders where AMT>=(select AVG(AMT) from Orders);

/*60 Find the SUM of all Amounts from the orders table.
  this query return sum of all amt from orders table*/
select SUM(AMT) from Orders;








