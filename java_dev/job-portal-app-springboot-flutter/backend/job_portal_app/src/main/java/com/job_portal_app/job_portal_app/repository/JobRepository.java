package com.job_portal_app.job_portal_app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.job_portal_app.job_portal_app.model.Job;
import java.util.List;

public interface JobRepository extends JpaRepository<Job, Long> {
    // List<Job> findByEmployer_Id(Long employerId);
}
