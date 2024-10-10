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

    @SuppressWarnings("rawtypes")
    private final UserProfileRepository userProfileRepository;

    @SuppressWarnings("unchecked")
    public UserProfile createUserProfile(UserProfile userProfile) {
        return (UserProfile) userProfileRepository.save(userProfile);
    }

    public UserProfile updateUserProfile(UserProfile userProfile) {
        return (UserProfile) userProfileRepository.save(userProfile);
    }

    @SuppressWarnings("unchecked")
    public List<UserProfile> getAllProfiles() {
        return userProfileRepository.findAll();
    }
}
