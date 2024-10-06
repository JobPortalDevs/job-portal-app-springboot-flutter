package com.job_portal_app.job_portal_app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.job_portal_app.job_portal_app.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
}
