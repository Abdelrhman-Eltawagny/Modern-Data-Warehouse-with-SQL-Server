-- **crm_cust_info**
-- Check for Nulls or Duplicates in Primary Key
SELECT cst_id, COUNT(*) AS Duplicates_or_Nulls
FROM bronze.crm_cust_info
GROUP BY cst_id 
HAVING COUNT(*) > 1

-- Check for unwanted spaces in two columns (cst_firstname , cst_lastname)
SELECT cst_firstname
FROM bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT cst_lastname
FROM bronze.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)


-- **crm_prd_info**
-- Check for Nulls or Duplicates in Primary Key
SELECT prd_id, COUNT(*)
FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

-- Check for unwanted spaces
SELECT prd_nm
FROM bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Check for Nulls or Negative Numbers
SELECT prd_cost
FROM bronze.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

-- Data Standarization and Consistency
SELECT DISTINCT prd_line
FROM bronze.crm_prd_info

-- Check for Invalid Date Orders
SELECT * 
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt

-- Check for Invalid Date
SELECT NULLIF(sls_order_dt,0) sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <= 0 OR LEN(sls_order_dt) != 8 OR sls_order_dt > 20500101 OR sls_order_dt > 19000101

SELECT NULLIF(sls_ship_dt,0) sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_ship_dt <= 0 OR LEN(sls_ship_dt) != 8 OR sls_ship_dt > 20500101 OR sls_ship_dt > 19000101

SELECT NULLIF(sls_due_dt,0) sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0 OR LEN(sls_due_dt) != 8 OR sls_due_dt > 20500101 OR sls_due_dt > 19000101

-- Check Data Consistency: Between Sales, Quantity and Price
-- >> Sales = Quantity * Price
-- >> Values must not be Null, Zero, or Negative
SELECT sls_sales, sls_quantity, sls_price
FROM bronze.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price

-- **erp_loc_az12**
-- Check Issues in Primary Key
SELECT cid 
FROM bronze.erp_cust_az12

-- Check out-of-range dates
SELECT DISTINCT bdate
FROM bronze.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()


-- Check Data Standarization and Data Consistency
SELECT DISTINCT gen 
FROM bronze.erp_cust_az12

-- **erp_loc_a101**
-- Check if Primary Key in erp_loc_a101 match with crm_cust_info
SELECT cid 
FROM bronze.erp_loc_a101

-- Check Data Standarization and Consistency
SELECT DISTINCT cntry
FROM bronze.erp_loc_a101

-- **erp_px_cat_g1v2**
-- Check unwanted spaces
SELECT * 
FROM bronze.erp_px_cat_g1v2
WHERE cat != TRIM(cat) OR subcat != TRIM(subcat) OR maintenance != TRIM(maintenance)

-- Check Data Standarization and Consistency
SELECT DISTINCT cat 
FROM bronze.erp_px_cat_g1v2

SELECT DISTINCT subcat 
FROM bronze.erp_px_cat_g1v2

SELECT DISTINCT maintenance 
FROM bronze.erp_px_cat_g1v2
