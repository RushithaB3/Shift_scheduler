package com.shiftscheduler.backend.repository;

import com.shiftscheduler.backend.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.Set;

public interface UserRepository extends JpaRepository<User, Long> {

    // Search users by zone name, zip code and optional date range

    List<User> findByZone_NameAndZipCode_Code(String zoneName, String zipCode);

    List<User> findByZone_Name(String zoneName);

    List<User> findByZipCode_Code(String zipCode);

    Optional<User> findByRacfid(String racfid);

    long countByZone_Id(Long zoneId);

    long countByZipCode_IdIn(Set<Long> zipCodeIds);
}