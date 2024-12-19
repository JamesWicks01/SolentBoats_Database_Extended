-- FUNCTIONS
 -- Add a new service into the service table

CREATE OR REPLACE PROCEDURE new_service(_boat INT, _yard INT, _type "DESC", _note VARCHAR(254) DEFAULT NULL) RETURNS VOID LANGUAGE plpgsql AS $$
BEGIN
    IF NOT EXISTS(SELECT FROM boat WHERE boat_id = _boat) THEN
        RAISE 'Boat Identifer does not exist.';
    END IF;

    IF NOT EXISTS(SELECT FROM yard WHERE yard_id = _yard) THEN
        RAISE 'Yard Identifer does not exist.';
    END IF;

    INSERT INTO "service"(boat_id, yard_id, service_type, service_note)
    VALUES(_boat, _yard, _type, _note);
END
$$;

-- Update the Price once service is completed

CREATE OR REPLACE PROCEDURE price_service(_id INT, _price DECIMAL(10, 2)) RETURNS VOID LANGUAGE plpgsql AS $$
BEGIN
    IF NOT EXISTS(SELECT FROM "service" WHERE service_id = _id) THEN
        RAISE 'Service Identifer does not exist.';
    END IF;

    UPDATE "service" SET service_cost = _price WHERE service_id = _id;
END
$$;

-- Create a trigger to alert staff member to contact the client
-- when the service is completed

CREATE OR REPLACE FUNCTION customer_notify() RETURNS TRIGGER LANGUAGE plpgsql AS $$
DECLARE
    fname VARCHAR;
    lname VARCHAR;
    email1 VARCHAR;
    email2 VARCHAR;
    tel1 VARCHAR;
    tel2 VARCHAR;
BEGIN
    IF NEW.history_type = 'COMPLETE' THEN
        SELECT c.customer_fname, c.customer_lname, c.customer_email1, c.customer_email2, c.customer_tel1, c.customer_tel2
        INTO fname, lname, email1, email2, tel1, tel2
        FROM customer c
        JOIN boat b ON c.customer_id = b.customer_id
        JOIN "service" s ON b.boat_id = s.boat_id
        JOIN history h ON s.service_id = h.history_id;
        RAISE NOTICE
        'Service % is Completed
        % %
        Email(s): % : %
        Telephone(s): % : %',
        NEW.service_id, fname, lname,
        email1, email2, tel1, tel2;
    END IF;
    RETURN NEW;
END;
$$;

-- DROP TRIGGER trigger_notify ON history;

CREATE TRIGGER trigger_notify AFTER
INSERT ON history
FOR EACH ROW EXECUTE PROCEDURE customer_notify();