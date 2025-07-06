package com.shiftscheduler.backend.controller;

import com.shiftscheduler.backend.dto.ShiftDTO;
import com.shiftscheduler.backend.model.Leave;
import com.shiftscheduler.backend.model.Shift;
import com.shiftscheduler.backend.repository.LeaveRepository;
import com.shiftscheduler.backend.repository.ShiftRepository;
import com.shiftscheduler.backend.repository.UserRepository;
import com.shiftscheduler.backend.repository.ZoneRepository;
import com.shiftscheduler.backend.repository.ZipCodeRepository;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Controller
public class DashboardController {

    private final UserRepository userRepo;
    private final ZoneRepository zoneRepo;
    private final ZipCodeRepository zipRepo;
    private final ShiftRepository shiftRepo;
    private final LeaveRepository leaveRepo;

    public DashboardController(UserRepository userRepo,
                               ZoneRepository zoneRepo,
                               ZipCodeRepository zipRepo,
                               ShiftRepository shiftRepo,
                               LeaveRepository leaveRepo) {
        this.userRepo = userRepo;
        this.zoneRepo = zoneRepo;
        this.zipRepo = zipRepo;
        this.shiftRepo = shiftRepo;
        this.leaveRepo = leaveRepo;
    }

    @GetMapping("/dashboard")
    public String dashboard(
            @RequestParam(required = false) Long zoneId,
            @RequestParam(required = false) Long zipCodeId,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
            Model model
    ) {
        // Summary Cards
        List<Map<String, Object>> summary = List.of(
                Map.of("label", "Users", "count", userRepo.count()),
                Map.of("label", "Zones", "count", zoneRepo.count()),
                Map.of("label", "Zip Codes", "count", zipRepo.count()),
                Map.of("label", "Shifts", "count", shiftRepo.count()),
                Map.of("label", "Leaves", "count", leaveRepo.count())
        );
        model.addAttribute("summary", summary);

        // Dropdown filters
        model.addAttribute("zones", zoneRepo.findAll());
        model.addAttribute("zipCodes", zipRepo.findAll());

        // Retain selected filters
        model.addAttribute("zoneId", zoneId);
        model.addAttribute("zipCodeId", zipCodeId);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);

        // Load filtered leave records
        List<Leave> leaves;
        if (zoneId != null && zipCodeId != null && startDate != null && endDate != null) {
            leaves = leaveRepo.findByZone_IdAndZipCode_IdAndFromDateGreaterThanEqualAndToDateLessThanEqual(
                    zoneId, zipCodeId, startDate, endDate);
        } else if (zoneId != null && zipCodeId != null) {
            leaves = leaveRepo.findByZone_IdAndZipCode_Id(zoneId, zipCodeId);
        } else if (zoneId != null) {
            leaves = leaveRepo.findByZone_Id(zoneId);
        } else {
            leaves = leaveRepo.findAll();
        }
        model.addAttribute("leaves", leaves);


        // Filtered Shift Records
        List<Shift> rawShifts;

        if (zoneId != null && zipCodeId != null && startDate != null && endDate != null) {
            rawShifts = shiftRepo.findByZone_IdAndZipCode_IdAndStartDateLessThanEqualAndEndDateGreaterThanEqual(
                zoneId, zipCodeId, endDate, startDate
            );
        } else {
            // Fallback to stream filtering
            rawShifts = shiftRepo.findAll();

            if (zoneId != null) {
                rawShifts = rawShifts.stream()
                    .filter(s -> s.getZone() != null && s.getZone().getId().equals(zoneId))
                    .toList();
            }

            if (zipCodeId != null) {
                rawShifts = rawShifts.stream()
                    .filter(s -> s.getZipCode() != null && s.getZipCode().getId().equals(zipCodeId))
                    .toList();
            }

            if (startDate != null) {
                rawShifts = rawShifts.stream()
                    .filter(s -> s.getEndDate() != null && !s.getEndDate().isBefore(startDate))
                    .toList();
            }

            if (endDate != null) {
                rawShifts = rawShifts.stream()
                    .filter(s -> s.getStartDate() != null && !s.getStartDate().isAfter(endDate))
                    .toList();
            }
        }



        List<ShiftDTO> shiftDTOs = rawShifts.stream().map(ShiftDTO::new).toList();
        model.addAttribute("shifts", shiftDTOs);

        return "dashboard";
    }


    @GetMapping("/api/shifts")
    @ResponseBody
    public List<ShiftDTO> getFilteredShifts(
            @RequestParam(required = false) Long zoneId,
            @RequestParam(required = false) Long zipCodeId,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate
    ) {
        List<Shift> rawShifts = shiftRepo.findAll();

        if (zoneId != null) {
            rawShifts = rawShifts.stream()
                    .filter(s -> s.getZone() != null && s.getZone().getId().equals(zoneId))
                    .toList();
        }
        if (zipCodeId != null) {
            rawShifts = rawShifts.stream()
                    .filter(s -> s.getZipCode() != null && s.getZipCode().getId().equals(zipCodeId))
                    .toList();
        }
        if (startDate != null) {
            rawShifts = rawShifts.stream()
                    .filter(s -> s.getEndDate() != null && !s.getEndDate().isBefore(startDate))
                    .toList();
        }
        if (endDate != null) {
            rawShifts = rawShifts.stream()
                    .filter(s -> s.getStartDate() != null && !s.getStartDate().isAfter(endDate))
                    .toList();
        }

        return rawShifts.stream().map(ShiftDTO::new).toList();
    }

}
