CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '============================================';
		PRINT 'Loading Bronze Layer';
		PRINT '============================================';

		PRINT '--------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze_crm_cust_info'
		TRUNCATE TABLE bronze_crm_cust_info;

		PRINT '>> Inserting Data Into Table: bronze.crm_cust_info'
		BULK INSERT bronze_crm_cust_info
		FROM 'C:\Users\zacha\Documents\Data Warehouse Project\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> --------------';
		
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze_crm_prd_info'
		TRUNCATE TABLE bronze_crm_prd_info;

		PRINT '>> Inserting Data Into Table: bronze_crm_prd_info'
		BULK INSERT bronze_crm_prd_info
		FROM 'C:\Users\zacha\Documents\Data Warehouse Project\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> --------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze_crm_sales_details'
		TRUNCATE TABLE bronze_crm_sales_details;

		PRINT '>> Inserting Data Into Table: bronze_crm_sales_details'
		BULK INSERT bronze_crm_sales_details
		FROM 'C:\Users\zacha\Documents\Data Warehouse Project\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration; ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> --------------';


		PRINT '--------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '--------------------------------------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze_erp_cust_az12'
		TRUNCATE TABLE bronze_erp_cust_az12;

		PRINT '>> Inserting Data Into Table: bronze_erp_cust_az12'
		BULK INSERT bronze_erp_cust_az12
		FROM 'C:\Users\zacha\Documents\Data Warehouse Project\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration; ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> --------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze_erp_loc_a101'
		TRUNCATE TABLE bronze_erp_loc_a101;

		PRINT '>> Inserting Data Into Table: bronze_erp_loc_a101'
		BULK INSERT bronze_erp_loc_a101
		FROM 'C:\Users\zacha\Documents\Data Warehouse Project\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration; ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> --------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze_erp_px_cat_g1v2'
		TRUNCATE TABLE bronze_erp_px_cat_g1v2;

		PRINT '>> Inserting Data Into Table: bronze_erp_px_cat_g1v2'
		BULK INSERT bronze_erp_px_cat_g1v2
		FROM 'C:\Users\zacha\Documents\Data Warehouse Project\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration; ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> --------------';
		
		SET @batch_end_time = GETDATE();
		PRINT '==========================================';
		PRINT 'Loading Bronze Layer Complete';
		PRINT ' - Total Load Duration; ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '==========================================';
	END TRY
	BEGIN CATCH
		PRINT '==========================================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '==========================================';
	END CATCH
END;
