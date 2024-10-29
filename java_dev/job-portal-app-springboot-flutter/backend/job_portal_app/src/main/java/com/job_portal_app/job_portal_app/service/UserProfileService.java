package com.job_portal_app.job_portal_app.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.job_portal_app.job_portal_app.model.UserProfile;
import com.job_portal_app.job_portal_app.repository.UserProfileRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserProfileService {

    public void deleteUserProfile(Long id) {
        userProfileRepository.deleteById(id);
    }

    private final UserProfileRepository userProfileRepository;

    public UserProfile createUserProfile(UserProfile userProfile) {
        return (UserProfile) userProfileRepository.save(userProfile);
    }

    public UserProfile updateUserProfile(Long id, UserProfile userProfile) {
        return (UserProfile) userProfileRepository.save(userProfile);
    }

    public List<UserProfile> getAllProfiles() {
        return userProfileRepository.findAll();
    }
}
