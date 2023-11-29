--CREATES
IF EXISTS DROP DATABASE grp21_solent;

-- RESET DATABASE
CREATE DATABASE grp21_solent;

CREATE TABLE country (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(30) NOT NULL
   );

CREATE TABLE address (
    address_id SERIAL PRIMARY KEY,
    country_id INT REFERENCES country(country_id),
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


CREATE TABLE SERVICE (
    service_id SERIAL PRIMARY KEY,
    boat_id INT REFERENCES BOAT(boat_id) UNIQUE NOT NULL,
    service_cost DECIMAL(12, 2) NOT NULL
     
);


CREATE TABLE TYPE (
    type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(255) NOT NULL
);


CREATE TABLE STAFF_SERVICE (
    staff_id INT,
    service_id INT,
    PRIMARY KEY (staff_id, service_id),
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

CREATE TABLE ROLE (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(64) NOT NULL
);

CREATE TABLE STAFF_ROLE (
    staff_id INT,
    role_id INT,
    PRIMARY KEY (staff_id, role_id),
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
    PRIMARY KEY (staff_id, yard_id),
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
    PRIMARY KEY (service_id, fault_id),
    FOREIGN KEY (service_id) REFERENCES SERVICE(service_id),
    FOREIGN KEY (fault_id) REFERENCES FAULT(fault_id)
);

INSERT INTO country (country_name) VALUES
    ('United States'),
    ('United Kingdom'),
    ('Canada'),
    ('Australia');


INSERT INTO address (address_id, country_id, address_post_code, address_name_one, address_name_two) VALUES 
(1, 2, '4775-225', 'Srebrenica', 'Room 789'),
(2, 1, '4775-226', 'Kadugadung', 'Room 1022'),
(3, 4, '4775-227', 'Komga', '10th Floor'),
(4, 4, '4775-228', 'Thị Trấn Tủa Chùa', 'Room 1467'),
(5, 1, '4775-229', 'Silveiros', 'Room 1696'),
(6, 4, '4775-230', 'Yanglin', 'PO Box 2828'),
(7, 3, '4775-231', 'Monrovia', 'Suite 64'),
(8, 4, '4775-232', 'Banjar Bucu', 'Suite 56'),
(9, 2, '4775-233', 'Ponong', 'Room 774'),
(10, 2, '4775-234', 'Kināna', 'Suite 18'),
(11, 3, '47752350', 'Palmitas', 'Apt 1067'),
(12, 2, '85550000', 'Coronel Vivida', 'Suite 33'),
(13, 1, '47752360', 'Souillac', '2nd Floor'),
(14, 4, '18560000', 'Iperó', 'Room 594'),
(15, 4, '47752370', '‘Afak', 'Apt 767'),
(16, 4, '04104CDX', 'Manosque', 'Suite 11'),
(17, 3, '47752380', 'Sedatiagung', 'Suite 32'),
(18, 1, '47752390', 'Yangdu', 'Apt 1298'),
(19, 2, '47752400', 'Peuteuy', 'Suite 82'),
(20, 4, '47752410', 'Fenhe', '8th Floor'),
(21, 1, '47752420', 'Joševa', 'Room 924'),
(22, 1, '47752430', 'Minh Lương', 'Suite 52'),
(23, 1, '16282500', 'Imeni Zhelyabova', 'Suite 85'),
(24, 1, '47752440', 'Salem', 'PO Box 14131'),
(25, 1, '47752450', 'Kinkala', 'Suite 28'),
(26, 1, '47752460', 'Osorno', '13th Floor'),
(27, 2, '47752470', 'Luokou', 'Room 519'),
(28, 3, '60102100', 'Krasnyy Oktyabr’', 'PO Box 85502'),
(29, 2, '47752480', 'Vạn Giã', 'Room 1994'),
(30, 1, '62060000', 'Stęszew', 'PO Box 35957'),
(31, 2, '47752620', 'Rennes', 'Room 1425'),
(32, 4, '47752630', 'Shanhe', '11th Floor'),
(33, 2, '47752640', 'Novi Sad', 'PO Box 57320'),
(34, 4, '47752650', 'Novoselitsa', '4th Floor'),
(35, 2, '47752660', 'Saratamata', 'Room 1314'),
(36, 2, '47752670', 'Uiasa', 'PO Box 80920'),
(37, 1, '47752680', 'Qīr', 'PO Box 70990'),
(38, 2, '47752690', 'Zakroczym', 'Apt 1789'),
(39, 1, '47752700', 'Kaiaf', 'Room 1482'),
(40, 4, '47752710', 'Néa Ionía', 'Room 159'),
(41, 4, '47752720', 'Yunfu', '14th Floor'),
(42, 3, '47752730', 'Chikeng', 'Apt 98'),
(43, 2, '47752740', 'Gaogongdao', 'Room 1114'),
(44, 2, '47752750', 'Paraty', 'PO Box 67271'),
(45, 1, '47752760', 'Płock', '7th Floor'),
(46, 1, '47752770', 'Melioratyvne', 'Suite 93'),
(47, 3, '47752780', 'Duma', 'PO Box 25677'),
(48, 1, '47752790', 'Sihanoukville', '14th Floor'),
(49, 2, '47752800', 'Baoyang', 'Room 87'),
(50, 2, '47752810', 'San Ignacio de Tupile', 'Room 2000'),
(51, 2, '47752820', 'Stockholm', 'Apt 1108'),
(52, 4, '47752830', 'Tungawan', 'PO Box 26343'),
(53, 3, '47752840', 'Pudong', 'Room 1940'),
(54, 2, '47752850', 'Lukou', 'PO Box 8323'),
(55, 3, '47752860', 'Pekan', 'Room 1390'),
(56, 1, '47752870', 'Sadovo', 'Apt 1936'),
(57, 2, '47752880', 'Iset’', '14th Floor'),
(58, 3, '47752890', 'El Kef', '5th Floor'),
(59, 2, '47752900', 'Khueang Nai', 'Room 845'),
(60, 1, '47752910', 'Pak Phli', 'Room 1039'),
(61, 2, '47752920', 'Legaspi', 'PO Box 26382'),
(62, 1, '47752930', 'Taihe', 'Room 154'),
(63, 1, '47752940', 'Xingfu', 'Suite 40'),
(64, 1, '47752950', 'Lukovë', '10th Floor'),
(65, 3, '47752960', 'Sigiriya', 'Room 608'),
(66, 1, '47752970', 'Maojiagang', '10th Floor'),
(67, 4, '47752980', 'Faranah', 'PO Box 73475'),
(68, 2, '47752990', 'Montpellier', 'Room 214'),
(69, 3, '47753000', 'Pasadena', 'Room 106'),
(70, 4, '47753010', 'Sovetskoye', 'Suite 8'),
(71, 4, '47753020', 'Sadao', 'PO Box 72790'),
(72, 4, '47753030', 'Gunungsubang', 'Room 466'),
(73, 4, '47753040', 'Beloeil', 'Room 1609'),
(74, 4, '47753050', 'Póvoa de Penela', 'PO Box 96546'),
(75, 4, '47753060', 'La Reforma', 'Apt 1999'),
(76, 3, '47753070', 'Ystad', 'Room 814'),
(77, 2, '47753080', 'Chirpan', '12th Floor'),
(78, 4, '47753090', 'Quimper', 'Suite 57'),
(79, 1, '47753100', 'Sidi Yahia el Gharb', 'Apt 1736'),
(80, 1, '47753110', 'Achadinha', 'PO Box 78869'),
(81, 3, '47753120', 'Dikirnis', 'Apt 1363'),
(82, 3, '47753130', 'Vasyshcheve', 'PO Box 45365'),
(83, 2, '50504010', 'Igreja', 'Room 375'),
(84, 1, '47753140', 'Sokol', 'Room 1073'),
(85, 1, '47753150', 'Baima', 'Suite 6'),
(86, 1, '47753160', 'Saldanha', 'PO Box 3225'),
(87, 4, '48450280', 'Seara', 'Suite 16'),
(88, 1, '83900000', 'São Mateus do Sul', 'PO Box 33294'),
(89, 4, '47753170', 'Loma Bonita', '13th Floor'),
(90, 1, '60758000', 'Sechenovo', '16th Floor'),
(91, 3, '67150000', 'Ubon Ratchathani', 'Suite 31'),
(92, 2, '47753180', 'Az Zuwaytīnah', 'PO Box 69847'),
(93, 4, '47753190', 'Pingle', 'PO Box 44826'),
(94, 4, '47753200', 'Pagsanahan Norte', '6th Floor'),
(95, 3, '47753210', 'Merefa', 'Room 39'),
(96, 3, '67190000', 'Talalora', 'Room 38'),
(97, 1, '47753220', 'Khallat Ḩamāmah', 'Suite 56'),
(98, 3, '39050700', 'Ryazan’', 'Suite 11'),
(99, 3, '47753230', 'Tulu Bolo', 'Suite 28'),
(100, 2, '47753240', 'Cibanten', 'Suite 27');

-- Assuming your CUSTOMER and ADDRESS tables exist, otherwise create them first.

-- Inserting data into CUSTOMER table
INSERT INTO CUSTOMER (address_id, customer_fname, customer_lname, customer_tel, customer_email, customer_priv) VALUES
(1, 'John', 'Doe', '1234567890', 'john.doe@example.com', true),
(2, 'Jane', 'Smith', '9876543210', 'jane.smith@example.com', false),
(3, 'Bob', 'Johnson', '5551234567', 'bob.johnson@example.com', true),
(4, 'Alice', 'Williams', '9998887777', 'alice.williams@example.com', false),
(5, 'Charlie', 'Brown', '1112223333', 'charlie.brown@example.com', true),
(6, 'Eva', 'Martinez', '4445556666', 'eva.martinez@example.com', false),
(7, 'Michael', 'Taylor', '7778889999', 'michael.taylor@example.com', true),
(8, 'Olivia', 'Clark', '2223334444', 'olivia.clark@example.com', false),
(9, 'David', 'Lee', '6667778888', 'david.lee@example.com', true),
(10, 'Sophia', 'Miller', '3334445555', 'sophia.miller@example.com', false),
(11, 'Eleanor', NULL, '9876543211', 'eleanor@example.com', true),
(12, 'Liam', NULL, '4564564567', 'liam@example.com', false),
(13, 'Emma', 'Smith', '7897897890', 'emma@example.com', true),
(14, 'James', 'Johnson', '9876543212', 'james@example.com', false),
(15, 'Ava', NULL, '1112223334', 'ava@example.com', true),
(16, 'Noah', 'Williams', '4445556667', 'noah@example.com', false),
(17, 'Olivia', 'Brown', '7778889998', 'olivia@example.com', true),
(18, 'Isabella', NULL, '2223334445', 'isabella@example.com', false),
(19, 'Sophia', NULL, '6667778889', 'sophia@example.com', true),
(20, 'Jackson', 'Miller', '3334445556', 'jackson@example.com', false),
(21, 'Sophie', 'Taylor', '5556667778', 'sophie.taylor2@example.com', true),
(22, 'Mia', 'Clark', '9998887776', 'mia.clark2@example.com', false),
(23, 'Liam', 'Johnson', '7778889997', 'liam.johnson2@example.com', true),
(24, 'Ava', 'Williams', '1112223332', 'ava.williams2@example.com', false),
(25, 'Jackson', 'Brown', '4445556665', 'jackson.brown2@example.com', true),
(26, 'Olivia', 'Martinez', '1234567891', 'olivia.martinez2@example.com', false),
(27, 'Noah', 'Lee', '6667778887', 'noah.lee2@example.com', true),
(28, 'Emma', 'Miller', '2223334443', 'emma.miller2@example.com', false),
(29, 'Sophia', 'Davis', '5551234568', 'sophia.davis2@example.com', true),
(30, 'James', 'Moore', '9876543214', 'james.moore2@example.com', false),
(31, 'Ethan', 'Harris', '7778889996', 'ethan.harris2@example.com', true),
(32, 'Olivia', 'Baker', '3334445557', 'olivia.baker2@example.com', false),
(33, 'Isabella', 'Fisher', '4445556669', 'isabella.fisher2@example.com', true),
(34, 'Mason', 'Cooper', '1112223336', 'mason.cooper2@example.com', false),
(35, 'Sophia', 'Gomez', '6667778891', 'sophia.gomez2@example.com', true),
(36, 'Aiden', 'Reed', '7897897892', 'aiden.reed2@example.com', false),
(37, 'Grace', 'Perry', '9876543215', 'grace.perry2@example.com', true),
(38, 'Lucas', 'Bell', '4564564569', 'lucas.bell2@example.com', false),
(39, 'Ava', 'Ward', '5556667780', 'ava.ward2@example.com', true),
(40, 'Liam', 'Hill', '9998887779', 'liam.hill2@example.com', false),
(41, 'Sophie', 'Taylor', '5556667785', 'sophie.taylor7@example.com', true),
(42, 'Mia', 'Clark', '9998887784', 'mia.clark7@example.com', false),
(43, 'Liam', 'Johnson', '8427758866', 'liam.johnson7@example.com', true),
(44, 'Ava', 'Williams', '1112223339', 'ava.williams7@example.com', false),
(45, 'Jackson', 'Brown', '8427758867', 'jackson.brown7@example.com', true),
(46, 'Olivia', 'Martinez', '1234567895', 'olivia.martinez7@example.com', false),
(47, 'Noah', 'Lee', '6667778892', 'noah.lee7@example.com', true),
(48, 'Emma', 'Miller', '2223334447', 'emma.miller7@example.com', false),
(49, 'Sophia', 'Davis', '5551234572', 'sophia.davis7@example.com', true),
(50, 'James', 'Moore', '9876543221', 'james.moore7@example.com', false),
(51, 'Ella', 'Johnson', '5556667786', 'ella.johnson@example.com', true),
(52, 'Logan', 'Davis', '9998887785', 'logan.davis@example.com', false),
(53, 'Ava', 'Miller', '8427758868', 'ava.miller@example.com', true),
(54, 'Noah', 'Williams', '1112223340', 'noah.williams@example.com', false),
(55, 'Sophia', 'Clark', '8427758869', 'sophia.clark@example.com', true),
(56, 'Lucas', 'Gomez', '1234567896', 'lucas.gomez@example.com', false),
(57, 'Isabella', 'Lee', '6667778893', 'isabella.lee@example.com', true),
(58, 'Ethan', 'Taylor', '2223334448', 'ethan.taylor@example.com', false),
(59, 'Olivia', 'Moore', '5551234573', 'olivia.moore@example.com', true),
(60, 'Mason', 'Harris', '9876543222', 'mason.harris@example.com', false),
(61, 'Liam', 'Baker', '3334445560', 'liam.baker@example.com', true),
(62, 'Emma', 'Fisher', '4445556672', 'emma.fisher@example.com', false),
(63, 'Jackson', 'Cooper', '9427758866', 'jackson.cooper@example.com', true),
(64, 'Sophia', 'Gomez', '6667778894', 'sophia.gomez@example.com', false),
(65, 'Aiden', 'Reed', '7897897895', 'aiden.reed@example.com', true),
(66, 'Grace', 'Perry', '9876543223', 'grace.perry@example.com', false),
(67, 'Lucas', 'Bell', '4564564572', 'lucas.bell@example.com', true),
(68, 'Ava', 'Ward', '5556667787', 'ava.ward@example.com', false),
(69, 'Liam', 'Hill', '9998887786', 'liam.hill@example.com', true),
(70, 'Sophie', 'Taylor', '5556667788', 'sophie.taylor8@example.com', false),
(71, 'Ella', 'Hill', '5556667789', 'ella.hill@example.com', true),
(72, 'Logan', 'Moore', '9998887788', 'logan.moore@example.com', false),
(73, 'Ava', 'Baker', '8427758870', 'ava.baker@example.com', true),
(74, 'Noah', 'Taylor', '1112223341', 'noah.taylor@example.com', false),
(75, 'Sophia', 'Harris', '8427758871', 'sophia.harris@example.com', true),
(76, 'Lucas', 'Clark', '1234567897', 'lucas.clark@example.com', false),
(77, 'Isabella', 'Brown', '6667778895', 'isabella.brown@example.com', true),
(78, 'Ethan', 'Williams', '2223334449', 'ethan.williams@example.com', false),
(79, 'Olivia', 'Gomez', '5551234574', 'olivia.gomez@example.com', true),
(80, 'Mason', 'Lee', '9876543224', 'mason.lee@example.com', false),
(81, 'Liam', 'Fisher', '3334445561', 'liam.fisher@example.com', true),
(82, 'Emma', 'Cooper', '4445556673', 'emma.cooper@example.com', false),
(83, 'Jackson', 'Reed', '9427758872', 'jackson.reed@example.com', true),
(84, 'Sophia', 'Perry', '6667778896', 'sophia.perry@example.com', false),
(85, 'Aiden', 'Bell', '7897897896', 'aiden.bell@example.com', true),
(86, 'Grace', 'Ward', '9876543225', 'grace.ward@example.com', false),
(87, 'Lucas', 'Hill', '4564564573', 'lucas.hill@example.com', true),
(88, 'Ava', 'Taylor', '5556667790', 'ava.taylor@example.com', false),
(89, 'Liam', 'Gomez', '9998887789', 'liam.gomez@example.com', true),
(90, 'Sophie', 'Clark', '5556667791', 'sophie.clark@example.com', false),
(91, 'Sophie', 'Moore', '5556667792', 'sophie.moore@example.com', true),
(92, 'kru', 'Baker', '9998887790', 'kru.baker@example.com', false),
(93, 'Hina', 'Fisher', '8427758873', 'hina.fisher@example.com', true),
(94, 'Jack', 'Cooper', '1112223342', 'jack.cooper@example.com', false),
(95, 'Sophia', 'Reed', '8427758874', 'sophia.reed@example.com', true),
(96, 'Aiden', 'Perry', '1234567898', 'aiden.perry@example.com', false),
(97, 'Grace', 'Bell', '6667778897', 'grace.bell@example.com', true),
(98, 'Lucas', 'Ward', '2223334450', 'lucas.ward@example.com', false),
(99, 'Ava', 'Hill', '5556667793', 'ava.hill@example.com', true),
(100, 'Liam', 'Taylor', '9998887791', 'liam.taylor@example.com', false);

INSERT INTO boat(boat_id, customer_id) VALUES
(1, 1261),
(2, 1262),
(3, 1261),
(4, 1265),
(5, 1270),
(6, 1285),
(7, 1299),
(8, 1288),
(9, 1275),
(10, 1263),
(11, 1278),
(12, 1295),
(13, 1267),
(14, 1280),
(15, 1290),
(16, 1266),
(17, 1298),
(18, 1289),
(19, 1273),
(20, 1277),
(21, 1261),
(22, 1279),
(23, 1292),
(24, 1264),
(25, 1274),
(26, 1282),
(27, 1297),
(28, 1268),
(29, 1283),
(30, 1271),
(31, 1269),
(32, 1276),
(33, 1291),
(34, 1281),
(35, 1261),
(36, 1272),
(37, 1296),
(38, 1261),
(39, 1286),
(40, 1278),
(41, 1293),
(42, 1262),
(43, 1294),
(44, 1284),
(45, 1261),
(46, 1265),
(47, 1290),
(48, 1274),
(49, 1267),
(50, 1287);

