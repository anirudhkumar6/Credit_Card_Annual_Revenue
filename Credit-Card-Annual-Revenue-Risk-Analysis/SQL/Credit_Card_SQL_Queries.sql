
-- Create a database
CREATE DATABASE Credit_Card_Data;


--Createing a table 

CREATE TABLE dbo.Credit_Card_detail (
    Client_Num VARCHAR(50),
    Client_Category VARCHAR(50),
    Annual_Fees VARCHAR(50),
    Activation_30_Days VARCHAR(50),
    Customer_Acq_Cost VARCHAR(50),
    Customer_Acq_Date VARCHAR(50),
    Week_Start_Date VARCHAR(50),
    Qtr VARCHAR(50),
    Current_Year VARCHAR(50),
    Credit_Limit VARCHAR(50),
    Total_Revolving_Bal VARCHAR(50),
    Total_Trans_Amt VARCHAR(50),
    Total_Trans_Ct VARCHAR(50),
    Avg_Utilization_Ratio VARCHAR(50),
    Use_Chip VARCHAR(50),
    Exp_Type VARCHAR(50),
    Inter_Reward VARCHAR(50),
    Delinquent_Acc VARCHAR(50)
);



-- Adding the Data in to the table 
BULK INSERT dbo.Credit_Card_detail -- Table name where we will insert the data
FROM 'C:\Users\pc\OneDrive\Desktop\Projects\Power_BI\Credit Card Financial Dashboard-20260116T111654Z-1-001\New folder\cridet_card.csv' -- location of the csv file

WITH (
    FIRSTROW = 2, -- It will Extract Data from 2 Row
    FIELDTERMINATOR = ',', -- The file is Cvs (",")
    ROWTERMINATOR = '\n', -- Break the row when it needs 
    TABLOCK
); -- Note: Don't run the Above code more than 1 time with same location. It will "Creat Duplicate" of the same table.


-- For viewing the Table
SELECT * FROM  dbo.Credit_Card_detail


-- Converting string to INT to perform Calculation. The source data is stored as VARCHAR in the legacy system.
INSERT INTO dbo.Credit_Card_detail (
    Client_Num, Client_Category, Annual_Fees, Activation_30_Days,
    Customer_Acq_Cost, Customer_Acq_Date, Week_Start_Date, Qtr,
    Current_Year, Credit_Limit, Total_Revolving_Bal, Total_Trans_Amt,
    Total_Trans_Ct, Avg_Utilization_Ratio, Use_Chip, Exp_Type,
    Inter_Reward, Delinquent_Acc
)
SELECT
    TRY_CAST(Client_Num AS INT),
    Client_Category,
    TRY_CAST(Annual_Fees AS INT),
    TRY_CAST(Activation_30_Days AS INT),
    TRY_CAST(Customer_Acq_Cost AS INT),
    TRY_CAST(Customer_Acq_Date AS DATE),
    TRY_CAST(Week_Start_Date AS DATE),  
    Qtr,
    TRY_CAST(Current_Year AS INT),
    TRY_CAST(Credit_Limit AS DECIMAL(10,2)),
    TRY_CAST(Total_Revolving_Bal AS INT),
    TRY_CAST(Total_Trans_Amt AS INT),
    TRY_CAST(Total_Trans_Ct AS INT),
    TRY_CAST(Avg_Utilization_Ratio AS DECIMAL(10,3)),
    Use_Chip,
    Exp_Type,
    TRY_CAST(Inter_Reward AS DECIMAL(10,2)),
    Delinquent_Acc
FROM dbo.Credit_Card_detail;


SELECT * FROM Credit_Card_detail;


-- Table info as per data type
SELECT 
COLUMN_NAME,
DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Credit_Card_detail';


SELECT COUNT(*) as Total_Rows FROM Credit_Card_detail-- For counting Numbers of Rows 


-- Analysing the null values as per column wise

DECLARE @sql NVARCHAR(MAX) = N''; 

SELECT @sql = STRING_AGG(
    'SUM(CASE WHEN ' + QUOTENAME(c.name) + ' IS NULL THEN 1 ELSE 0 END) AS Null_' + c.name, ', '
)
FROM sys.columns c
WHERE c.object_id = OBJECT_ID('dbo.Credit_Card_detail');

