package com.shiftscheduler.backend.dto;

import com.shiftscheduler.backend.model.Shift;
import com.shiftscheduler.backend.model.User;

import java.time.LocalDate;

public class UserDTO {
    private Long userId;
    private String firstName;
    private String lastName;
    private String email;
    private String zone;
    private String zip;
    private Double latitude;
    private Double longitude;

    private LocalDate startDate;  // NEW
    private LocalDate endDate;    // NEW

    public UserDTO(User user) {
        this(user, null); // fallback if no shift
    }

    public UserDTO(User user, Shift shift) {
        this.userId = user.getId();
        this.firstName = user.getFirstName();
        this.lastName = user.getLastName();
        this.email = user.getEmail();
        this.zone = user.getZone() != null ? user.getZone().getName() : null;
        this.zip = user.getZipCode() != null ? user.getZipCode().getCode() : null;
        this.latitude = user.getLatitude();
        this.longitude = user.getLongitude();

        // Only set dates if shift was provided
        if (shift != null) {
            this.startDate = shift.getStartDate();
            this.endDate = shift.getEndDate();
        }
    }

    // Getters (add these to support JSON serialization)
    public Long getUserId() { return userId; }
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public String getEmail() { return email; }
    public String getZone() { return zone; }
    public String getZip() { return zip; }
    public Double getLatitude() { return latitude; }
    public Double getLongitude() { return longitude; }
    public LocalDate getStartDate() { return startDate; }
    public LocalDate getEndDate() { return endDate; }
}
