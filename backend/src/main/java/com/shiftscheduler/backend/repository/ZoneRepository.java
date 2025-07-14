package com.shiftscheduler.backend.repository;

import com.shiftscheduler.backend.model.Zone;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ZoneRepository extends JpaRepository<Zone, Long> {

    // Find a zone by its name
    Optional<Zone> findByName(String name);
}