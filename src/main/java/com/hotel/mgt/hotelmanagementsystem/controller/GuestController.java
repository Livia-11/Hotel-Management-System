package com.hotel.mgt.hotelmanagementsystem.controller;

import com.hotel.mgt.hotelmanagementsystem.model.Guest;
import com.hotel.mgt.hotelmanagementsystem.service.GuestService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "guestController", urlPatterns = {"/guests", "/guests/*"})
public class GuestController extends HttpServlet {
    private final GuestService guestService = new GuestService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        if (pathInfo == null || pathInfo.equals("/")) {
            // List all guests
            request.setAttribute("guests", guestService.getAllGuests());
            request.setAttribute("content", "guest/list");
        } else if (pathInfo.equals("/new")) {
            // Show create form
            request.setAttribute("content", "guest/form");
        } else if (pathInfo.startsWith("/edit/")) {
            // Show edit form
            int id = Integer.parseInt(pathInfo.substring(6));
            request.setAttribute("guest", guestService.getGuestById(id));
            request.setAttribute("content", "guest/form");
        }
        
        request.getRequestDispatcher("/WEB-INF/views/layout/main.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        try {
            if (pathInfo == null || pathInfo.equals("/")) {
                // Create new guest
                Guest guest = new Guest();
                populateGuest(guest, request);
                guestService.registerGuest(guest);
                response.sendRedirect(request.getContextPath() + "/guests");
                return;
            }
            
            if (pathInfo.startsWith("/edit/")) {
                // Update existing guest
                int id = Integer.parseInt(pathInfo.substring(6));
                Guest guest = guestService.getGuestById(id);
                populateGuest(guest, request);
                guestService.updateGuest(guest);
                response.sendRedirect(request.getContextPath() + "/guests");
                return;
            }
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            request.setAttribute("content", "guest/form");
            request.getRequestDispatcher("/WEB-INF/views/layout/main.jsp").forward(request, response);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        if (pathInfo != null && pathInfo.startsWith("/")) {
            int id = Integer.parseInt(pathInfo.substring(1));
            Guest guest = guestService.getGuestById(id);
            if (guest != null) {
                guestService.deleteGuest(guest);
                response.setStatus(HttpServletResponse.SC_OK);
                return;
            }
        }
        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
    }

    private void populateGuest(Guest guest, HttpServletRequest request) {
        guest.setFirstName(request.getParameter("firstName"));
        guest.setLastName(request.getParameter("lastName"));
        guest.setEmail(request.getParameter("email"));
        guest.setPhone(request.getParameter("phone"));
        guest.setAddress(request.getParameter("address"));
    }
} 