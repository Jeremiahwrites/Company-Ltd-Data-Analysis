#Question 1:How many staff do we have in the company?

USE company_ltd;
SELECT count(*) as N0_of_Staff
FROM stafftable;

#Question 2:How many staff are younger than 30 years?
SELECT* 
FROM stafftable
WHERE Age < 30;

#Question 3: How many staff are between 30 and 25 years?
SELECT count(*) 
FROM stafftable
WHERE Age <=30;

#Question 4:Select all the female staff and sort their age in descending order (from the oldest to the youngest)
SELECT* 
FROM stafftable
WHERE StaffSex = "Female"
ORDER BY Age desc;

#Question 5:What is the Average age of Peter and Nina?
SELECT avg(Age)
FROM Stafftable
WHERE StaffName in ("Peter", "Nina");

#Question 6: How many customers do we have?
SELECT distinct count(CustomerCode) as No_of_Customers
FROM customertable;

#Question 7:How many customers are from Cameroon?
SELECT count(*) as Country_is_Cameroon
FROM customertable
WHERE CustomerCountry = "Cameroon";

#Question 8:How many customers are from Cameroon and are Males?
SELECT count(*) as Country_is_Cameroon
FROM customertable
WHERE CustomerCountry = "Cameroon" and CustomerSex = "Male";

#Question 9:What are the First names and Last names of customers who come from Togo and USA?
SELECT 
	CustomerFirstName,
    CustomerLastName,
    CustomerCountry
FROM customertable
WHERE CustomerCountry in ("Togo", "USA")
	order by CustomerCountry;
    
#Question 10:Show the first 5 oldest customers and arrange the list in decreasing order of Age (Oldest to youngest)
SELECT*
FROM customertable
order by Age desc
limit 5;

#Question 11: What is the average age of customers per country?
SELECT 
	CustomerCountry,
    avg(Age) as Avg_age
FROM customertable
GROUP BY CustomerCountry;

#Question 12:What is the total profit we made?
SELECT sum(Profit) AS Total_Profit
FROM salestable;

#Question 13:What is the total cost we incurred for these 03 countries "Cameroon","USA","Togo"
SELECT
	CustomerCountry,
    SUM(Cost) as Cost_Incured
	FROM
	customertable
JOIN salestable on salestable.CustomerCode=customertable.CustomerCode
WHERE CustomerCountry in ("Cameroon","USA","Togo")
group by 1
order by 1;

#Question 14:What is the total profit we made per country?
SELECT 
    CustomerCountry,
    sum(Profit) as Total_Profit
    FROM
	customertable
JOIN salestable on salestable.CustomerCode=customertable.CustomerCode
group by 1
order by 1;

#Question 15:What is the total revenue per Staff?
SELECT
	StaffName,
    sum(Revenue) AS Total_Revenue
FROM
	stafftable
JOIN
	salestable ON salestable.StaffCode=stafftable.MatriculeNo
GROUP BY 1
ORDER BY 1;
    
#Question 16:Which countries made more than 1000 sales transactions? Sort them in decreasing order (from biggest to smallest)
SELECT 
    CustomerCountry,
    SUM(UnitsSold) AS Units_Sold
FROM
	customertable
JOIN salestable on salestable.CustomerCode=customertable.CustomerCode
WHERE UnitsSold > 1000
GROUP BY 1
ORDER BY 2 DESC;

#Question 17:What is the total profit made per country by the following staff "Emelda","Anita","Cynthia"?
SELECT
	StaffName,
    CustomerCountry,
    sum(Profit) AS Total_Profit
FROM
	salestable
JOIN
	stafftable on stafftable.MatriculeNo=salestable.StaffCode
JOIN customertable on customertable.CustomerCode=salestable.CustomerCode
WHERE StaffName in ("Emelda","Anita","Cynthia")
GROUP BY
	StaffName,
    CustomerCountry;

    




