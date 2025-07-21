// File: src/main/java/com/shiftscheduler/backend/repository/BulkShiftRepository.java
package com.shiftscheduler.backend.repository;

import com.shiftscheduler.backend.model.BulkShift;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BulkShiftRepository extends JpaRepository<BulkShift, Long> {
}