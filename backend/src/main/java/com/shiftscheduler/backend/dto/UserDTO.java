package com.shiftscheduler.backend.dto;

import com.shiftscheduler.backend.model.Shift;
import com.shiftscheduler.backend.model.User;

import java.time.LocalDate;

public class UserDTO {
    private Long id;
    private String racfid;
    private String title; // New field
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber; // New field
    private String zone;
    private String zip;
    private Double latitude;
    private Double longitude;

    private LocalDate startDate;
    private LocalDate endDate;

    public UserDTO(User user) {
        this(user, null);
    }

    public UserDTO(User user, Shift shift) {
        this.id = user.getId();
        this.racfid = user.getRacfid();
        this.title = user.getTitle(); // New
        this.firstName = user.getFirstName();
        this.lastName = user.getLastName();
        this.email = user.getEmail();
        this.phoneNumber = user.getPhoneNumber(); // New
        this.zone = user.getZone() != null ? user.getZone().getName() : null;
        this.zip = user.getZipCode() != null ? user.getZipCode().getCode() : null;
        this.latitude = user.getLatitude();
        this.longitude = user.getLongitude();

        if (shift != null) {
            this.startDate = shift.getStartDate();
            this.endDate = shift.getEndDate();
        }
    }

    public Long getId() {
        return id;
    }

    public String getRacfid() {
        return racfid;
    }

    public String getTitle() {
        return title;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getZone() {
        return zone;
    }

    public String getZip() {
        return zip;
    }

    public Double getLatitude() {
        return latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }
}