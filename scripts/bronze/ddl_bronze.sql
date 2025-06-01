/*
============================================================================================
DDL Script: Bronze Tables
============================================================================================
Script Purpose:
	This script creates tables in the 'bronze' schema, dropping existing tables
	if they already exist.
	Run this script to re-define the DDL structure of 'bronze' Tables
============================================================================================
*/

USE DataWarehouse

-- Create bronze layer crm customer info table

IF OBJECT_ID('bronze_crm_cust_info', 'U') IS NOT NULL
	DROP TABLE bronze_crm_cust_info;

CREATE TABLE bronze_crm_cust_info(
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);

GO

-- Create bronze layer crm product info table

IF OBJECT_ID('bronze_crm_prd_info') IS NOT NULL
	DROP TABLE bronze_crm_prd_info;

CREATE TABLE bronze_crm_prd_info(
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(5),
	prd_start_dt DATE,
	prd_end_dt DATE
);

GO

-- Create bronze layer crm sales detail table

IF OBJECT_ID('bronze_crm_sales_details') IS NOT NULL
	DROP TABLE bronze_crm_sales_details;

CREATE TABLE bronze_crm_sales_details(
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_cust_id INT,
sls_order_dt NVARCHAR(50),
sls_ship_dt DATE,
sls_due_dt DATE,
sls_sales INT,
sls_quantity INT,
sls_price INT
);

GO

-- create bronze layer erp PX_CAT_G1V2 table

IF OBJECT_ID('bronze_erp_px_cat_g1v2') IS NOT NULL
	DROP TABLE bronze_erp_px_cat_g1v2;

CREATE TABLE bronze_erp_px_cat_g1v2(
id NVARCHAR(20),
cat NVARCHAR(50),
subcat NVARCHAR(50),
maintenance NVARCHAR(10)
);

GO

-- create bronze layer erp loc_a101 table

IF OBJECT_ID('bronze_erp_loc_a101') IS NOT NULL
	DROP TABLE bronze_erp_loc_a101;

CREATE TABLE bronze_erp_loc_a101(
cid NVARCHAR(20),
cntry NVARCHAR(50)
);

GO

-- create bronze layer erp cust_az12 table

IF OBJECT_ID('bronze_erp_cust_az12') IS NOT NULL
	DROP TABLE bronze_erp_cust_az12 ;

CREATE TABLE bronze_erp_cust_az12(
cid NVARCHAR(20),
bdate DATE,
gen NVARCHAR(10)
);
