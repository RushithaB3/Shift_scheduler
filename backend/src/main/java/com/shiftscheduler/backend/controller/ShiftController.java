package com.shiftscheduler.backend.controller;

import com.shiftscheduler.backend.dto.ZipCodeDTO;
import com.shiftscheduler.backend.model.Shift;
import com.shiftscheduler.backend.model.User;
import com.shiftscheduler.backend.model.ZipCode;
import com.shiftscheduler.backend.model.Zone;
import com.shiftscheduler.backend.repository.ShiftRepository;
import com.shiftscheduler.backend.repository.UserRepository;
import com.shiftscheduler.backend.repository.ZoneRepository;
import com.shiftscheduler.backend.repository.ZipCodeRepository;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/shifts")
public class ShiftController {

    private final ShiftRepository shiftRepository;
    private final UserRepository userRepository;
    private final ZoneRepository zoneRepository;
    private final ZipCodeRepository zipCodeRepository;

    public ShiftController(
            ShiftRepository shiftRepository,
            UserRepository userRepository,
            ZoneRepository zoneRepository,
            ZipCodeRepository zipCodeRepository) {
        this.shiftRepository = shiftRepository;
        this.userRepository = userRepository;
        this.zoneRepository = zoneRepository;
        this.zipCodeRepository = zipCodeRepository;
    }

    // Display all shifts + form
    @GetMapping
    public String showShifts(Model model) {
        model.addAttribute("shifts", shiftRepository.findAllByOrderByLastModifiedDesc());
        model.addAttribute("zones", zoneRepository.findAll());
        model.addAttribute("shiftForm", new Shift());
        return "shifts";
    }

    // Edit shift by userId
    @GetMapping("/edit/{userId}")
    public String editShift(@PathVariable Long userId, Model model) {
        List<Shift> shifts = shiftRepository.findByUserId(userId);
        model.addAttribute("shiftForm", !shifts.isEmpty() ? shifts.get(0) : new Shift());
        model.addAttribute("zones", zoneRepository.findAll());
        model.addAttribute("shifts", shiftRepository.findAllByOrderByLastModifiedDesc());
        return "shifts";
    }

    // Add or update shift
    @PostMapping("/save")
    public String saveOrUpdateShift(@ModelAttribute Shift shift) {
        // Validate and set User
        Optional<User> userOpt = userRepository.findById(shift.getUser().getId());
        if (!userOpt.isPresent()) {
            return "redirect:/shifts?error=UserNotFound";
        }
        shift.setUser(userOpt.get());

        // Validate and set Zone
        Optional<Zone> zoneOpt = zoneRepository.findById(shift.getZone().getId());
        if (!zoneOpt.isPresent()) {
            return "redirect:/shifts?error=ZoneNotFound";
        }
        shift.setZone(zoneOpt.get());

        // Validate and set ZipCode
        Optional<ZipCode> zipCodeOpt = zipCodeRepository.findById(shift.getZipCode().getId());
        if (!zipCodeOpt.isPresent()) {
            return "redirect:/shifts?error=ZipCodeNotFound";
        }
        shift.setZipCode(zipCodeOpt.get());

        // Update existing shift if id exists, otherwise create new
        if (shift.getId() != null) {
            Optional<Shift> existingShiftOpt = shiftRepository.findById(shift.getId());
            if (existingShiftOpt.isPresent()) {
                Shift existingShift = existingShiftOpt.get();
                existingShift.setUser(shift.getUser());
                existingShift.setZone(shift.getZone());
                existingShift.setZipCode(shift.getZipCode());
                existingShift.setStartDate(shift.getStartDate());
                existingShift.setEndDate(shift.getEndDate());
                shiftRepository.save(existingShift);
            } else {
                // If ID is provided but shift not found, treat as new shift
                shift.setId(null);
                shiftRepository.save(shift);
            }
        } else {
            // New shift
            shiftRepository.save(shift);
        }

        return "redirect:/shifts";
    }

    // Delete shift by userId
    @GetMapping("/delete/{userId}")
    public String deleteShift(@PathVariable Long userId) {
        List<Shift> shifts = shiftRepository.findByUserId(userId);
        if (!shifts.isEmpty()) {
            shiftRepository.delete(shifts.get(0));
        }
        return "redirect:/shifts";
    }

    // Return simplified zip code list to avoid JSON circular references
    @ResponseBody
    @GetMapping("/zone/{zoneId}/zipcodes")
    public List<ZipCodeDTO> getZipCodesByZone(@PathVariable Long zoneId) {
        List<ZipCode> zipCodes = zipCodeRepository.findByZoneId(zoneId);
        return zipCodes.stream()
                .map(zip -> new ZipCodeDTO(zip.getId(), zip.getCode()))
                .toList(); // Replaced .collect(Collectors.toList()) with .toList()
    }
}