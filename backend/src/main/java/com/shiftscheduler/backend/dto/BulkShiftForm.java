package com.shiftscheduler.backend.dto;

import java.time.LocalDate;
import java.util.List;

public class BulkShiftForm {

    private LocalDate startDate; // Used if sameDates is true
    private LocalDate endDate; // Used if sameDates is true
    private boolean sameDates; // Indicates if dates are shared across groups
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