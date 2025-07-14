package com.shiftscheduler.backend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String redirectToDashboard() {
        return "redirect:/dashboard";
    }

    @GetMapping("/schedule_manager")
    public String showScheduleManager() {
        return "schedule_manager"; // This should map to src/main/resources/templates/schedule_manager.html
    }

    @GetMapping("/edit_shift")
    public String editShiftLauncher() {
        return "edit_shift"; // edit_shift.html
    }

    @GetMapping("/delete_shift")
    public String deleteShiftLauncher() {
        return "delete_shift"; // delete_shift.html
    }

}