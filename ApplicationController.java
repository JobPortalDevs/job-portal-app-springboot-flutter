// src/main/java/com/example/jobportal/controller/ApplicationController.java
package com.example.jobportal.controller;

import com.example.jobportal.entity.Application;
import com.example.jobportal.entity.Job;
import com.example.jobportal.entity.User;
import com.example.jobportal.service.ApplicationService;
import com.example.jobportal.service.JobService;
import com.example.jobportal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/applications")
public class ApplicationController {
    @Autowired
    private ApplicationService applicationService;

    @Autowired
    private JobService jobService;

    @Autowired
    private UserService userService;

    // Show application form
    @GetMapping("/apply/{jobId}")
    public String showApplicationForm(@PathVariable Long jobId, Model model) {
        model.addAttribute("application", new Application());
        model.addAttribute("jobId", jobId);
        return "apply-job";
    }

    // Handle job application
    @PostMapping("/apply")
    public String applyForJob(@ModelAttribute Application application,
                              @RequestParam Long jobId,
                              Authentication authentication) {
        String username = authentication.getName();
        User applicant = userService.findByUsername(username)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user"));

        Job job = jobService.getJobById(jobId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid job Id:" + jobId));

        application.setApplicant(applicant);
        application.setJob(job);
        applicationService.applyForJob(application);
        return "redirect:/jobs/" + jobId + "?applied";
    }

    // Additional application-related endpoints can be added here
}
