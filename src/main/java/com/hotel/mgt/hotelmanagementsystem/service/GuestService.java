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

    public void registerGuest(Guest guest) {
        // Add validation logic here
        if (guest.getEmail() == null || guest.getEmail().trim().isEmpty()) {
            throw new IllegalArgumentException("Email is required");
        }
        if (guest.getFirstName() == null || guest.getFirstName().trim().isEmpty()) {
            throw new IllegalArgumentException("First name is required");
        }
        if (guest.getLastName() == null || guest.getLastName().trim().isEmpty()) {
            throw new IllegalArgumentException("Last name is required");
        }
        
        guestDAO.save(guest);
    }

    public Guest getGuestById(int id) {
        return guestDAO.findById(id);
    }

    public List<Guest> getAllGuests() {
        return guestDAO.findAll();
    }

    public void updateGuest(Guest guest) {
        // Add validation logic here
        if (guest.getGuestId() <= 0) {
            throw new IllegalArgumentException("Invalid guest ID");
        }
        guestDAO.update(guest);
    }

    public void deleteGuest(Guest guest) {
        guestDAO.delete(guest);
    }
} 