package com.hotel.mgt.hotelmanagementsystem.service;

import com.hotel.mgt.hotelmanagementsystem.dao.ServiceDAO;
import com.hotel.mgt.hotelmanagementsystem.model.Service;
import java.math.BigDecimal;
import java.util.List;

public class ServiceService {
    private final ServiceDAO serviceDAO;

    public ServiceService() {
        this.serviceDAO = new ServiceDAO();
    }

    public void addService(Service service) {
        // Validation
        if (service.getServiceName() == null || service.getServiceName().trim().isEmpty()) {
            throw new IllegalArgumentException("Service name is required");
        }
        if (service.getPrice() == null || service.getPrice().compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Valid price is required");
        }

        serviceDAO.save(service);
    }

    public Service getServiceById(int id) {
        return serviceDAO.findById(id);
    }

    public List<Service> getAllServices() {
        return serviceDAO.findAll();
    }

    public void updateService(Service service) {
        if (service.getServiceId() <= 0) {
            throw new IllegalArgumentException("Invalid service ID");
        }
        serviceDAO.update(service);
    }

    public void deleteService(Service service) {
        serviceDAO.delete(service);
    }
} 