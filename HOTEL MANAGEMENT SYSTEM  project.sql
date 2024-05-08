create database HOTEL_MANAGEMENT_SYSTEM;
USE HOTEL_MANAGEMENT_SYSTEM;


-- Rooms Table
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_number INT,
    room_type VARCHAR(50),
    rate_per_night DECIMAL(10, 2),
    status VARCHAR(20)
);

-- Guests Table
CREATE TABLE Guests (
    guest_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Reservations Table
CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in_date DATE,
    check_out_date DATE,
    total_amount DECIMAL(10, 2),
    payment_status VARCHAR(20),
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

-- Staff Table
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    position VARCHAR(50),
    department VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Services Table
CREATE TABLE Services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2)
);

-- Room_Services Table
CREATE TABLE Room_Services (
    room_service_id INT PRIMARY KEY,
    reservation_id INT,
    service_id INT,
    quantity INT,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    reservation_id INT,
    payment_date DATE,
    amount_paid DECIMAL(10, 2),
    payment_method VARCHAR(50),
    FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id)
);


INSERT INTO Rooms (room_id, room_number, room_type, rate_per_night, status) VALUES
(1, 101, 'Single', 50.00, 'Available'),
(2, 102, 'Single', 50.00, 'Available'),
(3, 103, 'Single', 50.00, 'Occupied'),
(4, 104, 'Single', 50.00, 'Available'),
(5, 105, 'Single', 50.00, 'Available'),
(6, 201, 'Double', 75.00, 'Available'),
(7, 202, 'Double', 75.00, 'Available'),
(8, 203, 'Double', 75.00, 'Available'),
(9, 204, 'Double', 75.00, 'Available'),
(10, 205, 'Double', 75.00, 'Available'),
(11, 301, 'Suite', 150.00, 'Available'),
(12, 302, 'Suite', 150.00, 'Available'),
(13, 303, 'Suite', 150.00, 'Available'),
(14, 304, 'Suite', 150.00, 'Available'),
(15, 305, 'Suite', 150.00, 'Available'),
(16, 401, 'Penthouse', 300.00, 'Available'),
(17, 402, 'Penthouse', 300.00, 'Available'),
(18, 403, 'Penthouse', 300.00, 'Available'),
(19, 404, 'Penthouse', 300.00, 'Available'),
(20, 405, 'Penthouse', 300.00, 'Available'),
(21, 501, 'Family', 100.00, 'Available'),
(22, 502, 'Family', 100.00, 'Available'),
(23, 503, 'Family', 100.00, 'Available'),
(24, 504, 'Family', 100.00, 'Available'),
(25, 505, 'Family', 100.00, 'Available');


INSERT INTO Guests (guest_id, first_name, last_name, email, phone_number) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '+1234567890'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '+1987654321'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '+1122334455'),
(4, 'Emily', 'Brown', 'emily.brown@example.com', '+1567890123'),
(5, 'David', 'Wilson', 'david.wilson@example.com', '+1324354657'),
(6, 'Sarah', 'Anderson', 'sarah.anderson@example.com', '+1789054321'),
(7, 'Christopher', 'Martinez', 'christopher.martinez@example.com', '+1432987654'),
(8, 'Amanda', 'Taylor', 'amanda.taylor@example.com', '+1876543210'),
(9, 'James', 'Thomas', 'james.thomas@example.com', '+1247389056'),
(10, 'Jennifer', 'Hernandez', 'jennifer.hernandez@example.com', '+1987654321'),
(11, 'Matthew', 'Young', 'matthew.young@example.com', '+1123456789'),
(12, 'Jessica', 'King', 'jessica.king@example.com', '+1654327890'),
(13, 'Daniel', 'Lee', 'daniel.lee@example.com', '+1789054321'),
(14, 'Ashley', 'Clark', 'ashley.clark@example.com', '+1432987654'),
(15, 'Andrew', 'Lewis', 'andrew.lewis@example.com', '+1890765432'),
(16, 'Elizabeth', 'Walker', 'elizabeth.walker@example.com', '+1247389056'),
(17, 'Ryan', 'Hall', 'ryan.hall@example.com', '+1324354657'),
(18, 'Olivia', 'Allen', 'olivia.allen@example.com', '+1567890123'),
(19, 'Nicholas', 'Green', 'nicholas.green@example.com', '+1234567890'),
(20, 'Samantha', 'Baker', 'samantha.baker@example.com', '+1987654321'),
(21, 'Tyler', 'Gonzalez', 'tyler.gonzalez@example.com', '+1122334455'),
(22, 'Madison', 'Nelson', 'madison.nelson@example.com', '+1789054321'),
(23, 'Justin', 'Carter', 'justin.carter@example.com', '+1432987654'),
(24, 'Emma', 'Hill', 'emma.hill@example.com', '+1876543210'),
(25, 'Brandon', 'Wright', 'brandon.wright@example.com', '+1247389056');


