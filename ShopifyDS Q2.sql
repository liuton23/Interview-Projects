
-- https://www.w3schools.com/SQL/TRYSQL.ASP?FILENAME=TRYSQL_SELECT_ALL

-- 2a)

-- query
SELECT count(*) as total_order_num_speedy
from Shippers join Orders
where ShipperName = 'Speedy Express'; 

-- Answer: 196


-- 2b)

-- query
select LastName
from employees natural join (select Orders.EmployeeID as EmployeeID, count(orderid) as num_order 
                             from Orders natural join Employees
                             group by EmployeeID
                             order by num_order desc
                             limit 1) sub; 

-- Answer: Margaret
			
			
-- 2c)
-- query
select * 
from products natural join (select ProductID, sum(Quantity) as total_sold
                            from Orders natural join customers natural join OrderDetails
                            where Country = 'Germany'
                            group by ProductID
                            order by total_sold desc
                            limit 1) sub; 

-- Answer: ProductID 40 Boston Crab Meat