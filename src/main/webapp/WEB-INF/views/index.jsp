<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="max-w-7xl mx-auto">
    <!-- Hero Section -->
    <div class="bg-white rounded-lg shadow-lg p-8 mb-8">
        <h1 class="text-4xl font-bold text-gray-800 mb-4">Welcome to Our Hotel</h1>
        <p class="text-gray-600 text-lg mb-6">Experience luxury and comfort at its finest.</p>
        <a href="/bookings/new" class="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition">
            Book Now
        </a>
    </div>

    <!-- Features Grid -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-8">
        <!-- Room Types -->
        <div class="bg-white p-6 rounded-lg shadow-lg">
            <h2 class="text-xl font-semibold mb-4">Luxurious Rooms</h2>
            <p class="text-gray-600">Choose from our selection of carefully designed rooms.</p>
        </div>

        <!-- Services -->
        <div class="bg-white p-6 rounded-lg shadow-lg">
            <h2 class="text-xl font-semibold mb-4">Premium Services</h2>
            <p class="text-gray-600">Enjoy our world-class services and amenities.</p>
        </div>

        <!-- Location -->
        <div class="bg-white p-6 rounded-lg shadow-lg">
            <h2 class="text-xl font-semibold mb-4">Prime Location</h2>
            <p class="text-gray-600">Situated in the heart of the city.</p>
        </div>
    </div>

    <!-- Featured Rooms -->
    <div class="bg-white rounded-lg shadow-lg p-8">
        <h2 class="text-2xl font-bold mb-6">Featured Rooms</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <!-- Room Card 1 -->
            <div class="border rounded-lg overflow-hidden">
                <div class="h-48 bg-gray-200"></div>
                <div class="p-4">
                    <h3 class="font-semibold">Deluxe Suite</h3>
                    <p class="text-gray-600">From $200/night</p>
                </div>
            </div>

            <!-- Room Card 2 -->
            <div class="border rounded-lg overflow-hidden">
                <div class="h-48 bg-gray-200"></div>
                <div class="p-4">
                    <h3 class="font-semibold">Executive Room</h3>
                    <p class="text-gray-600">From $150/night</p>
                </div>
            </div>

            <!-- Room Card 3 -->
            <div class="border rounded-lg overflow-hidden">
                <div class="h-48 bg-gray-200"></div>
                <div class="p-4">
                    <h3 class="font-semibold">Standard Room</h3>
                    <p class="text-gray-600">From $100/night</p>
                </div>
            </div>
        </div>
    </div>
</div> 