package com.shiftscheduler.backend.dto;

import java.time.LocalDate;
import java.util.List;

public class BulkShiftForm {

    private LocalDate startDate;
    private LocalDate endDate;
    private boolean sameDates;
    private List<AssignmentForm> assignments;

    // Getters and Setters
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

    public boolean isSameDates() {
        return sameDates;
    }

    public void setSameDates(boolean sameDates) {
        this.sameDates = sameDates;
    }

    public List<AssignmentForm> getAssignments() {
        return assignments;
    }

    public void setAssignments(List<AssignmentForm> assignments) {
        this.assignments = assignments;
    }
}