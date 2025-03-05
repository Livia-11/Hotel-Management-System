package com.hotel.mgt.hotelmanagementsystem.controller;

import com.hotel.mgt.hotelmanagementsystem.model.Service;
import com.hotel.mgt.hotelmanagementsystem.service.ServiceService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(name = "serviceController", urlPatterns = {"/services", "/services/*"})
public class ServiceController extends HttpServlet {
    private final ServiceService serviceService = new ServiceService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        if (pathInfo == null || pathInfo.equals("/")) {
            // List all services
            request.setAttribute("services", serviceService.getAllServices());
            request.setAttribute("content", "service/list");
        } else if (pathInfo.equals("/new")) {
            // Show create form
            request.setAttribute("content", "service/form");
        } else if (pathInfo.startsWith("/edit/")) {
            // Show edit form
            int id = Integer.parseInt(pathInfo.substring(6));
            request.setAttribute("service", serviceService.getServiceById(id));
            request.setAttribute("content", "service/form");
        }
        
        request.getRequestDispatcher("/WEB-INF/views/layout/main.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        try {
            if (pathInfo == null || pathInfo.equals("/")) {
                // Create new service
                Service service = new Service();
                populateService(service, request);
                serviceService.addService(service);
                response.sendRedirect(request.getContextPath() + "/services");
                return;
            }
            
            if (pathInfo.startsWith("/edit/")) {
                // Update existing service
                int id = Integer.parseInt(pathInfo.substring(6));
                Service service = serviceService.getServiceById(id);
                populateService(service, request);
                serviceService.updateService(service);
                response.sendRedirect(request.getContextPath() + "/services");
                return;
            }
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            request.setAttribute("content", "service/form");
            request.getRequestDispatcher("/WEB-INF/views/layout/main.jsp").forward(request, response);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        if (pathInfo != null && pathInfo.startsWith("/")) {
            int id = Integer.parseInt(pathInfo.substring(1));
            Service service = serviceService.getServiceById(id);
            if (service != null) {
                serviceService.deleteService(service);
                response.setStatus(HttpServletResponse.SC_OK);
                return;
            }
        }
        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
    }

    private void populateService(Service service, HttpServletRequest request) {
        service.setServiceName(request.getParameter("serviceName"));
        service.setDescription(request.getParameter("description"));
        service.setPrice(new BigDecimal(request.getParameter("price")));
    }
} 