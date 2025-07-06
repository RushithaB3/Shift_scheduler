package com.shiftscheduler.backend.controller;

import com.shiftscheduler.backend.dto.UserDTO;
import com.shiftscheduler.backend.model.Shift;
import com.shiftscheduler.backend.model.User;
import com.shiftscheduler.backend.repository.ShiftRepository;
import com.shiftscheduler.backend.repository.UserRepository;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/users")
public class UserApiController {

    private final UserRepository userRepo;
    private final ShiftRepository shiftRepo;

    public UserApiController(UserRepository userRepo, ShiftRepository shiftRepo) {
        this.userRepo = userRepo;
        this.shiftRepo = shiftRepo;
    }

    @GetMapping
    public ResponseEntity<List<UserDTO>> getFilteredUsers(
            @RequestParam(required = false) Long id,
            @RequestParam(required = false) Long zone,
            @RequestParam(required = false) Long zip,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        // Handle ID-only request
        if (id != null) {
            Optional<User> userOpt = userRepo.findById(id);
            if (userOpt.isPresent()) {
                User user = userOpt.get();
                List<Shift> shifts = shiftRepo.findByUser(user);
                if (shifts.isEmpty()) {
                    return ResponseEntity.ok(List.of(new UserDTO(user))); // fallback if no shifts
                } else {
                    return ResponseEntity.ok(
                            shifts.stream()
                                    .map(s -> new UserDTO(user, s))
                                    .distinct()
                                    .collect(Collectors.toList()));
                }
            } else {
                return ResponseEntity.ok(List.of()); // empty list for invalid ID
            }
        }

        // filters only
        if (zone == null && zip == null && startDate == null && endDate == null) {
            return ResponseEntity.ok(
                    userRepo.findAll().stream()
                            .map(UserDTO::new)
                            .collect(Collectors.toList()));
        }

        List<Shift> filteredShifts;

        if (zone != null && zip != null && startDate != null && endDate != null) {
            filteredShifts = shiftRepo.findByZone_IdAndZipCode_IdAndStartDateLessThanEqualAndEndDateGreaterThanEqual(
                    zone, zip, endDate, startDate);
        } else {
            filteredShifts = shiftRepo.findAll();

            if (zone != null) {
                filteredShifts = filteredShifts.stream()
                        .filter(s -> s.getZone() != null && s.getZone().getId().equals(zone))
                        .collect(Collectors.toList());
            }

            if (zip != null) {
                filteredShifts = filteredShifts.stream()
                        .filter(s -> s.getZipCode() != null && s.getZipCode().getId().equals(zip))
                        .collect(Collectors.toList());
            }

            if (startDate != null) {
                filteredShifts = filteredShifts.stream()
                        .filter(s -> s.getEndDate() != null && !s.getEndDate().isBefore(startDate))
                        .collect(Collectors.toList());
            }

            if (endDate != null) {
                filteredShifts = filteredShifts.stream()
                        .filter(s -> s.getStartDate() != null && !s.getStartDate().isAfter(endDate))
                        .collect(Collectors.toList());
            }
        }

        return ResponseEntity.ok(
                filteredShifts.stream()
                        .filter(shift -> shift.getUser() != null)
                        .map(shift -> new UserDTO(shift.getUser(), shift))
                        .distinct()
                        .collect(Collectors.toList()));
    }
}
