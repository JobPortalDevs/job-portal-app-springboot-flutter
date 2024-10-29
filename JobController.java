// src/main/java/com/example/jobportal/controller/JobController.java
package com.example.jobportal.controller;

import com.example.jobportal.entity.Job;
import com.example.jobportal.entity.User;
import com.example.jobportal.service.JobService;
import com.example.jobportal.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/jobs")
public class JobController {
    @Autowired
    private JobService jobService;

    @Autowired
    private UserService userService;

    // List all jobs
    @GetMapping
    public String listJobs(Model model) {
        List<Job> jobs = jobService.getAllJobs();
        model.addAttribute("jobs", jobs);
        return "jobs";
    }

    // Show job details
    @GetMapping("/{id}")
    public String jobDetails(@PathVariable Long id, Model model) {
        Job job = jobService.getJobById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid job Id:" + id));
        model.addAttribute("job", job);
        return "job-details";
    }

    // Show form to create a new job (employer only)
    @GetMapping("/new")
    public String showCreateJobForm(Model model) {
        model.addAttribute("job", new Job());
        return "create-job";
    }

    // Handle job creation
    @PostMapping("/create")
    public String createJob(@ModelAttribute Job job, Authentication authentication) {
        String username = authentication.getName();
        User employer = userService.findByUsername(username)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user"));
        job.setEmployer(employer);
        jobService.createJob(job);
        return "redirect:/jobs";
    }

    // Additional job-related endpoints (edit, delete) can be added here
}
