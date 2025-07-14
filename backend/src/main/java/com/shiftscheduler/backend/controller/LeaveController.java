package com.shiftscheduler.backend.controller;

import com.shiftscheduler.backend.dto.LeaveDTO; // New DTO
import com.shiftscheduler.backend.model.Leave;
import com.shiftscheduler.backend.model.User;
import com.shiftscheduler.backend.model.Zone;
import com.shiftscheduler.backend.model.ZipCode;
import com.shiftscheduler.backend.repository.LeaveRepository;
import com.shiftscheduler.backend.repository.UserRepository;
import com.shiftscheduler.backend.repository.ZoneRepository;
import com.shiftscheduler.backend.repository.ZipCodeRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/leaves")
public class LeaveController {

    private final LeaveRepository leaveRepo;
    private final UserRepository userRepo;
    private final ZoneRepository zoneRepo;
    private final ZipCodeRepository zipCodeRepo;

    public LeaveController(LeaveRepository leaveRepo, UserRepository userRepo,
            ZoneRepository zoneRepo, ZipCodeRepository zipCodeRepo) {
        this.leaveRepo = leaveRepo;
        this.userRepo = userRepo;
        this.zoneRepo = zoneRepo;
        this.zipCodeRepo = zipCodeRepo;
    }

    // Show add leave form and list
    @GetMapping
    public String showLeaves(Model model) {
        List<Leave> leaves = leaveRepo.findAll();
        List<LeaveDTO> leaveDTOs = leaves.stream()
                .map(LeaveDTO::new)
                .collect(Collectors.toList());
        model.addAttribute("leaves", leaveDTOs);
        model.addAttribute("leaveForm", new Leave()); // For add form
        model.addAttribute("zones", zoneRepo.findAll());
        model.addAttribute("zipCodes", zipCodeRepo.findAll());
        return "leaves";
    }

    // Fetch user details by RACFID for auto-fill (but now handled via JS/AJAX)
    @GetMapping("/fetch-user")
    public String fetchUser(@RequestParam String racfid, Model model) {
        Optional<User> userOpt = userRepo.findByRacfid(racfid);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            model.addAttribute("user", user);
            model.addAttribute("zone", user.getZone());
            model.addAttribute("zipCode", user.getZipCode());
        } else {
            model.addAttribute("error", "User not found.");
        }
        model.addAttribute("leaves", leaveRepo.findAll().stream().map(LeaveDTO::new).collect(Collectors.toList()));
        model.addAttribute("zones", zoneRepo.findAll());
        model.addAttribute("zipCodes", zipCodeRepo.findAll());
        return "leaves";
    }

    // Add leave
    @PostMapping
    public String addLeave(
            @RequestParam String racfid,
            @ModelAttribute Leave leaveForm,
            RedirectAttributes redirectAttributes) {
        Optional<User> userOpt = userRepo.findByRacfid(racfid);
        if (userOpt.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Invalid User RACFID.");
            return "redirect:/leaves";
        }

        Leave leave = new Leave();
        leave.setUser(userOpt.get());
        // Zone and ZipCode are optional, set to null or user's defaults if needed
        leave.setZone(null);
        leave.setZipCode(null);
        leave.setFromDate(leaveForm.getFromDate());
        leave.setToDate(leaveForm.getToDate());

        if (leave.getFromDate().isAfter(leave.getToDate())) {
            redirectAttributes.addFlashAttribute("error", "From Date must be before or equal to To Date.");
            return "redirect:/leaves";
        }

        leaveRepo.save(leave);
        redirectAttributes.addFlashAttribute("success", "Leave added successfully.");
        return "redirect:/leaves";
    }
}