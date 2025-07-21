package com.shiftscheduler.backend.service;

import com.shiftscheduler.backend.model.ZipCode;
import com.shiftscheduler.backend.model.Zone;
import com.shiftscheduler.backend.repository.LeaveRepository;
import com.shiftscheduler.backend.repository.ShiftRepository;
import com.shiftscheduler.backend.repository.UserRepository;
import com.shiftscheduler.backend.repository.ZipCodeRepository;
import com.shiftscheduler.backend.repository.ZoneRepository;

//import org.springframework.cglib.core.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
//import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class ZoneService {

    private final ZoneRepository zoneRepository;
    private final ZipCodeRepository zipCodeRepository;
    private final UserRepository userRepository;
    private final ShiftRepository shiftRepository;
    private final LeaveRepository leaveRepository;

    public ZoneService(ZoneRepository zoneRepository,
            ZipCodeRepository zipCodeRepository,
            UserRepository userRepository,
            ShiftRepository shiftRepository,
            LeaveRepository leaveRepository) {
        this.zoneRepository = zoneRepository;
        this.zipCodeRepository = zipCodeRepository;
        this.userRepository = userRepository;
        this.shiftRepository = shiftRepository;
        this.leaveRepository = leaveRepository;
    }

    public List<Zone> getAllZones() {
        return zoneRepository.findAll();
    }

    public Optional<Zone> getZoneById(Long id) {
        return zoneRepository.findById(id);
    }

    @Transactional
    public Zone saveZone(Zone zoneForm, Set<Long> zipCodeIds) {
        // Check for duplicate name
        Optional<Zone> existingWithName = zoneRepository.findByName(zoneForm.getName());
        if (existingWithName.isPresent() && !existingWithName.get().getId().equals(zoneForm.getId())) {
            throw new IllegalArgumentException("Zone name already exists.");
        }

        Zone zoneToSave;
        if (zoneForm.getId() != null) {
            // Update existing zone
            zoneToSave = zoneRepository.findById(zoneForm.getId())
                    .orElseThrow(() -> new IllegalArgumentException("Zone not found."));
            zoneToSave.setName(zoneForm.getName());
            List<ZipCode> oldZipCode = zoneToSave.getZipCodes();
            // Clear existing zip codes assignments
            if (!org.springframework.util.CollectionUtils.isEmpty(oldZipCode)) {
                zoneToSave.getZipCodes().forEach(zc -> zc.setZone(null));
                // zipCodeRepository.saveAll(zoneToSave.getZipCodes());
                zoneToSave.getZipCodes().clear(); // Clear the collection for consistency
            }
        } else {
            // New zone
            zoneToSave = new Zone(zoneForm.getName());
        }

        // Assign new zip codes if provided
        if (zipCodeIds != null && !zipCodeIds.isEmpty()) {
            List<ZipCode> zipCodes = zipCodeRepository.findAllById(zipCodeIds);
            zipCodes.forEach(zc -> zc.setZone(zoneToSave));
            zoneToSave.setZipCodes(zipCodes);
        } else {
            // Ensure the list is initialized but empty if no zip codes
            zoneToSave.setZipCodes(new ArrayList<>());
        }

        return zoneRepository.save(zoneToSave);
    }

    public void deleteZone(Long id) {
        Optional<Zone> zoneOpt = zoneRepository.findById(id);
        if (zoneOpt.isEmpty()) {
            throw new IllegalArgumentException("Zone not found.");
        }
        Zone zone = zoneOpt.get();

        // Check direct references to zone
        if (userRepository.countByZone_Id(id) > 0 ||
                shiftRepository.countByZone_Id(id) > 0 ||
                leaveRepository.countByZone_Id(id) > 0) {
            throw new IllegalStateException("Cannot delete zone as it is referenced by users, shifts, or leaves.");
        }

        // Check references to associated zip codes (merged condition to avoid nesting)
        Set<Long> zipIds = zone.getZipCodes().stream().map(ZipCode::getId).collect(Collectors.toSet());
        if (!zipIds.isEmpty() &&
                (userRepository.countByZipCode_IdIn(zipIds) > 0 ||
                        shiftRepository.countByZipCode_IdIn(zipIds) > 0 ||
                        leaveRepository.countByZipCode_IdIn(zipIds) > 0)) {
            throw new IllegalStateException(
                    "Cannot delete zone as its zip codes are referenced by users, shifts, or leaves.");
        }

        zoneRepository.deleteById(id);
    }
}