INSERT INTO Reservations (reservation_id, guest_id, room_id, check_in_date, check_out_date, total_amount, payment_status) VALUES
(1, 1, 1, '2024-05-01', '2024-05-05', 200.00, 'Paid'),
(2, 2, 6, '2024-05-03', '2024-05-07', 300.00, 'Paid'),
(3, 3, 11, '2024-05-02', '2024-05-06', 600.00, 'Paid'),
(4, 4, 16, '2024-05-04', '2024-05-08', 1200.00, 'Paid'),
(5, 5, 21, '2024-05-01', '2024-05-03', 200.00, 'Paid'),
(6, 6, 2, '2024-05-06', '2024-05-08', 100.00, 'Paid'),
(7, 7, 7, '2024-05-02', '2024-05-04', 150.00, 'Paid'),
(8, 8, 12, '2024-05-03', '2024-05-07', 600.00, 'Paid'),
(9, 9, 17, '2024-05-05', '2024-05-09', 1200.00, 'Paid'),
(10, 10, 22, '2024-05-01', '2024-05-05', 400.00, 'Paid'),
(11, 11, 3, '2024-05-07', '2024-05-10', 150.00, 'Paid'),
(12, 12, 8, '2024-05-04', '2024-05-06', 300.00, 'Paid'),
(13, 13, 13, '2024-05-06', '2024-05-09', 450.00, 'Paid'),
(14, 14, 18, '2024-05-08', '2024-05-12', 900.00, 'Paid'),
(15, 15, 23, '2024-05-02', '2024-05-04', 200.00, 'Paid'),
(16, 16, 4, '2024-05-09', '2024-05-13', 200.00, 'Paid'),
(17, 17, 9, '2024-05-05', '2024-05-07', 150.00, 'Paid'),
(18, 18, 14, '2024-05-07', '2024-05-10', 450.00, 'Paid'),
(19, 19, 19, '2024-05-03', '2024-05-07', 400.00, 'Paid'),
(20, 20, 24, '2024-05-01', '2024-05-03', 200.00, 'Paid'),
(21, 21, 5, '2024-05-08', '2024-05-11', 300.00, 'Paid'),
(22, 22, 10, '2024-05-04', '2024-05-06', 150.00, 'Paid'),
(23, 23, 15, '2024-05-06', '2024-05-08', 300.00, 'Paid'),
(24, 24, 20, '2024-05-02', '2024-05-06', 400.00, 'Paid'),
(25, 25, 25, '2024-05-09', '2024-05-13', 400.00, 'Paid');


