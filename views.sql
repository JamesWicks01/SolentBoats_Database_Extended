--VIEWS
 -- Check which Customers have had a service completed

CREATE OR REPLACE VIEW customer_services
SELECT 
    CONCAT_WS( ' ', customer_fname, customer_mname, customer_lname ) AS "Customer Name(s)",
    CONCAT( address_one, COALESCE(', ', NULLIF(address_two, '')), '', city_name, ' ', address_postcode ) AS "Customer Address",
    CONCAT_WS(' : ', customer_email1, customer_tel1) AS "Contact Detail(s)",
    boat_mic AS "Boat Identifer",
    manufacture_model AS "Boat Model",
    CAST(service_cost AS MONEY) AS "Service Total",
    history_date AS "Date Completed"
FROM 
    city
JOIN 
    "address" USING (city_id)
JOIN 
    customer USING (address_id)
JOIN 
    boat USING (customer_id)
JOIN 
    manufacture USING (manufacture_id)
JOIN 
    "service" USING (boat_id)
JOIN 
    history USING (service_id)
WHERE 
    history_type = 'COMPLETE'
ORDER BY 
    service_cost DESC;

-- Yard Generated Revenue

CREATE OR REPLACE VIEW yard_generated
SELECT 
    y.yard_name AS "Yard Name",
    CONCAT(y.yard_email, ' : ', y.yard_tel) AS "Yard Contact Detail(s)",
    CONCAT(a.address_one, COALESCE(', ', NULLIF(a.address_two, '')), '', c.city_name, ' ', a.address_postcode) AS "Yard Address",
    COUNT(DISTINCT yf.facilities_id) AS "Facilities",
    COUNT(DISTINCT sy.staff_id) AS "Total of Staff",
    COALESCE(tr."Total Revenue", 0) AS "Total Revenue"
FROM 
    city c
JOIN 
    "address" a ON c.city_id = a.city_id
JOIN 
    yard y ON a.address_id = y.address_id
LEFT JOIN 
    yard_facilities yf ON y.yard_id = yf.yard_id
LEFT JOIN 
    staff_yard sy ON y.yard_id = sy.yard_id
LEFT JOIN 
    (
        SELECT
            sy.yard_id,
            SUM(COALESCE(s.service_cost, 0)) AS "Total Revenue"
        FROM 
            staff_service ss
        JOIN 
            "service" s ON ss.service_id = s.service_id
        JOIN 
            staff_yard sy ON ss.staff_id = sy.staff_id
        GROUP BY 
            sy.yard_id
    ) tr ON y.yard_id = tr.yard_id
GROUP BY 
    y.yard_name,
    CONCAT(y.yard_email, ' : ', y.yard_tel),
    CONCAT(a.address_one, COALESCE(', ', NULLIF(a.address_two, '')), '', c.city_name, ' ', a.address_postcode),
    tr."Total Revenue";