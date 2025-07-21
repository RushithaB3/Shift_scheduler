package com.shiftscheduler.backend.repository;

import com.shiftscheduler.backend.model.Leave;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

public interface LeaveRepository extends JpaRepository<Leave, Long> {

        // Find all leaves for a specific user
        List<Leave> findByUserRacfid(String racfid);

        // Find leaves overlapping with a specific date range
        List<Leave> findByUserRacfidAndFromDateLessThanEqualAndToDateGreaterThanEqual(
                        String racfid, LocalDate end, LocalDate start);

        // Used for Dashboard Filtering

        // Filter by zone only
        List<Leave> findByZone_Id(Long zoneId);

        // Filter by zone and zip code
        List<Leave> findByZone_IdAndZipCode_Id(Long zoneId, Long zipCodeId);

        // Filter by zone, zip code, and date range
        List<Leave> findByZone_IdAndZipCode_IdAndFromDateGreaterThanEqualAndToDateLessThanEqual(
                        Long zoneId, Long zipCodeId, LocalDate startDate, LocalDate endDate);

        long countByZone_Id(Long zoneId);

        long countByZipCode_IdIn(Set<Long> zipCodeIds);
}