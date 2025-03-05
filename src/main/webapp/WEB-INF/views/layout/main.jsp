<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Management System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Add Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">
    <!-- Navigation -->
    <nav class="bg-gradient-to-r from-blue-800 to-blue-600 text-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between h-16">
                <div class="flex items-center">
                    <a href="/" class="flex items-center">
                        <i class="fas fa-hotel text-2xl mr-2"></i>
                        <span class="font-bold text-xl">Luxury Hotel</span>
                    </a>
                </div>
                <div class="flex items-center space-x-4">
                    <a href="/rooms" class="hover:bg-blue-700 px-3 py-2 rounded-md transition duration-150 flex items-center">
                        <i class="fas fa-bed mr-2"></i> Rooms
                    </a>
                    <a href="/bookings" class="hover:bg-blue-700 px-3 py-2 rounded-md transition duration-150 flex items-center">
                        <i class="fas fa-calendar-alt mr-2"></i> Bookings
                    </a>
                    <a href="/guests" class="hover:bg-blue-700 px-3 py-2 rounded-md transition duration-150 flex items-center">
                        <i class="fas fa-users mr-2"></i> Guests
                    </a>
                    <a href="/services" class="hover:bg-blue-700 px-3 py-2 rounded-md transition duration-150 flex items-center">
                        <i class="fas fa-concierge-bell mr-2"></i> Services
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Content -->
    <div class="flex-grow">
        <jsp:include page="../${content}.jsp" />
    </div>

    <!-- Footer -->
    <footer class="bg-gray-800 text-white mt-auto">
        <div class="max-w-7xl mx-auto px-4 py-6">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div>
                    <h3 class="text-lg font-semibold mb-2">Contact Us</h3>
                    <p class="text-gray-400"><i class="fas fa-phone mr-2"></i> +1 234 567 890</p>
                    <p class="text-gray-400"><i class="fas fa-envelope mr-2"></i> info@luxuryhotel.com</p>
                </div>
                <div>
                    <h3 class="text-lg font-semibold mb-2">Quick Links</h3>
                    <ul class="text-gray-400">
                        <li><a href="/about" class="hover:text-white">About Us</a></li>
                        <li><a href="/contact" class="hover:text-white">Contact</a></li>
                        <li><a href="/privacy" class="hover:text-white">Privacy Policy</a></li>
                    </ul>
                </div>
                <div>
                    <h3 class="text-lg font-semibold mb-2">Follow Us</h3>
                    <div class="flex space-x-4">
                        <a href="#" class="text-gray-400 hover:text-white"><i class="fab fa-facebook"></i></a>
                        <a href="#" class="text-gray-400 hover:text-white"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="text-gray-400 hover:text-white"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="text-center mt-8 text-gray-400">
                <p>© 2024 Luxury Hotel. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html> 