INSERT INTO Staff (staff_id, first_name, last_name, position, department, email, phone_number) VALUES
(1, 'Michael', 'Smith', 'Manager', 'Management', 'michael.smith@example.com', '+1234567890'),
(2, 'Jennifer', 'Johnson', 'Front Desk Clerk', 'Front Desk', 'jennifer.johnson@example.com', '+1987654321'),
(3, 'Christopher', 'Williams', 'Housekeeping Supervisor', 'Housekeeping', 'christopher.williams@example.com', '+1122334455'),
(4, 'Jessica', 'Jones', 'Maintenance Technician', 'Maintenance', 'jessica.jones@example.com', '+1567890123'),
(5, 'Matthew', 'Brown', 'Restaurant Manager', 'Food & Beverage', 'matthew.brown@example.com', '+1324354657'),
(6, 'Amanda', 'Garcia', 'Concierge', 'Guest Services', 'amanda.garcia@example.com', '+1789054321'),
(7, 'David', 'Rodriguez', 'Bellhop', 'Guest Services', 'david.rodriguez@example.com', '+1432987654'),
(8, 'Ashley', 'Martinez', 'Chef', 'Food & Beverage', 'ashley.martinez@example.com', '+1876543210'),
(9, 'John', 'Hernandez', 'Bartender', 'Food & Beverage', 'john.hernandez@example.com', '+1247389056'),
(10, 'Emily', 'Lopez', 'Spa Therapist', 'Spa', 'emily.lopez@example.com', '+1987654321'),
(11, 'Daniel', 'Gonzalez', 'Fitness Instructor', 'Fitness Center', 'daniel.gonzalez@example.com', '+1123456789'),
(12, 'Samantha', 'Perez', 'Event Coordinator', 'Events', 'samantha.perez@example.com', '+1654327890'),
(13, 'Ryan', 'Wilson', 'Security Officer', 'Security', 'ryan.wilson@example.com', '+1789054321'),
(14, 'Olivia', 'Flores', 'Valet Attendant', 'Guest Services', 'olivia.flores@example.com', '+1432987654'),
(15, 'Nicholas', 'Torres', 'IT Specialist', 'IT', 'nicholas.torres@example.com', '+1890765432'),
(16, 'Emma', 'Rivera', 'Housekeeping', 'Housekeeping', 'emma.rivera@example.com', '+1247389056'),
(17, 'Brandon', 'Long', 'Front Desk Clerk', 'Front Desk', 'brandon.long@example.com', '+1324354657'),
(18, 'Madison', 'Scott', 'Housekeeping', 'Housekeeping', 'madison.scott@example.com', '+1567890123'),
(19, 'Tyler', 'Nguyen', 'Chef', 'Food & Beverage', 'tyler.nguyen@example.com', '+1234567890'),
(20, 'Elizabeth', 'Kim', 'Concierge', 'Guest Services', 'elizabeth.kim@example.com', '+1987654321'),
(21, 'Justin', 'Harris', 'Front Desk Clerk', 'Front Desk', 'justin.harris@example.com', '+1122334455'),
(22, 'Hannah', 'Lee', 'Housekeeping', 'Housekeeping', 'hannah.lee@example.com', '+1789054321'),
(23, 'William', 'King', 'Bellhop', 'Guest Services', 'william.king@example.com', '+1432987654'),
(24, 'Taylor', 'Wright', 'Maintenance Technician', 'Maintenance', 'taylor.wright@example.com', '+1876543210'),
(25, 'Lauren', 'Green', 'Event Coordinator', 'Events', 'lauren.green@example.com', '+1247389056');



