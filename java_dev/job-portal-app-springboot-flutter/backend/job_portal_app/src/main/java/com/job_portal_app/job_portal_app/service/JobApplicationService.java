package com.job_portal_app.job_portal_app.service;

import com.job_portal_app.job_portal_app.model.JobApplication;
import com.job_portal_app.job_portal_app.model.UserProfile;
import com.job_portal_app.job_portal_app.repository.JobApplicationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class JobApplicationService {

    @Autowired
    private JobApplicationRepository jobApplicationRepository;

    public JobApplication submitApplication(JobApplication jobApplication) {
        // Check if application already exists
        boolean exists = jobApplicationRepository.existsByJobIdAndEmployerId(
                jobApplication.getJob().getId(),
                jobApplication.getEmployer().getId());

        if (exists) {
            throw new IllegalStateException("You have already applied for this job");
        }

        return jobApplicationRepository.save(jobApplication);
    }

    public List<JobApplication> getAllApplications() {
        return jobApplicationRepository.findAll();
    }

    public JobApplication getApplicationById(Long id) {
        return jobApplicationRepository.findById(id)
                .orElseThrow();
    }

    public List<JobApplication> getApplicationsByEmployer(UserProfile employer) {
        return jobApplicationRepository.findByEmployer(employer);
    }

    public List<JobApplication> getApplicationsByJobId(Long jobId) {
        return jobApplicationRepository.findByJobId(jobId);
    }

    public JobApplication updateApplication(Long id, JobApplication applicationDetails) {
        JobApplication application = getApplicationById(id);

        application.setProficiency(applicationDetails.getProficiency());
        application.setResumeLink(applicationDetails.getResumeLink());
        application.setSkills(applicationDetails.getSkills());
        application.setGraduateValue(applicationDetails.getGraduateValue());

        return jobApplicationRepository.save(application);
    }

    public void deleteApplication(Long id) {
        JobApplication application = getApplicationById(id);
        jobApplicationRepository.delete(application);
    }
}