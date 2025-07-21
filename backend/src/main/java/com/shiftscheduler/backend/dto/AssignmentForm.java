package com.shiftscheduler.backend.dto;

import java.time.LocalDate;
import java.util.List;

public class AssignmentForm {

    private List<Long> userIds;
    private List<Long> zoneIds;
    private List<Long> zipCodeIds;
    private LocalDate startDate;
    private LocalDate endDate;

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