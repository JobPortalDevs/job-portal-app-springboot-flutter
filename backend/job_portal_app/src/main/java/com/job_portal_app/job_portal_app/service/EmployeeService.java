package com.job_portal_app.job_portal_app.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.job_portal_app.job_portal_app.model.Employee;
import com.job_portal_app.job_portal_app.repository.EmployeeRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class EmployeeService {
    private final EmployeeRepository employeeRepository;

    public Employee createEmployee(Employee employee) {
        return employeeRepository.save(employee);
    }

    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }
}
