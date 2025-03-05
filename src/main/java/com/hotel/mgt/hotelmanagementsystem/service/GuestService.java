package com.hotel.mgt.hotelmanagementsystem.service;

import com.hotel.mgt.hotelmanagementsystem.dao.GuestDAO;
import com.hotel.mgt.hotelmanagementsystem.model.Guest;

import java.sql.SQLException;
import java.util.List;

public class GuestService {
    private final GuestDAO guestDAO;

    public GuestService() {
        this.guestDAO = new GuestDAO();
    }

    public void registerGuest(Guest guest) throws SQLException {
        // Add validation logic here
        guestDAO.save(guest);
    }

    public Guest getGuestById(int id) throws SQLException {
        return guestDAO.findById(id);
    }

    public List<Guest> getAllGuests() throws SQLException {
        return guestDAO.findAll();
    }
} 