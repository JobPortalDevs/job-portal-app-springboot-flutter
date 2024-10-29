package com.job_portal_app.job_portal_app.controller;

import lombok.RequiredArgsConstructor;

import org.springframework.http.HttpStatus;
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

    /*
     * CREATE - PostMapping
     * READ - GetMapping
     * UPDATE - PutMapping
     * DELETE - DeleteMapping
     */

    @PostMapping
    public ResponseEntity<UserProfile> createUserProfile(@RequestBody UserProfile userProfile) {
        return ResponseEntity.ok(userProfileService.createUserProfile(userProfile));
    }

    @GetMapping
    public ResponseEntity<List<UserProfile>> getAllUserProfiles() {
        return ResponseEntity.ok(userProfileService.getAllProfiles());
    }

    @PutMapping("/{id}/update")
    public ResponseEntity<UserProfile> updateUserProfile(@PathVariable Long id, @RequestBody UserProfile userProfile) {
        return ResponseEntity.ok(userProfileService.updateUserProfile(id, userProfile));
    }

    @DeleteMapping("/{id}/delete")
    public ResponseEntity<HttpStatus> deleteUserProfile(@PathVariable Long id) {
        userProfileService.deleteUserProfile(id);
        return ResponseEntity.noContent().build();
    }
}