INSERT INTO Services (service_id, service_name, description, price) VALUES
(1, 'Room Cleaning', 'Daily cleaning of the guest room', 20.00),
(2, 'Laundry Service', 'Washing and ironing of clothes', 15.00),
(3, 'Room Service', 'Delivery of food and beverages to the guest room', 10.00),
(4, 'Spa Massage', 'Relaxing massage at the hotel spa', 50.00),
(5, 'Fitness Training', 'Personal training session at the fitness center', 30.00),
(6, 'Airport Shuttle', 'Transportation service to and from the airport', 25.00),
(7, 'Valet Parking', 'Convenient parking service with valet assistance', 10.00),
(8, 'Concierge Assistance', 'Assistance with reservations, recommendations, and arrangements', 0.00),
(9, 'In-Room Dining', 'Selection of meals and beverages delivered to the guest room', 20.00),
(10, 'WiFi Access', 'High-speed internet access throughout the hotel', 0.00),
(11, 'Business Center', 'Access to computers, printers, and other office equipment', 0.00),
(12, 'Swimming Pool Access', 'Access to the hotel swimming pool', 0.00),
(13, 'Sauna Session', 'Relaxing sauna session at the hotel spa', 20.00),
(14, 'Conference Room Rental', 'Rental of conference room for meetings or events', 100.00),
(15, 'Babysitting Service', 'Professional childcare service for guests with children', 20.00),
(16, 'Car Rental', 'Rental of vehicles for transportation during the stay', 50.00),
(17, 'Tour Booking', 'Arrangement of guided tours and excursions', 0.00),
(18, 'Gift Shop Purchases', 'Purchase of souvenirs and gifts from the hotel gift shop', 0.00),
(19, 'Pet Sitting Service', 'Professional pet care service for guests traveling with pets', 25.00),
(20, 'Dry Cleaning', 'Dry cleaning and pressing of clothing items', 10.00),
(21, 'Shoe Shine Service', 'Shoe shining service to keep footwear in top condition', 5.00),
(22, 'In-Room Safe Rental', 'Rental of in-room safe for storing valuable items', 5.00),
(23, 'Limousine Service', 'Luxury transportation service with a chauffeur-driven limousine', 100.00),
(24, 'Golf Course Access', 'Access to the hotel golf course for guests who enjoy golfing', 50.00),
(25, 'Photocopying Service', 'Photocopying service for documents and other materials', 0.10);




INSERT INTO Room_Services (room_service_id, reservation_id, service_id, quantity, total_price) VALUES
(1, 1, 3, 2, 20.00),
(2, 2, 9, 1, 20.00),
(3, 3, 4, 1, 50.00),
(4, 4, 1, 1, 20.00),
(5, 5, 7, 1, 10.00),
(6, 6, 2, 3, 45.00),
(7, 7, 5, 1, 30.00),
(8, 8, 8, 1, 0.00),
(9, 9, 10, 1, 0.00),
(10, 10, 14, 1, 100.00),
(11, 11, 17, 2, 0.00),
(12, 12, 21, 1, 5.00),
(13, 13, 12, 1, 0.00),
(14, 14, 19, 1, 25.00),
(15, 15, 20, 2, 20.00),
(16, 16, 6, 1, 25.00),
(17, 17, 11, 1, 0.00),
(18, 18, 3, 2, 20.00),
(19, 19, 16, 1, 50.00),
(20, 20, 22, 1, 5.00),
(21, 21, 13, 1, 20.00),
(22, 22, 18, 1, 0.00),
(23, 23, 23, 1, 100.00),
(24, 24, 24, 1, 50.00),
(25, 25, 25, 10, 1.00);



