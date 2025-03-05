package com.hotel.mgt.hotelmanagementsystem.controller;

import com.hotel.mgt.hotelmanagementsystem.model.Booking;
import com.hotel.mgt.hotelmanagementsystem.model.Guest;
import com.hotel.mgt.hotelmanagementsystem.model.Room;
import com.hotel.mgt.hotelmanagementsystem.service.BookingService;
import com.hotel.mgt.hotelmanagementsystem.service.GuestService;
import com.hotel.mgt.hotelmanagementsystem.service.RoomService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@WebServlet(name = "bookingController", urlPatterns = {"/bookings", "/bookings/*"})
public class BookingController extends HttpServlet {
    private final BookingService bookingService = new BookingService();
    private final GuestService guestService = new GuestService();
    private final RoomService roomService = new RoomService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        if (pathInfo == null || pathInfo.equals("/")) {
            // List all bookings
            request.setAttribute("bookings", bookingService.getAllBookings());
            request.setAttribute("content", "booking/list");
        } else if (pathInfo.equals("/new")) {
            // Show create form
            request.setAttribute("guests", guestService.getAllGuests());
            request.setAttribute("rooms", roomService.getAvailableRooms());
            request.setAttribute("content", "booking/form");
        } else if (pathInfo.startsWith("/edit/")) {
            // Show edit form
            int id = Integer.parseInt(pathInfo.substring(6));
            request.setAttribute("booking", bookingService.getBookingById(id));
            request.setAttribute("guests", guestService.getAllGuests());
            request.setAttribute("rooms", roomService.getAllRooms());
            request.setAttribute("content", "booking/form");
        }
        
        request.getRequestDispatcher("/WEB-INF/views/layout/main.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        try {
            if (pathInfo == null || pathInfo.equals("/")) {
                // Create new booking
                Booking booking = new Booking();
                populateBooking(booking, request);
                bookingService.createBooking(booking);
                response.sendRedirect(request.getContextPath() + "/bookings");
                return;
            }
            
            if (pathInfo.startsWith("/edit/")) {
                // Update existing booking
                int id = Integer.parseInt(pathInfo.substring(6));
                Booking booking = bookingService.getBookingById(id);
                populateBooking(booking, request);
                bookingService.updateBooking(booking);
                response.sendRedirect(request.getContextPath() + "/bookings");
                return;
            }

            if (pathInfo.startsWith("/cancel/")) {
                // Cancel booking
                int id = Integer.parseInt(pathInfo.substring(8));
                Booking booking = bookingService.getBookingById(id);
                bookingService.cancelBooking(booking);
                response.sendRedirect(request.getContextPath() + "/bookings");
                return;
            }
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            request.setAttribute("guests", guestService.getAllGuests());
            request.setAttribute("rooms", roomService.getAllRooms());
            request.setAttribute("content", "booking/form");
            request.getRequestDispatcher("/WEB-INF/views/layout/main.jsp").forward(request, response);
        }
    }

    private void populateBooking(Booking booking, HttpServletRequest request) {
        Guest guest = guestService.getGuestById(Integer.parseInt(request.getParameter("guestId")));
        Room room = roomService.getRoomById(Integer.parseInt(request.getParameter("roomId")));
        LocalDate checkInDate = LocalDate.parse(request.getParameter("checkInDate"));
        LocalDate checkOutDate = LocalDate.parse(request.getParameter("checkOutDate"));
        
        booking.setGuest(guest);
        booking.setRoom(room);
        booking.setCheckInDate(checkInDate);
        booking.setCheckOutDate(checkOutDate);
        
        // Calculate total price based on number of nights and room price
        long nights = ChronoUnit.DAYS.between(checkInDate, checkOutDate);
        BigDecimal totalPrice = room.getPrice().multiply(BigDecimal.valueOf(nights));
        booking.setTotalPrice(totalPrice);
    }
} 