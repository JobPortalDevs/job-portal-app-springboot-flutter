package com.job_portal_app.job_portal_app.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
// @NoArgsConstructor
// @AllArgsConstructor
// @Builder
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String email;

    @OneToOne
    @JoinColumn(name = "user_profile_id")
    private UserProfile userProfile;
}
