package com.hotel.mgt.hotelmanagementsystem.model;

public class Room {
    private int roomId;
    private String roomNumber;
    private String roomType;
    private double price;
    private boolean isAvailable;
    private String description;

    // Constructors
    public Room() {}

    public Room(int roomId, String roomNumber, String roomType, double price, boolean isAvailable, String description) {
        this.roomId = roomId;
        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.price = price;
        this.isAvailable = isAvailable;
        this.description = description;
    }

    // Getters and Setters
    public int getRoomId() { return roomId; }
    public void setRoomId(int roomId) { this.roomId = roomId; }
    
    public String getRoomNumber() { return roomNumber; }
    public void setRoomNumber(String roomNumber) { this.roomNumber = roomNumber; }
    
    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }
    
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    
    public boolean isAvailable() { return isAvailable; }
    public void setAvailable(boolean available) { isAvailable = available; }
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
} 