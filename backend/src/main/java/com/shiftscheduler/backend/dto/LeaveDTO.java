package com.shiftscheduler.backend.dto;

import com.shiftscheduler.backend.model.Leave;
import java.time.LocalDate;

public class LeaveDTO {
    private String racfid;
    private String title;
    private String name;
    private String email;
    private LocalDate fromDate;
    private LocalDate toDate;

    public LeaveDTO(Leave leave) {
        this.racfid = leave.getUser().getRacfid();
        this.title = leave.getUser().getTitle();
        this.name = leave.getUser().getFirstName() + " " + leave.getUser().getLastName();
        this.email = leave.getUser().getEmail();
        this.fromDate = leave.getFromDate();
        this.toDate = leave.getToDate();
    }

    // Getters
    public String getRacfid() {
        return racfid;
    }

    public String getTitle() {
        return title;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public LocalDate getFromDate() {
        return fromDate;
    }

    public LocalDate getToDate() {
        return toDate;
    }
}