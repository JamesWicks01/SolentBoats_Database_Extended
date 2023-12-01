--CREATES 

IF EXISTS DROP DATABASE grp21_solent; -- RESET DATABASE

CREATE DATABASE grp21_solent; -- CREATE

CREATE TABLE country(
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(54) NOT NULL
);

CREATE TABLE city(
    city_id SERIAL PRIMARY KEY,
    country_id INT NOT NULL,
    city_name VARCHAR(34) NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE TABLE "address"(
    address_id SERIAL PRIMARY KEY,
    city_id INT NOT NULL,
    address_postcode VARCHAR(8) NOT NULL,
    address1 VARCHAR(50) NOT NULL,
    address2 VARCHAR(50),
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    address_id INT NOT NULL,
    customer_fname VARCHAR(30) NOT NULL,
    customer_mname VARCHAR(30),
    customer_lname VARCHAR(30) NOT NULL,
    customer_tel1 VARCHAR(20) NOT NULL,
    customer_tel2 VARCHAR(20),
    customer_email1 VARCHAR(54) NOT NULL,
    customer_email2 VARCHAR(54),
    customer_priv BOOLEAN NOT NULL,
    FOREIGN KEY (address_id) REFERENCES "address"(address_id)
);

CREATE TABLE staff(
    staff_id SERIAL PRIMARY KEY,
    address_id INT NOT NULL,
    staff_fname VARCHAR(64)
);