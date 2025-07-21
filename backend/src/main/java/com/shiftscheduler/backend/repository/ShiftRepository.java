package com.shiftscheduler.backend.repository;

import com.shiftscheduler.backend.model.Shift;
import com.shiftscheduler.backend.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

public interface ShiftRepository extends JpaRepository<Shift, Long> {

    List<Shift> findByUserRacfid(String racfid);

    List<Shift> findByUser(User user);

    List<Shift> findByZone_NameAndZipCode_Code(String zoneName, String zipCode);

    List<Shift> findByZone_IdAndZipCode_IdAndStartDateLessThanEqualAndEndDateGreaterThanEqual(
            Long zoneId,
            Long zipCodeId,
            LocalDate endDate,
            LocalDate startDate);

    List<Shift> findAllByOrderByLastModifiedDesc();

    long countByZone_Id(Long zoneId);

    long countByZipCode_IdIn(Set<Long> zipCodeIds);
}