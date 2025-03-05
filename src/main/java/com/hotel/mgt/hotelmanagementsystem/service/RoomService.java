package com.hotel.mgt.hotelmanagementsystem.service;

import com.hotel.mgt.hotelmanagementsystem.dao.RoomDAO;
import com.hotel.mgt.hotelmanagementsystem.model.Room;
import java.math.BigDecimal;
import java.util.List;

public class RoomService {
    private final RoomDAO roomDAO;

    public RoomService() {
        this.roomDAO = new RoomDAO();
    }

    public void addRoom(Room room) {
        // Validation
        if (room.getRoomNumber() == null || room.getRoomNumber().trim().isEmpty()) {
            throw new IllegalArgumentException("Room number is required");
        }
        if (room.getRoomType() == null || room.getRoomType().trim().isEmpty()) {
            throw new IllegalArgumentException("Room type is required");
        }
        if (room.getPrice() == null || room.getPrice().compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Valid price is required");
        }

        roomDAO.save(room);
    }

    public Room getRoomById(int id) {
        return roomDAO.findById(id);
    }

    public List<Room> getAllRooms() {
        return roomDAO.findAll();
    }

    public List<Room> getAvailableRooms() {
        return roomDAO.findAvailableRooms();
    }

    public void updateRoom(Room room) {
        if (room.getRoomId() <= 0) {
            throw new IllegalArgumentException("Invalid room ID");
        }
        roomDAO.update(room);
    }

    public void deleteRoom(Room room) {
        roomDAO.delete(room);
    }
} 