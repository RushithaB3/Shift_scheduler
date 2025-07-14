package com.shiftscheduler.backend.model;

import jakarta.persistence.*;

@Entity
public class ZipCode {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // This is the actual zip code, stored as a string
    private String code;

    // Each zip code is linked to one zone
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "zone_id", nullable = false)
    private Zone zone;

    // Default constructor
    public ZipCode() {
    }

    // Constructor with parameters
    public ZipCode(String code, Zone zone) {
        this.code = code;
        this.zone = zone;
    }

    // Getter for ID
    public Long getId() {
        return id;
    }

    // Setter for ID
    public void setId(Long id) {
        this.id = id;
    }

    // Getter for code (zip code string)
    public String getCode() {
        return code;
    }

    // Setter for code
    public void setCode(String code) {
        this.code = code;
    }

    // Getter for zone (the zone this zip code belongs to)
    public Zone getZone() {
        return zone;
    }

    // Setter for zone
    public void setZone(Zone zone) {
        this.zone = zone;
    }
}