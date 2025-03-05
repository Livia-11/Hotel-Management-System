<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Management System</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <!-- Navigation -->
    <nav class="bg-blue-600 text-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between h-16">
                <div class="flex items-center">
                    <a href="/" class="font-bold text-xl">Hotel Management</a>
                </div>
                <div class="flex items-center space-x-4">
                    <a href="/rooms" class="hover:bg-blue-700 px-3 py-2 rounded">Rooms</a>
                    <a href="/bookings" class="hover:bg-blue-700 px-3 py-2 rounded">Bookings</a>
                    <a href="/guests" class="hover:bg-blue-700 px-3 py-2 rounded">Guests</a>
                    <a href="/services" class="hover:bg-blue-700 px-3 py-2 rounded">Services</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Content -->
    <div class="container mx-auto px-4 py-8">
        <jsp:include page="../${content}.jsp" />
    </div>

    <!-- Footer -->
    <footer class="bg-gray-800 text-white mt-8">
        <div class="max-w-7xl mx-auto px-4 py-6">
            <p class="text-center">© 2024 Hotel Management System. All rights reserved.</p>
        </div>
    </footer>
</body>
</html> 