SET @sql = 'SELECT ' + @sql + ' FROM Credit_Card_detail;';

EXEC sp_executesql @sql;




-- Arbitrary order as all columns define the duplicate
WITH DuplicateCTE AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY 
    Client_Num, Client_Category, Annual_Fees, Activation_30_Days,
    Customer_Acq_Cost, Customer_Acq_Date, Week_Start_Date, Qtr,
    Current_Year, Credit_Limit, Total_Revolving_Bal, Total_Trans_Amt,
    Total_Trans_Ct, Avg_Utilization_Ratio, Use_Chip, Exp_Type,
    Inter_Reward, Delinquent_Acc
            ORDER BY 
                (SELECT NULL) 
        ) AS RowNumber
    FROM 
        dbo.Credit_Card_detail
)
DELETE FROM DuplicateCTE
WHERE RowNumber > 1;







-- creating a Table as customer_detail

CREATE TABLE customer_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
    );



 -- Adding the Data in to the table 
BULK INSERT dbo.customer_detail
FROM 'C:\Users\pc\OneDrive\Desktop\Projects\Power_BI\Credit Card Financial Dashboard-20260116T111654Z-1-001\New folder\customer.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
); -- Note: Don't run the Above code more than 1 time with same location. It will "Creat Duplicate" of the same table.



select * from dbo.customer_detail



-- Analysing the null values as per column wise
DECLARE @sql NVARCHAR(MAX) = N'';

SELECT @sql = STRING_AGG(
    'SUM(CASE WHEN ' + QUOTENAME(c.name) + ' IS NULL THEN 1 ELSE 0 END) AS Null_' + c.name, ','
)
FROM sys.columns c
WHERE c.object_id = OBJECT_ID('dbo.customer_detail');

SET @sql = 'SELECT ' + @sql + ' FROM customer_detail;';

EXEC sp_executesql @sql;


select Count(*) from dbo.customer_detail



-- Table info as per data type
SELECT 
COLUMN_NAME,
DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customer_detail';



-- Analysing the null values as per column wise
WITH DuplicateCTE AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY 
    Client_Num ,
    Customer_Age ,
    Gender ,
    Dependent_Count,
    Education_Level ,
    Marital_Status ,
    State_cd ,
    Zipcode ,
    Car_Owner ,
    House_Owner ,
    Personal_Loan,
    Contact ,
    Customer_Job ,
    Income,
    Cust_Satisfaction_Score
            ORDER BY 
                (SELECT NULL)
        ) AS RowNumber
    FROM 
       customer_detail
)
DELETE FROM DuplicateCTE
WHERE RowNumber > 1;





-- Updating the both Table 

-- Adding the Data in to the table 
BULK INSERT dbo.Credit_Card_detail -- Table name where we will insert the data
FROM 'C:\Users\pc\OneDrive\Desktop\Projects\Power_BI\Credit Card Financial Dashboard-20260116T111654Z-1-001\New folder\cc_add.csv' -- location of the csv file

WITH (
    FIRSTROW = 2, -- It will Extract Data from 2 Row
    FIELDTERMINATOR = ',', -- The file is Cvs (",")
    ROWTERMINATOR = '\n', -- Break the row when it needs 
    TABLOCK
); -- Note: Don't run the Above code more than 1 time with same location. It will "Creat Duplicate" of the same table.





-- Adding the Data in to the table 
BULK INSERT dbo.Credit_Card_detail -- Table name where we will insert the data
FROM 'C:\Users\pc\OneDrive\Desktop\Projects\Power_BI\Credit Card Financial Dashboard-20260116T111654Z-1-001\New folder\cust_add.csv' -- location of the csv file

WITH (
    FIRSTROW = 2, -- It will Extract Data from 2 Row
    FIELDTERMINATOR = ',', -- The file is Cvs (",")
    ROWTERMINATOR = '\n', -- Break the row when it needs 
    TABLOCK
); -- Note: Don't run the Above code more than 1 time with same location. It will "Creat Duplicate" of the same table.








