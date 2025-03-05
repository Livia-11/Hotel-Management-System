package com.hotel.mgt.hotelmanagementsystem.service;

import com.hotel.mgt.hotelmanagementsystem.dao.BookingDAO;
import com.hotel.mgt.hotelmanagementsystem.model.Booking;
import java.time.LocalDate;
import java.util.List;

public class BookingService {
    private final BookingDAO bookingDAO;

    public BookingService() {
        this.bookingDAO = new BookingDAO();
    }

    public void createBooking(Booking booking) {
        // Validation
        if (booking.getGuest() == null) {
            throw new IllegalArgumentException("Guest information is required");
        }
        if (booking.getRoom() == null) {
            throw new IllegalArgumentException("Room information is required");
        }
        if (booking.getCheckInDate() == null || booking.getCheckOutDate() == null) {
            throw new IllegalArgumentException("Check-in and check-out dates are required");
        }
        if (booking.getCheckInDate().isAfter(booking.getCheckOutDate())) {
            throw new IllegalArgumentException("Check-in date must be before check-out date");
        }
        if (booking.getCheckInDate().isBefore(LocalDate.now())) {
            throw new IllegalArgumentException("Check-in date cannot be in the past");
        }

        booking.setStatus("PENDING");
        bookingDAO.save(booking);
    }

    public Booking getBookingById(int id) {
        return bookingDAO.findById(id);
    }

    public List<Booking> getAllBookings() {
        return bookingDAO.findAll();
    }

    public List<Booking> getBookingsByDateRange(LocalDate startDate, LocalDate endDate) {
        return bookingDAO.findBookingsByDateRange(startDate, endDate);
    }

    public void updateBooking(Booking booking) {
        if (booking.getBookingId() <= 0) {
            throw new IllegalArgumentException("Invalid booking ID");
        }
        bookingDAO.update(booking);
    }

    public void cancelBooking(Booking booking) {
        booking.setStatus("CANCELLED");
        bookingDAO.update(booking);
    }
} 