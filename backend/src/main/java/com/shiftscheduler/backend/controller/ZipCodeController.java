package com.shiftscheduler.backend.controller;

import com.shiftscheduler.backend.model.ZipCode;
import com.shiftscheduler.backend.model.Zone;
import com.shiftscheduler.backend.repository.ZipCodeRepository;
import com.shiftscheduler.backend.repository.ZoneRepository;
import com.shiftscheduler.backend.repository.UserRepository;
import com.shiftscheduler.backend.repository.ShiftRepository;
import com.shiftscheduler.backend.repository.LeaveRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Controller
@RequestMapping("/zipcodes")
public class ZipCodeController {

    private final ZipCodeRepository zipCodeRepository;
    private final ZoneRepository zoneRepository;
    private final UserRepository userRepository;
    private final ShiftRepository shiftRepository;
    private final LeaveRepository leaveRepository;

    public ZipCodeController(ZipCodeRepository zipCodeRepository, ZoneRepository zoneRepository,
            UserRepository userRepository, ShiftRepository shiftRepository,
            LeaveRepository leaveRepository) {
        this.zipCodeRepository = zipCodeRepository;
        this.zoneRepository = zoneRepository;
        this.userRepository = userRepository;
        this.shiftRepository = shiftRepository;
        this.leaveRepository = leaveRepository;
    }

    // Display all zip codes and form
    @GetMapping
    public String listZipCodes(Model model) {
        model.addAttribute("zipCodes", zipCodeRepository.findAll());
        model.addAttribute("zones", zoneRepository.findAll());
        model.addAttribute("zipCodeForm", new ZipCode());
        return "zipcodes";
    }

    // Save or update a zip code
    @PostMapping("/save")
    public String saveZipCode(@ModelAttribute ZipCode zipCode) {
        Optional<Zone> zoneOpt = zoneRepository.findById(zipCode.getZone().getId());
        zoneOpt.ifPresent(zipCode::setZone);
        zipCodeRepository.save(zipCode);
        return "redirect:/zipcodes";
    }

    // Edit existing zip code
    @GetMapping("/edit/{id}")
    public String editZipCode(@PathVariable Long id, Model model) {
        Optional<ZipCode> zipCode = zipCodeRepository.findById(id);
        model.addAttribute("zipCodeForm", zipCode.orElse(new ZipCode()));
        model.addAttribute("zones", zoneRepository.findAll());
        model.addAttribute("zipCodes", zipCodeRepository.findAll());
        return "zipcodes";
    }

    // Delete zip code
    @GetMapping("/delete/{id}")
    public String deleteZipCode(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            Set<Long> zipIds = new HashSet<>();
            zipIds.add(id);

            if (userRepository.countByZipCode_IdIn(zipIds) > 0 ||
                    shiftRepository.countByZipCode_IdIn(zipIds) > 0 ||
                    leaveRepository.countByZipCode_IdIn(zipIds) > 0) {
                throw new IllegalStateException(
                        "Cannot delete zip code as it is referenced by users, shifts, or leaves.");
            }

            zipCodeRepository.deleteById(id);
            return "redirect:/zipcodes";
        } catch (IllegalStateException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/zipcodes";
        }
    }
}