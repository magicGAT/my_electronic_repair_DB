USE my_electronic_repair;

-- This file contains fabricated data for use with the my_electronic_repair database
-- Sample data for devices table 
INSERT INTO devices VALUES (1, "Galaxy s7 Star", "Samsung", "2018-02-01");
INSERT INTO devices VALUES (2, "iPhone 6", "Apple", "2014-09-01");
INSERT INTO devices VALUES (3, "iPhone 10", "Apple", "2017-10-03");
INSERT INTO devices VALUES (4, "iPhone 8 Plus", "Apple", "2017-09-22");
INSERT INTO devices VALUES (5, "Galaxy j3 Orbit", "Samsung", "2015-01-15");

-- Sample data for tools table 
INSERT INTO tools VALUES (1, "Suction Cup", "IFIXIT", 2, 8.99, "Fry's Electronics");
INSERT INTO tools VALUES (2, "Heat Gun", "Nair", 1, 15.00, "Target");
INSERT INTO tools VALUES (3, "Mini-bit kit", "Jakemy", 2, 20.00, "Amazon Prime");
INSERT INTO tools VALUES (4, "Plastic Spudger", "IFIXIT", 4, 2.00, "Fry's Electronics");
INSERT INTO tools VALUES (5, "Angled Precision Tweezers", "Jakemy", 2, 5.00, "Amazon Prime" );

-- Sample data for parts table 
INSERT INTO parts VALUES (1, "iPhone 6 Screen assembly", "Apple", 2, 40.00, "Apple.com");
INSERT INTO parts VALUES (2, "Galaxy s7 speaker assembly", "TCB", 1, 20.00, "Schenzen ELectric Depot");
INSERT INTO parts VALUES (3, "iPhone 10 glass plate", "Schenzen Imitators Inc", 5, 99.99, "Schenzen Electric Depot");
INSERT INTO parts VALUES (4, "iPhone 8 Plus home button", "Apple", 2, 20, "Apple.com");
INSERT INTO parts VALUES (5, "Galaxy j3 volume buttons", "Samsung", 3, 10.00, "Samsung.com");
INSERT INTO parts VALUES (6, "Electronic Adhesive", "Real Solutions", 4, 8.99, "Fry's Electronics");
INSERT INTO parts VALUES (7, "Compressed Air", "AIRmax", 10, 2.00, "Fry's Electronics");

-- Sample data for customers table ]
INSERT INTO customers VALUES (1, "Maria", "Villanueva", "something.blogspot.com", "555-5555", 0, 1);
INSERT INTO customers VALUES (2, "John", "Smith", "jsmith@gmail.com", "666-6666", 1, 0);
INSERT INTO customers VALUES (3, "Krishna", "Patani", "kpat@msn.com", "777-7777", 0, 1);
INSERT INTO customers VALUES (4, "Cindy", "Chen", "everything.blogspot.com", "888-8888", 1, 1);
INSERT INTO customers VALUES (5, "Shanae", "Sampson", "shautedveggies@gmail.com", "999-9999", 0, 0);

-- Sample data for technicians table 
INSERT INTO technicians VALUES (1, "George", "Tallyrand");
INSERT INTO technicians VALUES (2, "Tammy", "Zillnow");
INSERT INTO technicians VALUES (3, "Janelle", "Quinonez");
INSERT INTO technicians VALUES (4, "Kelly", "Zou");
INSERT INTO technicians VALUES (5, "Gary", "Tiber");

-- Sample data for services table
INSERT INTO services VALUES (1, 1, "Galaxay s7 Star speaker replacement", 60.00, 60);
INSERT INTO services VALUES (2, 2, "iPhone 6 complete screen replacement", 80.00, 80);
INSERT INTO services VALUES (3, 3, "iPhone 10 glass replacement", 140.00, 140);
INSERT INTO services VALUES (4, 4, "iPhone 8 Plus home button replacement", 60.00, 60);
INSERT INTO services VALUES (5, 5, "Galaxay j3 Orbrit volume button replacements", 50.00, 50); 

-- Sample data for tools_by_service table
INSERT INTO tools_by_service VALUES (1, 1);
INSERT INTO tools_by_service VALUES (1, 3);
INSERT INTO tools_by_service VALUES (1, 4);
INSERT INTO tools_by_service VALUES (2, 1);
INSERT INTO tools_by_service VALUES (2, 3);
INSERT INTO tools_by_service VALUES (2, 4);
INSERT INTO tools_by_service VALUES (2, 5);
INSERT INTO tools_by_service VALUES (3, 2);
INSERT INTO tools_by_service VALUES (3, 4);
INSERT INTO tools_by_service VALUES (3, 5);
INSERT INTO tools_by_service VALUES (4, 1);
INSERT INTO tools_by_service VALUES (4, 2);
INSERT INTO tools_by_service VALUES (4, 4);
INSERT INTO tools_by_service VALUES (4, 5);
INSERT INTO tools_by_service VALUES (5, 1);
INSERT INTO tools_by_service VALUES (5, 2);
INSERT INTO tools_by_service VALUES (5, 5);

