package com.shiftscheduler.backend.controller;

import com.shiftscheduler.backend.dto.ZipCodeDTO;
import com.shiftscheduler.backend.model.Shift;
import com.shiftscheduler.backend.model.User;
import com.shiftscheduler.backend.model.ZipCode;
import com.shiftscheduler.backend.model.Zone;
import com.shiftscheduler.backend.repository.ShiftRepository;
import com.shiftscheduler.backend.repository.UserRepository;
import com.shiftscheduler.backend.repository.ZipCodeRepository;
import com.shiftscheduler.backend.repository.ZoneRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/shifts")
public class ShiftController {

    private final ShiftRepository shiftRepo;
    private final UserRepository userRepo;
    private final ZoneRepository zoneRepo;
    private final ZipCodeRepository zipCodeRepo;

    public ShiftController(ShiftRepository shiftRepo, UserRepository userRepo,
            ZoneRepository zoneRepo, ZipCodeRepository zipCodeRepo) {
        this.shiftRepo = shiftRepo;
        this.userRepo = userRepo;
        this.zoneRepo = zoneRepo;
        this.zipCodeRepo = zipCodeRepo;
    }

    // Show shifts list and form
    @GetMapping
    public String showShifts(Model model) {
        model.addAttribute("shifts", shiftRepo.findAllByOrderByLastModifiedDesc());
        model.addAttribute("shiftForm", new Shift()); // For add form
        model.addAttribute("zones", zoneRepo.findAll());
        return "shifts";
    }

    // Edit shift by user RACFID
    @GetMapping("/edit/{racfid}")
    public String editShift(@PathVariable String racfid, Model model) {
        List<Shift> shifts = shiftRepo.findByUserRacfid(racfid);
        if (!shifts.isEmpty()) {
            model.addAttribute("shiftForm", shifts.get(0)); // Use first if multiple
        }
        model.addAttribute("shifts", shiftRepo.findAllByOrderByLastModifiedDesc());
        model.addAttribute("zones", zoneRepo.findAll());
        return "shifts";
    }

    // Save or update shift
    @PostMapping("/save")
    public String saveShift(@ModelAttribute("shiftForm") Shift shiftForm, RedirectAttributes redirectAttributes) {
        // Find user by RACFID (from form)
        Optional<User> userOpt = userRepo.findByRacfid(shiftForm.getRacfid());
        if (userOpt.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Invalid RACFID. User not found.");
            return "redirect:/shifts";
        }

        // Find zone and zip code by IDs (from form)
        Optional<Zone> zoneOpt = zoneRepo.findById(shiftForm.getZone().getId());
        Optional<ZipCode> zipOpt = zipCodeRepo.findById(shiftForm.getZipCode().getId());
        if (zoneOpt.isEmpty() || zipOpt.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Invalid Zone or Zip Code.");
            return "redirect:/shifts";
        }

        // Create or update shift
        Shift shift;
        if (shiftForm.getId() != null) {
            // Update existing
            Optional<Shift> existingOpt = shiftRepo.findById(shiftForm.getId());
            if (existingOpt.isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "Shift not found for update.");
                return "redirect:/shifts";
            }
            shift = existingOpt.get();
        } else {
            // New shift
            shift = new Shift();
        }

        // Set fields
        shift.setUser(userOpt.get());
        shift.setRacfid(shiftForm.getRacfid()); // Denormalize for queries
        shift.setZone(zoneOpt.get());
        shift.setZipCode(zipOpt.get());
        shift.setStartDate(shiftForm.getStartDate());
        shift.setEndDate(shiftForm.getEndDate());

        // Validate dates (optional: start <= end)
        if (shift.getStartDate().isAfter(shift.getEndDate())) {
            redirectAttributes.addFlashAttribute("error", "Start Date must be before or equal to End Date.");
            return "redirect:/shifts";
        }

        shiftRepo.save(shift);
        redirectAttributes.addFlashAttribute("success", "Shift saved successfully.");
        return "redirect:/shifts";
    }

    // Delete shift by user RACFID
    @GetMapping("/delete/{racfid}")
    public String deleteShift(@PathVariable String racfid, RedirectAttributes redirectAttributes) {
        List<Shift> shifts = shiftRepo.findByUserRacfid(racfid);
        if (!shifts.isEmpty()) {
            shiftRepo.delete(shifts.get(0)); // Delete first if multiple
            redirectAttributes.addFlashAttribute("success", "Shift deleted.");
        } else {
            redirectAttributes.addFlashAttribute("error", "No shift found to delete.");
        }
        return "redirect:/shifts";
    }

    // Get zip codes by zone ID (for AJAX)
    @GetMapping("/zone/{zoneId}/zipcodes")
    public ResponseEntity<List<ZipCodeDTO>> getZipCodesByZone(@PathVariable Long zoneId) {
        List<ZipCode> zipCodes = zipCodeRepo.findByZoneId(zoneId);
        List<ZipCodeDTO> dtoList = zipCodes.stream()
                .map(zip -> new ZipCodeDTO(zip.getId(), zip.getCode()))
                .collect(Collectors.toList());
        return ResponseEntity.ok(dtoList);
    }
}