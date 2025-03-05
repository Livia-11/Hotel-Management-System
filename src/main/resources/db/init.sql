-- Create Guests table
CREATE TABLE IF NOT EXISTS guests (
    guest_id INTEGER IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(200)
);

-- Create Rooms table
CREATE TABLE IF NOT EXISTS rooms (
    room_id INTEGER IDENTITY PRIMARY KEY,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    is_available BOOLEAN DEFAULT TRUE,
    description VARCHAR(500)
);

-- Create Employees table
CREATE TABLE IF NOT EXISTS employees (
    employee_id INTEGER IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    hire_date DATE NOT NULL
);

-- Create Services table
CREATE TABLE IF NOT EXISTS services (
    service_id INTEGER IDENTITY PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    price DECIMAL(10,2) NOT NULL
);

-- Create Bookings table
CREATE TABLE IF NOT EXISTS bookings (
    booking_id INTEGER IDENTITY PRIMARY KEY,
    guest_id INTEGER,
    room_id INTEGER,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
); 