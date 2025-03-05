package com.hotel.mgt.hotelmanagementsystem.model;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "rooms")
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "room_id")
    private int roomId;

    @Column(name = "room_number", unique = true, nullable = false)
    private String roomNumber;

    @Column(name = "room_type", nullable = false)
    private String roomType;

    @Column(nullable = false)
    private BigDecimal price;

    @Column(name = "is_available")
    private boolean isAvailable = true;

    private String description;

    // Constructors
    public Room() {}

    public Room(String roomNumber, String roomType, BigDecimal price, String description) {
        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.price = price;
        this.description = description;
    }

    // Getters and Setters
    public int getRoomId() { return roomId; }
    public void setRoomId(int roomId) { this.roomId = roomId; }
    
    public String getRoomNumber() { return roomNumber; }
    public void setRoomNumber(String roomNumber) { this.roomNumber = roomNumber; }
    
    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }
    
    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }
    
    public boolean isAvailable() { return isAvailable; }
    public void setAvailable(boolean available) { isAvailable = available; }
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
} 