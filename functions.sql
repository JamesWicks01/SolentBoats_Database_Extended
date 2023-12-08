-- FUNCTIONS 

CREATE OR REPLACE PROCEDURE new_service(_boat INT, _yard INT, _type "DESC", _note VARCHAR(254) DEFAULT NULL)
LANGUAGE plpgsql
AS $$
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

CREATE OR REPLACE PROCEDURE price_service(_id INT, _price DECIMAL(10, 2))
LANGUAGE plpgsql
AS $$
BEGIN 
    IF NOT EXISTS(SELECT FROM service WHERE service_id = _id) THEN
        RAISE 'Service Identifer does not exist.';
    END IF;

    UPDATE "service" SET service_cost = _price WHERE service_id = _id;
END
$$;

-- CALL