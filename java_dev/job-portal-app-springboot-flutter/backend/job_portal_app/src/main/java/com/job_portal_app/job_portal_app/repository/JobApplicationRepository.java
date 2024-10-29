package com.job_portal_app.job_portal_app.repository;

import com.job_portal_app.job_portal_app.model.JobApplication;
import com.job_portal_app.job_portal_app.model.UserProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface JobApplicationRepository extends JpaRepository<JobApplication, Long> {
    List<JobApplication> findByEmployer(UserProfile employer);

    List<JobApplication> findByJobId(Long jobId);

    boolean existsByJobIdAndEmployerId(Long jobId, Long employerId);
}