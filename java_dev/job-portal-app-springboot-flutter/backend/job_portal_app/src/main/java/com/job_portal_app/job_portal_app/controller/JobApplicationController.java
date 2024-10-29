package com.job_portal_app.job_portal_app.controller;

import com.job_portal_app.job_portal_app.model.JobApplication;
import com.job_portal_app.job_portal_app.model.UserProfile;
import com.job_portal_app.job_portal_app.service.JobApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/applications")
public class JobApplicationController {

    @Autowired
    private JobApplicationService jobApplicationService;

    @PostMapping
    public ResponseEntity<JobApplication> submitApplication(@Validated @RequestBody JobApplication jobApplication) {
        JobApplication newApplication = jobApplicationService.submitApplication(jobApplication);
        return ResponseEntity.ok(newApplication);
    }

    @GetMapping
    public ResponseEntity<List<JobApplication>> getAllApplications() {
        List<JobApplication> applications = jobApplicationService.getAllApplications();
        return ResponseEntity.ok(applications);
    }

    @GetMapping("/{id}")
    public ResponseEntity<JobApplication> getApplicationById(@PathVariable Long id) {
        JobApplication application = jobApplicationService.getApplicationById(id);
        return ResponseEntity.ok(application);
    }

    @GetMapping("/employer/{employerId}")
    public ResponseEntity<List<JobApplication>> getApplicationsByEmployer(@PathVariable UserProfile employer) {
        List<JobApplication> applications = jobApplicationService.getApplicationsByEmployer(employer);
        return ResponseEntity.ok(applications);
    }

    @GetMapping("/job/{jobId}")
    public ResponseEntity<List<JobApplication>> getApplicationsByJobId(@PathVariable Long jobId) {
        List<JobApplication> applications = jobApplicationService.getApplicationsByJobId(jobId);
        return ResponseEntity.ok(applications);
    }

    @PutMapping("/{id}")
    public ResponseEntity<JobApplication> updateApplication(
            @PathVariable Long id,
            @Validated @RequestBody JobApplication applicationDetails) {
        JobApplication updatedApplication = jobApplicationService.updateApplication(id, applicationDetails);
        return ResponseEntity.ok(updatedApplication);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteApplication(@PathVariable Long id) {
        jobApplicationService.deleteApplication(id);
        return ResponseEntity.ok().build();
    }
}