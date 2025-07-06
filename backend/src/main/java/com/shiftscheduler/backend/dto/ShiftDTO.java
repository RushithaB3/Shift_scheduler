package com.shiftscheduler.backend.dto;

import com.shiftscheduler.backend.model.Shift;
import com.shiftscheduler.backend.model.User;

public class ShiftDTO {
    private Long id;
    private String startDate;
    private String endDate;
    private Long userId;
    private String firstName;
    private String lastName;
    private String email;
    private Double latitude;
    private Double longitude;
    private String zoneName;
    private String zipCode;

    public ShiftDTO(Shift shift) {
        this.id = shift.getId();
        this.startDate = shift.getStartDate().toString();
        this.endDate = shift.getEndDate().toString();

        User user = shift.getUser();
        if (user != null) {
            this.userId = user.getId();
            this.firstName = user.getFirstName();
            this.lastName = user.getLastName();
            this.email = user.getEmail();
            this.latitude = user.getLatitude();
            this.longitude = user.getLongitude();
            this.zoneName = user.getZone() != null ? user.getZone().getName() : null;
            this.zipCode = user.getZipCode() != null ? user.getZipCode().getCode() : null;
        }
    }

    // Getters
    public Long getId() { return id; }
    public String getStartDate() { return startDate; }
    public String getEndDate() { return endDate; }
    public Long getUserId() { return userId; }
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public String getEmail() { return email; }
    public Double getLatitude() { return latitude; }
    public Double getLongitude() { return longitude; }
    public String getZoneName() { return zoneName; }
    public String getZipCode() { return zipCode; }
}
