--CREATES
IF EXISTS DROP DATABASE grp21_solent;

-- RESET DATABASE
CREATE DATABASE grp21_solent;

-- CREATE
CREATE TABLE country (
    county_id SERIAL PRIMARY KEY,
    county_name VARCHAR(30) NOT NULL
);

CREATE TABLE "address" (
    address_id SERIAL PRIMARY KEY,
    county_id INT REFERENCES COUNTY(county_id),
    address_post_code VARCHAR(8) UNIQUE NOT NULL,
    address_name_one VARCHAR(50) NOT NULL,
    address_name_two VARCHAR(50)
);

CREATE TABLE CUSTOMER (
    customer_id SERIAL PRIMARY KEY,
    address_id INT REFERENCES address(address_id) NOT NULL,
    customer_fname VARCHAR(64) NOT NULL,
    customer_lname VARCHAR(64),
    customer_tel VARCHAR(20) UNIQUE NOT NULL,
    customer_email VARCHAR(254) UNIQUE NOT NULL,
    customer_priv BOOLEAN
);

CREATE TABLE BOAT (
    boat_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES CUSTOMER(customer_id) NOT NULL UNIQUE
);

-- Create the SERVICE table
CREATE TABLE "SERVICE" (
    service_id SERIAL PRIMARY KEY,
    boat_id INT REFERENCES BOAT(boat_id) UNIQUE NOT NULL,
    service_cost DECIMAL(12, 2) NOT NULL
);

-- Create the TYPE table
CREATE TABLE "TYPE" (
    type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(255) NOT NULL
);

-- Create the STAFF_SERVICE table
CREATE TABLE STAFF_SERVICE (
    staff_id INT,
    service_id INT,
    PRIMARY KEY (
        staff_id,
        service_id
    ),
    FOREIGN KEY (staff_id) REFERENCES STAFF(staff_id),
    FOREIGN KEY (service_id) REFERENCES SERVICE(service_id)
);

CREATE TABLE STAFF (
    staff_id SERIAL PRIMARY KEY,
    address_id INT REFERENCES ADDRESS(address_id),
    staff_fname VARCHAR(64) NOT NULL,
    staff_lname VARCHAR(64),
    staff_tel VARCHAR(20) UNIQUE NOT NULL,
    staff_email VARCHAR(254) UNIQUE NOT NULL
);

CREATE TABLE "ROLE" (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(64) NOT NULL
);

CREATE TABLE STAFF_ROLE (
    staff_id INT,
    role_id INT,
    PRIMARY KEY (
        staff_id,
        role_id
    ),
    FOREIGN KEY (staff_id) REFERENCES STAFF(staff_id),
    FOREIGN KEY (role_id) REFERENCES role(role_id)
);

CREATE TABLE HISTORY (
    history_id SERIAL PRIMARY KEY,
    service_id INT REFERENCES service(service_id),
    history_update VARCHAR(255)
);

CREATE TABLE YARD (
    yard_id SERIAL PRIMARY KEY,
    address_id INT REFERENCES ADDRESS(address_id),
    service_cost DECIMAL(12, 2) NOT NULL
);

CREATE TABLE STAFF_YARD (
    staff_id INT,
    yard_id INT,
    PRIMARY KEY (
        staff_id,
        yard_id
    ),
    FOREIGN KEY (staff_id) REFERENCES STAFF(staff_id),
    FOREIGN KEY (yard_id) REFERENCES YARD(yard_id)
);

CREATE TABLE CATEGORY (
    category_id SERIAL PRIMARY KEY,
    category_type VARCHAR(255)
);

CREATE TABLE FAULT (
    fault_id SERIAL PRIMARY KEY,
    category_id INT REFERENCES CATEGORY(category_id),
    fault_name VARCHAR(255) NOT NULL
);

CREATE TABLE SERVICE_FAULT (
    service_id INT,
    fault_id INT,
    PRIMARY KEY (
        service_id,
        fault_id
    ),
    FOREIGN KEY (service_id) REFERENCES SERVICE(service_id),
    FOREIGN KEY (fault_id) REFERENCES FAULT(fault_id)
);