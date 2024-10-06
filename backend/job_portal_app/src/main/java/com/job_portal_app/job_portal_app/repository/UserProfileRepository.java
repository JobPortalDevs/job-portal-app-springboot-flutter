package com.job_portal_app.job_portal_app.repository;

import com.job_portal_app.job_portal_app.model.UserProfile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserProfileRepository extends JpaRepository<UserProfile, Long> {
}
