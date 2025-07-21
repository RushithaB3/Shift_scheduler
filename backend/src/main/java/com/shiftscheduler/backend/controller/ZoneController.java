package com.shiftscheduler.backend.controller;

import com.shiftscheduler.backend.model.Zone;
import com.shiftscheduler.backend.repository.ZipCodeRepository;
import com.shiftscheduler.backend.service.ZoneService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Controller
@RequestMapping("/zones")
public class ZoneController {

    private static final String ZONES_ATTRIBUTE = "zones";
    private static final String REDIRECT_ZONES = "redirect:/zones";

    private final ZoneService zoneService;
    private final ZipCodeRepository zipCodeRepository;

    public ZoneController(ZoneService zoneService, ZipCodeRepository zipCodeRepository) {
        this.zoneService = zoneService;
        this.zipCodeRepository = zipCodeRepository;
    }

    @GetMapping
    public String getZones(Model model) {
        model.addAttribute(ZONES_ATTRIBUTE, zoneService.getAllZones());
        model.addAttribute("zoneForm", new Zone()); // For add mode
        model.addAttribute("zipCodes", zipCodeRepository.findAll()); // List all zip codes for selection
        return "zones";
    }

    @SuppressWarnings("java:S3516")
    @PostMapping("/save")
    public String saveZone(@ModelAttribute("zoneForm") Zone zone,
            @RequestParam(value = "zipCodeIds", required = false) Set<Long> zipCodeIds,
            RedirectAttributes redirectAttributes) {
        try {
            zoneService.saveZone(zone, (zipCodeIds != null ? zipCodeIds : new HashSet<>()));
            return REDIRECT_ZONES;
        } catch (IllegalArgumentException | IllegalStateException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return REDIRECT_ZONES;
        }
    }

    @SuppressWarnings("java:S3516")
    @GetMapping("/edit/{id}")
    public String editZone(@PathVariable Long id, Model model) {
        Optional<Zone> zoneOpt = zoneService.getZoneById(id);
        if (zoneOpt.isPresent()) {
            model.addAttribute("zoneForm", zoneOpt.get()); // Pre-populate form for edit
            model.addAttribute("zipCodes", zipCodeRepository.findAll()); // List all zip codes
            model.addAttribute(ZONES_ATTRIBUTE, zoneService.getAllZones()); // Refresh table
            return "zones"; // Reuse the same template for edit
        } else {
            return REDIRECT_ZONES + "?error=Zone not found";
        }
    }

    @SuppressWarnings("java:S3516")
    @GetMapping("/delete/{id}")
    public String deleteZone(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            zoneService.deleteZone(id);
            return REDIRECT_ZONES;
        } catch (IllegalArgumentException | IllegalStateException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return REDIRECT_ZONES;
        }
    }
}