INSERT INTO Payments (payment_id, reservation_id, payment_date, amount_paid, payment_method) VALUES
(1, 1, '2024-05-05', 200.00, 'Credit Card'),
(2, 2, '2024-05-07', 300.00, 'Cash'),
(3, 3, '2024-05-06', 600.00, 'Credit Card'),
(4, 4, '2024-05-08', 1200.00, 'Credit Card'),
(5, 5, '2024-05-03', 200.00, 'Cash'),
(6, 6, '2024-05-08', 100.00, 'Credit Card'),
(7, 7, '2024-05-04', 150.00, 'Cash'),
(8, 8, '2024-05-07', 600.00, 'Credit Card'),
(9, 9, '2024-05-09', 1200.00, 'Credit Card'),
(10, 10, '2024-05-05', 400.00, 'Cash'),
(11, 11, '2024-05-10', 150.00, 'Credit Card'),
(12, 12, '2024-05-06', 300.00, 'Cash'),
(13, 13, '2024-05-09', 450.00, 'Credit Card'),
(14, 14, '2024-05-12', 900.00, 'Credit Card'),
(15, 15, '2024-05-04', 200.00, 'Cash'),
(16, 16, '2024-05-13', 200.00, 'Credit Card'),
(17, 17, '2024-05-07', 150.00, 'Cash'),
(18, 18, '2024-05-10', 450.00, 'Credit Card'),
(19, 19, '2024-05-07', 400.00, 'Cash'),
(20, 20, '2024-05-03', 200.00, 'Credit Card'),
(21, 21, '2024-05-11', 300.00, 'Cash'),
(22, 22, '2024-05-06', 150.00, 'Credit Card'),
(23, 23, '2024-05-08', 300.00, 'Cash'),
(24, 24, '2024-05-06', 400.00, 'Credit Card'),
(25, 25, '2024-05-13', 400.00, 'Cash');



select * from rooms;
select * from guests;
select * from reservations;
select * from staff;
select * from services;
select * from room_services;
select * from payments;


desc rooms;
desc guests;
desc reservations;
desc staff;
desc services;
desc room_services;
desc payments;




SELECT SUM(amount_paid) AS total_amount_paid
FROM Payments;


SELECT room_type, AVG(rate_per_night) AS average_rate_per_night
FROM Rooms
GROUP BY room_type;

SELECT COUNT(*) AS reservation_count
FROM Reservations
WHERE guest_id IN (
    SELECT guest_id
    FROM Guests
    WHERE last_name LIKE 'S%'
);

SELECT service_name, price
FROM Services
WHERE price > 20.00;


SELECT *
FROM Staff
WHERE department = 'Front Desk';



SELECT first_name, last_name
FROM Guests
WHERE guest_id IN (
    SELECT guest_id
    FROM Reservations
    WHERE total_amount > (
        SELECT AVG(total_amount)
        FROM Reservations)
);



SELECT room_number, room_type
FROM Rooms
WHERE room_id IN (
    SELECT room_id
    FROM Reservations
    WHERE payment_status = 'Paid'
);



SELECT first_name, last_name
FROM Guests
WHERE guest_id IN (
    SELECT guest_id
    FROM Reservations
    WHERE room_id IN (
        SELECT room_id
        FROM Rooms
        WHERE room_type = (
            SELECT room_type
            FROM Rooms
            ORDER BY rate_per_night DESC
            LIMIT 1)));


SELECT service_name
FROM Services
WHERE service_id IN (
    SELECT service_id
    FROM Room_Services
    WHERE reservation_id IN (
        SELECT reservation_id
        FROM Reservations
        WHERE guest_id IN (
            SELECT guest_id
            FROM Guests
            WHERE last_name = 'Martinez')));



SELECT SUM(amount_paid) AS total_amount_paid
FROM Payments
WHERE reservation_id IN (
    SELECT reservation_id
    FROM Reservations
    WHERE room_id IN (
        SELECT room_id
        FROM Rooms
        WHERE rate_per_night > (
            SELECT AVG(rate_per_night)
            FROM Rooms)));
            
            
            
            
SELECT Reservations.reservation_id, Guests.first_name, Guests.last_name
FROM Reservations
JOIN Guests ON Reservations.guest_id = Guests.guest_id;


SELECT Reservations.reservation_id, Rooms.room_number, Rooms.room_type
FROM Reservations
JOIN Rooms ON Reservations.room_id = Rooms.room_id;


SELECT Reservations.reservation_id, Payments.amount_paid, Reservations.payment_status
FROM Reservations
JOIN Payments ON Reservations.reservation_id = Payments.reservation_id;


SELECT Guests.first_name, Guests.last_name, Guests.email
FROM Guests;


SELECT Staff.first_name, Staff.last_name, Staff.position, Staff.department
FROM Staff;