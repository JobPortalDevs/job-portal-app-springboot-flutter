package com.job_portal_app.job_portal_app.controller;

import lombok.RequiredArgsConstructor;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.job_portal_app.job_portal_app.model.Job;
import com.job_portal_app.job_portal_app.service.JobService;

import java.util.List;

@RestController
@RequestMapping("/api/jobs")
@RequiredArgsConstructor
public class JobController {
    private final JobService jobService;

    @PostMapping
    public ResponseEntity<Job> createJob(@RequestBody Job job) {
        return ResponseEntity.ok(jobService.createJob(job));
    }

    @GetMapping
    public ResponseEntity<List<Job>> getAllJobs() {
        return ResponseEntity.ok(jobService.getAllJobs());
    }

    // @GetMapping("/employer/{employerId}")
    // public ResponseEntity<List<Job>> getJobsByEmployer(@PathVariable Long
    // employerId) {
    // return ResponseEntity.ok(jobService.getJobsByEmployer(employerId));
    // }

    @PutMapping("/{id}/update-job")
    public ResponseEntity<Job> updateJob(@PathVariable Long id, @RequestBody Job job) {
        return ResponseEntity.ok(jobService.updateJob(id, job));
    }

    @DeleteMapping("/{id}/delete")
    public ResponseEntity<HttpStatus> deleteJob(@PathVariable Long id) {
        jobService.deleteJob(id);
        return ResponseEntity.noContent().build();
    }
}
