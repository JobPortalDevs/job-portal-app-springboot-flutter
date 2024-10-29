package com.job_portal_app.job_portal_app.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Data
// @NoArgsConstructor
// @AllArgsConstructor
// @Builder
public class Job {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String description;
    private String location;
    private String companyName;
    private LocalDateTime postedDate;
    private LocalDateTime applicationDeadline;

    @ManyToOne
    @JoinColumn(name = "employer_id")
    private UserProfile employer; // Relation with employer profile
}
