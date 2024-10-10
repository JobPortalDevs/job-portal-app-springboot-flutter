package com.job_portal_app.job_portal_app.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.job_portal_app.job_portal_app.model.UserProfile;
import com.job_portal_app.job_portal_app.service.UserProfileService;

import java.util.List;

@RestController
@RequestMapping("/api/user-profiles")
@RequiredArgsConstructor
public class UserProfileController {
    private final UserProfileService userProfileService;

    @PostMapping
    public ResponseEntity<UserProfile> createUserProfile(@RequestBody UserProfile userProfile) {
        return ResponseEntity.ok(userProfileService.createUserProfile(userProfile));
    }

    @GetMapping
    public ResponseEntity<List<UserProfile>> getAllUserProfiles() {
        return ResponseEntity.ok(userProfileService.getAllProfiles());
    }
}
