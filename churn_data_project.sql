create database churn_project;
use churn_project;
show tables;
select * from customer_data;

#Data Exploration 

select Gender,count(Gender) as totalcount,
count(Gender)/(select count(*) from customer_data)*100 as percentage
from customer_data
group by Gender;

SELECT Contract, Count(Contract) as TotalCount,
Count(Contract)/ (Select Count(*) from customer_data) *100  as Percentage
from customer_data
Group by Contract;

SELECT State, Count(State) as TotalCount,
Count(State) / (Select Count(*) from customer_data)*100  as Percentage
from customer_data
Group by State
Order by Percentage desc;


#Create View for Power BI

Create View vw_ChurnData as
	select * from customer_data where Customer_Status In ('Churned', 'Stayed');

Create View vw_JoinData as
	select * from customer_data where Customer_Status = 'Joined';

select * from vw_JoinData ;
select * from vw_ChurnData;





