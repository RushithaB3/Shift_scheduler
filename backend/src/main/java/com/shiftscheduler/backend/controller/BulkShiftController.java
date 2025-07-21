package com.shiftscheduler.backend.controller;

import com.shiftscheduler.backend.dto.AssignmentForm;
import com.shiftscheduler.backend.dto.BulkShiftForm;
import com.shiftscheduler.backend.dto.ZipCodeDTO;
import com.shiftscheduler.backend.model.BulkShift;
import com.shiftscheduler.backend.model.ShiftAssignment;
import com.shiftscheduler.backend.model.User;
import com.shiftscheduler.backend.model.ZipCode;
import com.shiftscheduler.backend.model.Zone;
import com.shiftscheduler.backend.repository.BulkShiftRepository;
import com.shiftscheduler.backend.repository.ShiftAssignmentRepository;
import com.shiftscheduler.backend.repository.UserRepository;
import com.shiftscheduler.backend.repository.ZipCodeRepository;
import com.shiftscheduler.backend.repository.ZoneRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/")
public class BulkShiftController {

    private final BulkShiftRepository bulkShiftRepo;
    private final ShiftAssignmentRepository shiftAssignmentRepo;
    private final UserRepository userRepo;
    private final ZoneRepository zoneRepo;
    private final ZipCodeRepository zipCodeRepo;

    public BulkShiftController(BulkShiftRepository bulkShiftRepo, ShiftAssignmentRepository shiftAssignmentRepo,
            UserRepository userRepo, ZoneRepository zoneRepo, ZipCodeRepository zipCodeRepo) {
        this.bulkShiftRepo = bulkShiftRepo;
        this.shiftAssignmentRepo = shiftAssignmentRepo;
        this.userRepo = userRepo;
        this.zoneRepo = zoneRepo;
        this.zipCodeRepo = zipCodeRepo;
    }

    // Show bulk add form
    @GetMapping("/add_bulk_shift")
    public String getBulkShift(Model model) {
        model.addAttribute("bulkShiftForm", new BulkShiftForm());
        model.addAttribute("users", userRepo.findAll());
        model.addAttribute("zones", zoneRepo.findAll());
        return "add_bulk_shift";
    }

    // Save bulk shift
    @Transactional
    @PostMapping("/bulk-save")
    public String saveBulkShift(@ModelAttribute BulkShiftForm form, RedirectAttributes redirectAttributes) {
        // Validate shared dates if sameDates is true
        if (form.isSameDates() && (form.getStartDate() == null || form.getEndDate() == null
                || form.getStartDate().isAfter(form.getEndDate()))) {
            redirectAttributes.addFlashAttribute("error", "Invalid shared dates.");
            return "redirect:/add_bulk_shift";
        }

        if (form.getAssignments() == null || form.getAssignments().isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "At least one assignment group required.");
            return "redirect:/add_bulk_shift";
        }

        // Process each assignment group
        for (AssignmentForm ass : form.getAssignments()) {
            // Validate per-group dates if sameDates is false
            if (!form.isSameDates() && (ass.getStartDate() == null || ass.getEndDate() == null
                    || ass.getStartDate().isAfter(ass.getEndDate()))) {
                redirectAttributes.addFlashAttribute("error", "Invalid dates for group.");
                return "redirect:/add_bulk_shift";
            }

            // Create a new BulkShift for each group (or use shared dates)
            BulkShift bulkShift = new BulkShift();
            bulkShift.setStartDate(form.isSameDates() ? form.getStartDate() : ass.getStartDate());
            bulkShift.setEndDate(form.isSameDates() ? form.getEndDate() : ass.getEndDate());
            // Optional: set racfid if you have auth, e.g.,
            // bulkShift.setRacfid(currentUserRacfid);
            bulkShiftRepo.save(bulkShift);

            // Process multiple zones
            for (Long zoneId : ass.getZoneIds()) {
                Optional<Zone> zoneOpt = zoneRepo.findById(zoneId);
                if (zoneOpt.isEmpty()) {
                    redirectAttributes.addFlashAttribute("error", "Invalid zone ID: " + zoneId);
                    return "redirect:/add_bulk_shift";
                }
                Zone zone = zoneOpt.get();

                List<ZipCode> allZipCodesInZone = zipCodeRepo.findByZoneId(zoneId);

                for (Long userId : ass.getUserIds()) {
                    Optional<User> userOpt = userRepo.findById(userId);
                    if (userOpt.isEmpty()) {
                        redirectAttributes.addFlashAttribute("error", "Invalid user ID: " + userId);
                        return "redirect:/add_bulk_shift";
                    }
                    User user = userOpt.get();

                    if (ass.getZipCodeIds() == null || ass.getZipCodeIds().isEmpty()) {
                        // All zipcodes: Create one assignment with zipCode null
                        ShiftAssignment sa = new ShiftAssignment();
                        sa.setShift(bulkShift);
                        sa.setUser(user);
                        sa.setZone(zone);
                        sa.setZipCode(null);
                        shiftAssignmentRepo.save(sa);
                    } else {
                        // Specific zipcodes
                        for (Long zipId : ass.getZipCodeIds()) {
                            Optional<ZipCode> zipOpt = zipCodeRepo.findById(zipId);
                            if (zipOpt.isEmpty() || !zipOpt.get().getZone().getId().equals(zoneId)) {
                                redirectAttributes.addFlashAttribute("error",
                                        "Invalid zipcode ID: " + zipId + " for zone " + zoneId);
                                return "redirect:/add_bulk_shift";
                            }
                            ZipCode zip = zipOpt.get();

                            ShiftAssignment sa = new ShiftAssignment();
                            sa.setShift(bulkShift);
                            sa.setUser(user);
                            sa.setZone(zone);
                            sa.setZipCode(zip);
                            shiftAssignmentRepo.save(sa);
                        }
                    }
                }
            }
        }

        redirectAttributes.addFlashAttribute("success", "Bulk shift added successfully.");
        return "redirect:/add_bulk_shift";
    }

    // Get zip codes by zone IDs (for AJAX)
    @GetMapping("/zone/{zoneIds}/zipcodes")
    public ResponseEntity<List<ZipCodeDTO>> getZipCodesByZone(@PathVariable("zoneIds") String zoneIds) {
        List<Long> ids = Arrays.stream(zoneIds.split(","))
                .map(Long::parseLong)
                .collect(Collectors.toList());
        List<ZipCode> zipCodes = new ArrayList<>();
        for (Long id : ids) {
            zipCodes.addAll(zipCodeRepo.findByZoneId(id));
        }
        List<ZipCodeDTO> dtoList = zipCodes.stream()
                .map(zip -> new ZipCodeDTO(zip.getId(), zip.getCode()))
                .collect(Collectors.toList());
        return ResponseEntity.ok(dtoList);
    }
}