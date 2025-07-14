package com.shiftscheduler.backend.controller;

import com.shiftscheduler.backend.model.Zone;
import com.shiftscheduler.backend.model.ZipCode;
import com.shiftscheduler.backend.repository.ZoneRepository;
import com.shiftscheduler.backend.repository.ZipCodeRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/zones")
public class ZoneController {

    private final ZoneRepository zoneRepository;
    private final ZipCodeRepository zipCodeRepository;

    public ZoneController(ZoneRepository zoneRepository, ZipCodeRepository zipCodeRepository) {
        this.zoneRepository = zoneRepository;
        this.zipCodeRepository = zipCodeRepository;
    }

    // UI page showing all zones and zone form
    @GetMapping
    public String showZones(Model model) {
        model.addAttribute("zones", zoneRepository.findAll());
        model.addAttribute("zoneForm", new Zone());
        model.addAttribute("zipCodes", zipCodeRepository.findAll()); // ✅ Needed for zip code multi-select
        return "zones";
    }

    // Save zone and assign selected zip codes to it
    @PostMapping("/save")
    public String saveZone(@ModelAttribute("zoneForm") Zone zone,
            @RequestParam(value = "zipCodeIds", required = false) List<Long> zipCodeIds) {
        zoneRepository.save(zone);

        // Assign selected zip codes to this zone
        if (zipCodeIds != null && !zipCodeIds.isEmpty()) {
            List<ZipCode> zipCodes = zipCodeRepository.findAllById(zipCodeIds);
            for (ZipCode zip : zipCodes) {
                zip.setZone(zone);
            }
            zipCodeRepository.saveAll(zipCodes);
        }

        return "redirect:/zones";
    }

    // Load zone for editing
    @GetMapping("/edit/{id}")
    public String editZone(@PathVariable Long id, Model model) {
        Optional<Zone> zone = zoneRepository.findById(id);
        model.addAttribute("zoneForm", zone.orElse(new Zone()));
        model.addAttribute("zones", zoneRepository.findAll());
        model.addAttribute("zipCodes", zipCodeRepository.findAll()); // ✅ Also needed here
        return "zones";
    }

    // Delete zone
    @GetMapping("/delete/{id}")
    public String deleteZone(@PathVariable Long id) {
        zoneRepository.deleteById(id);
        return "redirect:/zones";
    }
}