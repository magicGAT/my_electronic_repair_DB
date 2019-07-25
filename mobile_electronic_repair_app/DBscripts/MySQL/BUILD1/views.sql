-- preliminary views

-- The following are some views the the application will likely need to have access to in
-- order to serve the end user/business owner. They will be organzied based on their general
-- functionality and purpose

-- ------------------------------------------------------------------------------------------- 
-- CUSTOMER VIEWS

-- 1) View all active cutomers 

CREATE VIEW active_customers AS
	SELECT 
		first_name,
		last_name,
		email,
		phone
	FROM
		customers 
	WHERE
		active_stat = 1;

-- 2) View all leads

CREATE VIEW leads AS
	SELECT 
		first_name,
		last_name,
		email,
		phone
	FROM
		customers 
	WHERE
		lead_stat = 1;

-- 3) View all inactive customers

CREATE VIEW inactive AS
	SELECT 
		first_name,
		last_name,
		email,
		phone
	FROM
		customers 
	WHERE
		active_stat = 0;

