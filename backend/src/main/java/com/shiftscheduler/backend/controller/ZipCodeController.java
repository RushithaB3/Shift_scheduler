package com.shiftscheduler.backend.controller;

import com.shiftscheduler.backend.model.ZipCode;
import com.shiftscheduler.backend.model.Zone;
import com.shiftscheduler.backend.repository.ZipCodeRepository;
import com.shiftscheduler.backend.repository.ZoneRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/zipcodes")
public class ZipCodeController {

    private final ZipCodeRepository zipCodeRepository;
    private final ZoneRepository zoneRepository;

    public ZipCodeController(ZipCodeRepository zipCodeRepository, ZoneRepository zoneRepository) {
        this.zipCodeRepository = zipCodeRepository;
        this.zoneRepository = zoneRepository;
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
    public String deleteZipCode(@PathVariable Long id) {
        zipCodeRepository.deleteById(id);
        return "redirect:/zipcodes";
    }
}