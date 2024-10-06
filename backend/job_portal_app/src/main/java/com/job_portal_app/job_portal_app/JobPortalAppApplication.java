package com.job_portal_app.job_portal_app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan(basePackages = "com.job_portal_app.job_portal_app.model") // Entity scanning
@EnableJpaRepositories(basePackages = "com.job_portal_app.job_portal_app.repository") // Repository scanning
public class JobPortalAppApplication {
	public static void main(String[] args) {
		SpringApplication.run(JobPortalAppApplication.class, args);
	}
}
