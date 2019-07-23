DROP DATABASE IF EXISTS my_electronic_repair;
CREATE DATABASE my_electronic_repair;
USE my_electronic_repair;
	
    CREATE TABLE devices 
		(
			device_id INT 
				UNSIGNED NOT NULL UNIQUE 
                AUTO_INCREMENT,
			device_name VARCHAR(255) 
				NOT NULL,
			manufacturer VARCHAR(255)
            	NOT NULL,
			release_date DATE,
            PRIMARY KEY (device_id)
		)
        ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin
        
	 
