package com.hotel.mgt.hotelmanagementsystem.controller;

import com.hotel.mgt.hotelmanagementsystem.model.Room;
import com.hotel.mgt.hotelmanagementsystem.service.RoomService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(name = "roomController", urlPatterns = {"/rooms", "/rooms/*"})
public class RoomController extends HttpServlet {
    private final RoomService roomService = new RoomService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        if (pathInfo == null || pathInfo.equals("/")) {
            // List all rooms
            request.setAttribute("rooms", roomService.getAllRooms());
            request.setAttribute("content", "room/list");
        } else if (pathInfo.equals("/available")) {
            // List available rooms
            request.setAttribute("rooms", roomService.getAvailableRooms());
            request.setAttribute("content", "room/list");
        } else if (pathInfo.equals("/new")) {
            // Show create form
            request.setAttribute("content", "room/form");
        } else if (pathInfo.startsWith("/edit/")) {
            // Show edit form
            int id = Integer.parseInt(pathInfo.substring(6));
            request.setAttribute("room", roomService.getRoomById(id));
            request.setAttribute("content", "room/form");
        }
        
        request.getRequestDispatcher("/WEB-INF/views/layout/main.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        try {
            if (pathInfo == null || pathInfo.equals("/")) {
                // Create new room
                Room room = new Room();
                populateRoom(room, request);
                roomService.addRoom(room);
                response.sendRedirect(request.getContextPath() + "/rooms");
                return;
            }
            
            if (pathInfo.startsWith("/edit/")) {
                // Update existing room
                int id = Integer.parseInt(pathInfo.substring(6));
                Room room = roomService.getRoomById(id);
                populateRoom(room, request);
                roomService.updateRoom(room);
                response.sendRedirect(request.getContextPath() + "/rooms");
                return;
            }
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            request.setAttribute("content", "room/form");
            request.getRequestDispatcher("/WEB-INF/views/layout/main.jsp").forward(request, response);
        }
    }

    private void populateRoom(Room room, HttpServletRequest request) {
        room.setRoomNumber(request.getParameter("roomNumber"));
        room.setRoomType(request.getParameter("roomType"));
        room.setPrice(new BigDecimal(request.getParameter("price")));
        room.setDescription(request.getParameter("description"));
        room.setAvailable(Boolean.parseBoolean(request.getParameter("isAvailable")));
    }
} 