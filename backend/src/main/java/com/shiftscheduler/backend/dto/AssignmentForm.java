package com.shiftscheduler.backend.dto;

import java.time.LocalDate;
import java.util.List;

public class AssignmentForm {

    private List<Long> userIds;
    private List<Long> zoneIds; // Changed to List to support multiple zones
    private List<Long> zipCodeIds; // null or empty for all zipcodes
    private LocalDate startDate; // Per-group date if sameDates is false
    private LocalDate endDate; // Per-group date if sameDates is false

    // Getters and Setters
    public List<Long> getUserIds() {
        return userIds;
    }

    public void setUserIds(List<Long> userIds) {
        this.userIds = userIds;
    }

    public List<Long> getZoneIds() {
        return zoneIds;
    }

    public void setZoneIds(List<Long> zoneIds) {
        this.zoneIds = zoneIds;
    }

    public List<Long> getZipCodeIds() {
        return zipCodeIds;
    }

    public void setZipCodeIds(List<Long> zipCodeIds) {
        this.zipCodeIds = zipCodeIds;
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