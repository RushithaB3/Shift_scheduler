package com.shiftscheduler.backend.controller;

import com.shiftscheduler.backend.model.User;
import com.shiftscheduler.backend.repository.UserRepository;
import com.shiftscheduler.backend.repository.ZoneRepository;
import com.shiftscheduler.backend.repository.ZipCodeRepository;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/users")
public class UserController {

    private final UserRepository userRepository;
    private final ZoneRepository zoneRepository;
    private final ZipCodeRepository zipCodeRepository;

    public UserController(UserRepository userRepository,
                          ZoneRepository zoneRepository,
                          ZipCodeRepository zipCodeRepository) {
        this.userRepository = userRepository;
        this.zoneRepository = zoneRepository;
        this.zipCodeRepository = zipCodeRepository;
    }

    // Show all users and the create/edit form
    @GetMapping
    public String showUserList(Model model) {
        model.addAttribute("users", userRepository.findAll());
        model.addAttribute("user", new User()); // For the form
        model.addAttribute("zones", zoneRepository.findAll());
        model.addAttribute("zipCodes", zipCodeRepository.findAll());
        return "users";
    }

    // Save new user from the form
    @PostMapping
    public String addUser(@ModelAttribute("user") User user) {
        userRepository.save(user);
        return "redirect:/users";
    }

    // Load the edit form with existing user data
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user Id: " + id));
        model.addAttribute("user", user);
        model.addAttribute("users", userRepository.findAll());
        model.addAttribute("zones", zoneRepository.findAll());
        model.addAttribute("zipCodes", zipCodeRepository.findAll());
        return "users"; // Reuse the same Thymeleaf page
    }

    // Save updated user
    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable("id") Long id, @ModelAttribute("user") User user) {
        User existingUser = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user Id: " + id));

        existingUser.setFirstName(user.getFirstName());
        existingUser.setLastName(user.getLastName());
        existingUser.setEmail(user.getEmail());
        existingUser.setLatitude(user.getLatitude());
        existingUser.setLongitude(user.getLongitude());
        existingUser.setZone(user.getZone());
        existingUser.setZipCode(user.getZipCode());

        userRepository.save(existingUser);
        return "redirect:/users";
    }

    // Delete a user by ID
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id) {
        userRepository.deleteById(id);
        return "redirect:/users";
    }
}
