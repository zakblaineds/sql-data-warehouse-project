/*
--------------------------
Create Database & Schemas
--------------------------
Script Purpose:
		This script creates a new database called 'DataWarehouse' if it already exists.
		If the database exists, it is dropped and recreated. Addtionally, the script set up 3 schemas
		within the database: 'bronze', 'silver', 'gold'.

WARNING:
		Running this script will drop the entire 'DataWarehouse' database if it exists.
		All data in the database will be permanetly deleted. Proceed with caution and 
		ensure you have proper backups before running the script.
*/

USE master;
GO

-- Drop and recreate the 'Datawarehouse' database
IF EXISTS(SELECT * FROM sys.databases WHERE name = 'Datawarehouse')
BEGIN
	ALTER DATABASE DataWarehous SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
	END; 
	GO

--Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;

USE DataWarehouse;

--Create Schemas

CREATE SCHEMA bronze;

GO

CREATE SCHEMA silver;

GO

CREATE SCHEMA gold;
GO
