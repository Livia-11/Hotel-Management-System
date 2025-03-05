package com.hotel.mgt.hotelmanagementsystem.config;

import jakarta.servlet.ServletContextListener;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.annotation.WebListener;

import java.sql.Connection;
import java.sql.Statement;

@WebListener
public class DatabaseInitializer implements ServletContextListener {
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try (Connection conn = DatabaseConfig.getConnection();
             Statement stmt = conn.createStatement()) {
            
            // Create tables
            stmt.execute("""
                CREATE TABLE IF NOT EXISTS guests (
                    guest_id INTEGER IDENTITY PRIMARY KEY,
                    first_name VARCHAR(50) NOT NULL,
                    last_name VARCHAR(50) NOT NULL,
                    email VARCHAR(100) UNIQUE NOT NULL,
                    phone VARCHAR(20),
                    address VARCHAR(200)
                )
            """);

            stmt.execute("""
                CREATE TABLE IF NOT EXISTS rooms (
                    room_id INTEGER IDENTITY PRIMARY KEY,
                    room_number VARCHAR(10) UNIQUE NOT NULL,
                    room_type VARCHAR(50) NOT NULL,
                    price DECIMAL(10,2) NOT NULL,
                    is_available BOOLEAN DEFAULT TRUE,
                    description VARCHAR(500)
                )
            """);

            // Add sample data
            stmt.execute("""
                MERGE INTO rooms USING (VALUES 'default') ON (1=0)
                WHEN NOT MATCHED THEN
                INSERT (room_number, room_type, price, description)
                VALUES ('101', 'Deluxe', 200.00, 'Spacious room with city view'),
                       ('102', 'Standard', 100.00, 'Comfortable room for budget travelers'),
                       ('201', 'Executive', 150.00, 'Business-class accommodation')
            """);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
} 