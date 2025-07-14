package com.shiftscheduler.backend.repository;

import com.shiftscheduler.backend.model.ZipCode;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ZipCodeRepository extends JpaRepository<ZipCode, Long> {

    // Find all zip codes that belong to a specific zone by zone ID
    List<ZipCode> findByZoneId(Long zoneId);

    // Optional: find zip codes by zone name
    List<ZipCode> findByZone_Name(String zoneName);
}