package com.shiftscheduler.backend.controller;

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

import java.util.Optional;

@Controller
@RequestMapping("/leaves")
public class LeaveController {

    private final LeaveRepository leaveRepository;
    private final UserRepository userRepository;
    private final ZoneRepository zoneRepository;
    private final ZipCodeRepository zipCodeRepository;

    public LeaveController(
            LeaveRepository leaveRepository,
            UserRepository userRepository,
            ZoneRepository zoneRepository,
            ZipCodeRepository zipCodeRepository) {
        this.leaveRepository = leaveRepository;
        this.userRepository = userRepository;
        this.zoneRepository = zoneRepository;
        this.zipCodeRepository = zipCodeRepository;
    }

    // Show the leave form + all submitted leaves
    @GetMapping
    public String showLeaveForm(Model model) {
        model.addAttribute("leave", new Leave());
        model.addAttribute("leaves", leaveRepository.findAll());
        model.addAttribute("zones", zoneRepository.findAll());
        model.addAttribute("zipCodes", zipCodeRepository.findAll());
        return "leaves"; // templates/leaves.html
    }

    // Autofill user details by ID
    @GetMapping("/fetch-user")
    public String fetchUserDetails(@RequestParam Long userId, Model model) {
        Optional<User> userOpt = userRepository.findById(userId);
        Leave leave = new Leave();

        if (userOpt.isPresent()) {
            User user = userOpt.get();
            leave.setUser(user);

            // ✅ Set zone and zipCode from User entity if they exist
            if (user.getZone() != null) {
                leave.setZone(user.getZone());
            }
            if (user.getZipCode() != null) {
                leave.setZipCode(user.getZipCode());
            }

            model.addAttribute("userFound", true);
        } else {
            model.addAttribute("userFound", false);
        }

        model.addAttribute("leave", leave);
        model.addAttribute("leaves", leaveRepository.findAll());
        model.addAttribute("zones", zoneRepository.findAll());
        model.addAttribute("zipCodes", zipCodeRepository.findAll());

        return "leaves";
    }

    // Save leave submission
    @PostMapping
    public String addLeave(
            @RequestParam Long userId,
            @RequestParam Long zoneId,
            @RequestParam Long zipCodeId,
            @ModelAttribute Leave leave) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        Zone zone = zoneRepository.findById(zoneId)
                .orElseThrow(() -> new RuntimeException("Zone not found"));
        ZipCode zipCode = zipCodeRepository.findById(zipCodeId)
                .orElseThrow(() -> new RuntimeException("Zip code not found"));

        leave.setUser(user);
        leave.setZone(zone);
        leave.setZipCode(zipCode);

        leaveRepository.save(leave);
        return "redirect:/leaves";
    }
}
