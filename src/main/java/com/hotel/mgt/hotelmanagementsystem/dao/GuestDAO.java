package com.hotel.mgt.hotelmanagementsystem.dao;

import com.hotel.mgt.hotelmanagementsystem.model.Guest;
import com.hotel.mgt.hotelmanagementsystem.config.DatabaseConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GuestDAO {
    public void save(Guest guest) throws SQLException {
        String sql = "INSERT INTO guests (first_name, last_name, email, phone, address) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, guest.getFirstName());
            stmt.setString(2, guest.getLastName());
            stmt.setString(3, guest.getEmail());
            stmt.setString(4, guest.getPhone());
            stmt.setString(5, guest.getAddress());
            
            stmt.executeUpdate();
        }
    }

    public Guest findById(int id) throws SQLException {
        String sql = "SELECT * FROM guests WHERE guest_id = ?";
        
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return extractGuestFromResultSet(rs);
                }
            }
        }
        return null;
    }

    public List<Guest> findAll() throws SQLException {
        List<Guest> guests = new ArrayList<>();
        String sql = "SELECT * FROM guests";
        
        try (Connection conn = DatabaseConfig.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                guests.add(extractGuestFromResultSet(rs));
            }
        }
        return guests;
    }

    private Guest extractGuestFromResultSet(ResultSet rs) throws SQLException {
        Guest guest = new Guest();
        guest.setGuestId(rs.getInt("guest_id"));
        guest.setFirstName(rs.getString("first_name"));
        guest.setLastName(rs.getString("last_name"));
        guest.setEmail(rs.getString("email"));
        guest.setPhone(rs.getString("phone"));
        guest.setAddress(rs.getString("address"));
        return guest;
    }
} 