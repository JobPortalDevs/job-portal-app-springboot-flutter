package com.job_portal_app.job_portal_app.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.job_portal_app.job_portal_app.model.Job;
import com.job_portal_app.job_portal_app.repository.JobRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class JobService {
    private final JobRepository jobRepository;

    public Job createJob(Job job) {
        return jobRepository.save(job);
    }

    // public List<Job> getJobsByEmployer(Long employerId) {
    // return jobRepository.findByEmployer_Id(employerId);
    // }

    public List<Job> getAllJobs() {
        return jobRepository.findAll();
    }

    public Job updateJob(Long id, Job job) {
        return (Job) jobRepository.save(job);
    }

    public void deleteJob(Long id) {
        jobRepository.deleteById(id);
    }
}
