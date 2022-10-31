-- Explore dataset--
SELECT *
from HR_Employee_Attrition_csv heac 

-- Number of gender in the company --
SELECT count(Gender),Gender  from HR_Employee_Attrition_csv heac group by Gender 

--Degrees of employees --
 Select DISTINCT (EducationField) from HR_Employee_Attrition_csv heac 
 
--Maximum of monthly income--
select max(monthlyIncome)from HR_Employee_Attrition_csv heac 

-- In order to investigate the distribution of the attrition variable, we have 1233 that is No and 237 that is Yes,here the number of Employees who left compared to those who stayed----
SELECT Attrition , count(Attrition)
FROM HR_Employee_Attrition_csv heac 
group by Attrition 

--How does job role impact the Attrition?
--‘sales executive’, ‘sales representative’, and ‘lab technician’ are more likely to leave compared to other roles.--
Select count(*), JobRole,Attrition  from HR_Employee_Attrition_csv heac 
group by JobRole

-- Here we can conclude that employees age between 30-40 are working in IBM--
select count (age),age from HR_Employee_Attrition_csv heac group by age 

--note : Managers earn the highest average monthly income--
select JobRole,MonthlyIncome from HR_Employee_Attrition_csv heac group by JobRole

--note :here Compared to employees with more years of experience, employees with fewer years of experience received lower salariesy--
select TotalWorkingYears,MonthlyIncome   from HR_Employee_Attrition_csv heac
group by TotalWorkingYears 


--The percentage of female attrition versus the percentage of males attrition--
Select Gender  , count(Attrition) * 100.0 / sum(count(*)) over() as '%Attrition' 
from HR_Employee_Attrition_csv heac 
where Attrition ='Yes'
group by Gender

--How does overtime impact the Attrition?--
--note : The employees who don't have overtime are most likely to leave the company--
select  count(OverTime),Attrition , count(*) * 100.0 / (select count(*)  from HR_Employee_Attrition_csv heac2)
from HR_Employee_Attrition_csv heac 
group by OverTime ;

-- what is the distribution of Performance Rating? --
Select PerformanceRating ,count(Attrition ),Attrition  from HR_Employee_Attrition_csv heac group by PerformanceRating

----How does Environment Satisfaction impact the Attrition?
--note : The Environment Satisfaction does not affect attrition in this case --
SELECT EnvironmentSatisfaction ,count(Attrition ), Attrition 
FROM HR_Employee_Attrition_csv heac 
GROUP BY EnvironmentSatisfaction

--Does Work Life Balance affect attrition ?--
SELECT  WorkLifeBalance  ,Attrition, count(Attrition)
FROM HR_Employee_Attrition_csv heac 
where Attrition ='Yes'
group by WorkLifeBalance 

-- Does MaritalStatus affect attrition ?
--note : Single status employees are more likely to leave the company --
SELECT  count (Attrition),MaritalStatus,Attrition  from HR_Employee_Attrition_csv heac  group by MaritalStatus  


--Monthly income is highly correlated with Job level.--
select MonthlyRate ,JobLevel  
from HR_Employee_Attrition_csv heac 

--TotalWorkingYears is highly correlated with Job level.
SELECT  TotalWorkingYears  ,JobLevel 
FROM HR_Employee_Attrition_csv heac 
group by TotalWorkingYears  
--

--EducationField--
select EducationField, Attrition, count(Attrition ) as coynatt from HR_Employee_Attrition_csv heac  
where Attrition ='Yes'
group by EducationField 


--which department have more employee attrition?
--note: Sales department has the highest attrition rates (30%), Research and Development (65%),followed by the Human Resourceh has the least attrition rates
select Department ,Attrition  ,count(*) * 100.0 / sum(count(*)) over() 
from HR_Employee_Attrition_csv heac 
group by Department 

--Does company stocks for employees impact attrition?
select StockOptionLevel,Attrition  from HR_Employee_Attrition_csv heac  group by StockOptionLevel 

-------------------------------------------

















