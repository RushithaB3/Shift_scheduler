package com.shiftscheduler.backend.dto;

public class ZipCodeDTO {
    private Long id;
    private String code;

    public ZipCodeDTO(Long id, String code) {
        this.id = id;
        this.code = code;
    }

    public Long getId() {
        return id;
    }

    public String getCode() {
        return code;
    }
}
