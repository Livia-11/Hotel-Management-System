package com.hotel.mgt.hotelmanagementsystem.service;

import com.hotel.mgt.hotelmanagementsystem.dao.EmployeeDAO;
import com.hotel.mgt.hotelmanagementsystem.model.Employee;
import java.util.List;

public class EmployeeService {
    private final EmployeeDAO employeeDAO;

    public EmployeeService() {
        this.employeeDAO = new EmployeeDAO();
    }

    public void addEmployee(Employee employee) {
        // Validation
        if (employee.getEmail() == null || employee.getEmail().trim().isEmpty()) {
            throw new IllegalArgumentException("Email is required");
        }
        if (employee.getFirstName() == null || employee.getFirstName().trim().isEmpty()) {
            throw new IllegalArgumentException("First name is required");
        }
        if (employee.getLastName() == null || employee.getLastName().trim().isEmpty()) {
            throw new IllegalArgumentException("Last name is required");
        }
        if (employee.getPosition() == null || employee.getPosition().trim().isEmpty()) {
            throw new IllegalArgumentException("Position is required");
        }
        
        // Check if email already exists
        if (employeeDAO.findByEmail(employee.getEmail()) != null) {
            throw new IllegalArgumentException("Email already exists");
        }

        employeeDAO.save(employee);
    }

    public Employee getEmployeeById(int id) {
        return employeeDAO.findById(id);
    }

    public List<Employee> getAllEmployees() {
        return employeeDAO.findAll();
    }

    public Employee getEmployeeByEmail(String email) {
        return employeeDAO.findByEmail(email);
    }

    public void updateEmployee(Employee employee) {
        if (employee.getEmployeeId() <= 0) {
            throw new IllegalArgumentException("Invalid employee ID");
        }
        employeeDAO.update(employee);
    }

    public void deleteEmployee(Employee employee) {
        employeeDAO.delete(employee);
    }
} 