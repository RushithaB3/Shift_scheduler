package com.shiftscheduler.backend.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
public class Shift {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Each shift is assigned to one user
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    // Zone where the shift is located
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "zone_id", nullable = false)
    private Zone zone;

    // Zip code within the zone
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "zip_code_id", nullable = false)
    private ZipCode zipCode;

    // Shift start date
    private LocalDate startDate;

    // Shift end date
    private LocalDate endDate;

    // Constructors
    public Shift() {}

    public Shift(User user, Zone zone, ZipCode zipCode, LocalDate startDate, LocalDate endDate) {
        this.user = user;
        this.zone = zone;
        this.zipCode = zipCode;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    // Getters and setters for each field
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Zone getZone() {
        return zone;
    }

    public void setZone(Zone zone) {
        this.zone = zone;
    }

    public ZipCode getZipCode() {
        return zipCode;
    }

    public void setZipCode(ZipCode zipCode) {
        this.zipCode = zipCode;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }
}
