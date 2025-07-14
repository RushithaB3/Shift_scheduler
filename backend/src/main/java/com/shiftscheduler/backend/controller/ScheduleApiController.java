package com.shiftscheduler.backend.controller;

import com.shiftscheduler.backend.dto.ShiftDTO;
import com.shiftscheduler.backend.dto.UserDTO;
import com.shiftscheduler.backend.model.*;
import com.shiftscheduler.backend.repository.*;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
public class ScheduleApiController {

    private final UserRepository userRepo;
    private final ShiftRepository shiftRepo;
    private final LeaveRepository leaveRepo;
    private final ZoneRepository zoneRepo;

    public ScheduleApiController(UserRepository userRepo,
            ShiftRepository shiftRepo,
            LeaveRepository leaveRepo,
            ZoneRepository zoneRepo) {
        this.userRepo = userRepo;
        this.shiftRepo = shiftRepo;
        this.leaveRepo = leaveRepo;
        this.zoneRepo = zoneRepo;
    }

    // ========== USERS ==========

    // Get full user info by ID
    @GetMapping("/users/{id}")
    public ResponseEntity<UserDTO> getUserById(@PathVariable Long id) {
        return userRepo.findById(id)
                .map(user -> ResponseEntity.ok(new UserDTO(user)))
                .orElse(ResponseEntity.notFound().build());
    }

    // ========== SHIFTS ==========

    // View shifts by user ID
    @GetMapping("/shifts/user/{racfid}")
    public List<ShiftDTO> getShiftsByUser(@PathVariable String racfid) {
        return shiftRepo.findByUserRacfid(racfid).stream()
                .map(ShiftDTO::new)
                .collect(Collectors.toList());
    }

    // Save or update a shift
    @PostMapping("/shifts")
    public ResponseEntity<String> saveShift(@RequestBody Shift shift) {
        Optional<User> userOpt = userRepo.findById(shift.getUser().getId());
        if (userOpt.isEmpty())
            return ResponseEntity.badRequest().body("Invalid User");

        shift.setUser(userOpt.get());
        shiftRepo.save(shift);
        return ResponseEntity.ok("Shift saved");
    }

    // Delete shift for user
    @DeleteMapping("/shifts/{racfid}")
    public ResponseEntity<String> deleteShift(@PathVariable String racfid) {
        List<Shift> shifts = shiftRepo.findByUserRacfid(racfid);
        if (!shifts.isEmpty()) {
            shiftRepo.delete(shifts.get(0));
            return ResponseEntity.ok("Shift deleted");
        }
        return ResponseEntity.notFound().build();
    }

    // ========== LEAVES ==========

    // Add leave for user
    @PostMapping("/leaves")
    public ResponseEntity<String> addLeave(@RequestBody Leave leave) {
        Optional<User> userOpt = userRepo.findById(leave.getUser().getId());
        if (userOpt.isEmpty())
            return ResponseEntity.badRequest().body("Invalid User");

        leave.setUser(userOpt.get());
        leaveRepo.save(leave);
        return ResponseEntity.ok("Leave added");
    }

    // ========== ZONES ==========

    // Get all zones
    @GetMapping("/zones")
    public List<Zone> getAllZones() {
        return zoneRepo.findAll();
    }

    // Get zip codes by zone ID
    @GetMapping("/zones/{id}/zipcodes")
    public ResponseEntity<List<ZipCode>> getZipCodesByZone(@PathVariable Long id) {
        return zoneRepo.findById(id)
                .map(zone -> ResponseEntity.ok(zone.getZipCodes()))
                .orElse(ResponseEntity.notFound().build());
    }
}