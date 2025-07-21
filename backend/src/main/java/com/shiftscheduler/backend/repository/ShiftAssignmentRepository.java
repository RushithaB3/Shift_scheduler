// File: src/main/java/com/shiftscheduler/backend/repository/ShiftAssignmentRepository.java
package com.shiftscheduler.backend.repository;

import com.shiftscheduler.backend.model.ShiftAssignment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ShiftAssignmentRepository extends JpaRepository<ShiftAssignment, Long> {
}