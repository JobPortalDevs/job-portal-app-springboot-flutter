package com.job_portal_app.job_portal_app.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.util.List;
import java.time.LocalDateTime;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "job_applications")
public class JobApplication {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "job_id", nullable = false)
    private Job job;

    @Column(nullable = false)
    private String proficiency;

    @Column(nullable = false)
    private String resumeLink;

    @ElementCollection
    @CollectionTable(name = "job_application_skills", joinColumns = @JoinColumn(name = "job_application_id"))
    @Column(name = "skill")
    private List<String> skills;

    @Column(nullable = false)
    private String graduateValue;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "employer_id", nullable = false)
    private UserProfile employer;

    @Column(nullable = false)
    private LocalDateTime dateApplied = LocalDateTime.now();
}