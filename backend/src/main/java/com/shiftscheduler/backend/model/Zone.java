package com.shiftscheduler.backend.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "zone")
public class Zone {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    @JsonIgnore  // ❗ Prevents circular reference during JSON serialization
    @OneToMany(mappedBy = "zone", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ZipCode> zipCodes;

    // Constructors
    public Zone() {}

    public Zone(String name) {
        this.name = name;
    }

    // Getters & Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<ZipCode> getZipCodes() {
        return zipCodes;
    }

    public void setZipCodes(List<ZipCode> zipCodes) {
        this.zipCodes = zipCodes;
    }

    // Optional: for debugging/logging
    @Override
    public String toString() {
        return "Zone{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