-- Sample data for parts_by_service table
INSERT INTO parts_by_service VALUES (1, 2);
INSERT INTO parts_by_service VALUES (1, 7);
INSERT INTO parts_by_service VALUES (2, 1);
INSERT INTO parts_by_service VALUES (2, 6);
INSERT INTO parts_by_service VALUES (2, 7);
INSERT INTO parts_by_service VALUES (3, 3);
INSERT INTO parts_by_service VALUES (3, 6);
INSERT INTO parts_by_service VALUES (3, 7);
INSERT INTO parts_by_service VALUES (4, 4);
INSERT INTO parts_by_service VALUES (5, 5);
INSERT INTO parts_by_service VALUES (5, 6);
INSERT INTO parts_by_service VALUES (5, 7);

-- Sample data for tech_details table
INSERT INTO tech_details VALUES (1, "1989-06-03", "2019-06-01", 100, "2721 234th Ave", "Santa Clara", "CA");
INSERT INTO tech_details VALUES (2, "1986-05-23", "2019-06-01", 100, "2721 234th Ave", "Santa Clara", "CA");
INSERT INTO tech_details VALUES (3, "1993-02-17", "2019-06-01", 100, "2721 234th Ave", "Santa Clara", "CA");
INSERT INTO tech_details VALUES (4, "2001-10-13", "2019-07-15", 0, "235 Miro Ave", "San Jose", "CA");
INSERT INTO tech_details VALUES (5, "2000-11-05", "2019-07-15", 0, "235 Miro Ave", "San Jose", "CA");

-- Sample data for prof_by_tech table
INSERT INTO prof_by_tech VALUES (1, 1);
INSERT INTO prof_by_tech VALUES (1, 2);
INSERT INTO prof_by_tech VALUES (1, 3);
INSERT INTO prof_by_tech VALUES (1, 4);
INSERT INTO prof_by_tech VALUES (1, 5);
INSERT INTO prof_by_tech VALUES (2, 2);
INSERT INTO prof_by_tech VALUES (2, 3);
INSERT INTO prof_by_tech VALUES (2, 4);
INSERT INTO prof_by_tech VALUES (3, 1);
INSERT INTO prof_by_tech VALUES (3, 5);
INSERT INTO prof_by_tech VALUES (4, 2);
INSERT INTO prof_by_tech VALUES (4, 3);
INSERT INTO prof_by_tech VALUES (5, 1);
INSERT INTO prof_by_tech VALUES (5, 2);
INSERT INTO prof_by_tech VALUES (5, 3);
INSERT INTO prof_by_tech VALUES (5, 4);
INSERT INTO prof_by_tech VALUES (5, 5);

-- Sample data for customer_details table
INSERT INTO customer_details VALUES (1, 140, "San Jose", "CA", "1977-06-13", "2019-07-15");
INSERT INTO customer_details VALUES (2, 0, "Sunnyvale", "CA", "1992-11-04", NULL);
INSERT INTO customer_details VALUES (3, 150, "San Jose", "CA", "1985-12-21", "2019-07-01");
INSERT INTO customer_details VALUES (4, 0, "San Jose", "CA", "1990-06-01", NULL);
INSERT INTO customer_details VALUES (5, 240, "Sunnyvale", "CA", "1970-02-09", "2019-06-02");

-- Sample data for client_devices table
INSERT INTO client_devices VALUES (1, 1, "2019-07-15");
INSERT INTO client_devices VALUES (1, 3, "2019-07-15");
INSERT INTO client_devices VALUES (3, 4, "2019-07-01");
INSERT INTO client_devices VALUES (4, 2, "2019-08-01");
INSERT INTO client_devices VALUES (5, 3, "2019-06-02");
INSERT INTO client_devices VALUES (5, 5, "2019-06-02");

-- Sample data for service_orders table
INSERT INTO service_orders VALUES (1, 1, 1, 1, "2019-07-15 08:30:59", "8765, Del Sol Blvd, San Jose", "2019-07-20 09:00:00");
INSERT INTO service_orders VALUES (2, 3, 2, 4, "2019-07-01 09:45:33", "In Store", "2019-07-01 09:45:33");
INSERT INTO service_orders VALUES (3, 1, 1, 3, "2019-07-28 09:47:45", "271 Lupine CT, Sunnyvale", "2019-08-01 12:00:00");
INSERT INTO service_orders VALUES (4, 5, 2, 3, "2019-06-02 12:03:21", "In Store", "2019-06-02 12:03:21");
INSERT INTO service_orders VALUES (5, 5, 3, 5, "2019-06-07 17:01:42", "In Store", "2019-06-07 17:01:42");

-- Sample data for service_que table
-- INSERT INTO service_que VALUES ()
-- INSERT INTO service_que VALUES ()
-- INSERT INTO service_que VALUES ()
-- INSERT INTO service_que VALUES ()

