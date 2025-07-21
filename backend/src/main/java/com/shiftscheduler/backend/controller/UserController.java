package com.shiftscheduler.backend.controller;

import com.shiftscheduler.backend.model.User;
import com.shiftscheduler.backend.model.Zone;
import com.shiftscheduler.backend.model.ZipCode;
import com.shiftscheduler.backend.repository.UserRepository;
import com.shiftscheduler.backend.repository.ZoneRepository;
import com.shiftscheduler.backend.repository.ZipCodeRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.Optional;

@Controller
@RequestMapping("/users")
public class UserController {

    private final UserRepository userRepo;
    private final ZoneRepository zoneRepo;
    private final ZipCodeRepository zipCodeRepo;

    public UserController(UserRepository userRepo, ZoneRepository zoneRepo, ZipCodeRepository zipCodeRepo) {
        this.userRepo = userRepo;
        this.zoneRepo = zoneRepo;
        this.zipCodeRepo = zipCodeRepo;
    }

    @GetMapping
    public String showUsers(Model model) {
        model.addAttribute("users", userRepo.findAll());
        model.addAttribute("userForm", new User()); // For add form
        model.addAttribute("zones", zoneRepo.findAll());
        model.addAttribute("zipCodes", zipCodeRepo.findAll());
        return "users";
    }

    @PostMapping
    public String saveUser(@ModelAttribute("userForm") User userForm) {
        // Set zone and zip if IDs provided
        if (userForm.getZone() != null && userForm.getZone().getId() != null) {
            Optional<Zone> zoneOpt = zoneRepo.findById(userForm.getZone().getId());
            zoneOpt.ifPresent(userForm::setZone);
        }
        if (userForm.getZipCode() != null && userForm.getZipCode().getId() != null) {
            Optional<ZipCode> zipOpt = zipCodeRepo.findById(userForm.getZipCode().getId());
            zipOpt.ifPresent(userForm::setZipCode);
        }
        userRepo.save(userForm);
        return "redirect:/users";
    }

    @GetMapping("/edit/{id}")
    public String editUser(@PathVariable Long id, Model model) {
        Optional<User> userOpt = userRepo.findById(id);
        if (userOpt.isPresent()) {
            model.addAttribute("userForm", userOpt.get());
        } else {
            throw new RuntimeException("User not found");
        }
        model.addAttribute("users", userRepo.findAll());
        model.addAttribute("zones", zoneRepo.findAll());
        model.addAttribute("zipCodes", zipCodeRepo.findAll());
        return "users";
    }

    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable Long id, @ModelAttribute("userForm") User updatedUser) {
        Optional<User> userOpt = userRepo.findById(id);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            user.setFirstName(updatedUser.getFirstName());
            user.setLastName(updatedUser.getLastName());
            user.setEmail(updatedUser.getEmail());
            user.setTitle(updatedUser.getTitle()); // New
            user.setPhoneNumber(updatedUser.getPhoneNumber()); // New
            user.setLatitude(updatedUser.getLatitude());
            user.setLongitude(updatedUser.getLongitude());
            if (updatedUser.getZone() != null) {
                user.setZone(updatedUser.getZone());
            }
            if (updatedUser.getZipCode() != null) {
                user.setZipCode(updatedUser.getZipCode());
            }
            userRepo.save(user);
        }
        return "redirect:/users";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userRepo.deleteById(id);
        return "redirect:/users";
    }
}