package com.shiftscheduler.backend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FilterShiftController {

    @GetMapping("/filter_shift")
    public String showFilterShift() {
        return "filter_shift";
    }
}