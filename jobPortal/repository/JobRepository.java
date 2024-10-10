// src/main/java/com/example/jobportal/repository/JobRepository.java
package com.example.jobportal.repository;

import com.example.jobportal.entity.Job;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface JobRepository extends JpaRepository<Job, Long> {
    List<Job> findByTitleContainingIgnoreCase(String title);
    List<Job> findByLocationContainingIgnoreCase(String location);
    // Add more query methods as needed
}
