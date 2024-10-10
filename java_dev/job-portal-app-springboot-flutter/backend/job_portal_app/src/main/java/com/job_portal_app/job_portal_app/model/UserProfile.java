package com.job_portal_app.job_portal_app.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
// @NoArgsConstructor
// @AllArgsConstructor
// @Builder
public class UserProfile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String email;
    private String resume; // Path to the resume file, or can be a Blob for binary data.
    private String role;

    // @Enumerated(EnumType.STRING)
    // private Role role; // USER or EMPLOYER
}
