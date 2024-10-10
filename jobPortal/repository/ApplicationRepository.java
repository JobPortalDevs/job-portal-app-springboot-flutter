// src/main/java/com/example/jobportal/repository/ApplicationRepository.java
package com.example.jobportal.repository;

import com.example.jobportal.entity.Application;
import com.example.jobportal.entity.Job;
import com.example.jobportal.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ApplicationRepository extends JpaRepository<Application, Long> {
    List<Application> findByApplicant(User applicant);
    List<Application> findByJob(Job job);
}
