<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="max-w-7xl mx-auto px-4 py-8">
    <!-- Hero Section -->
    <div class="relative bg-white rounded-xl shadow-lg overflow-hidden mb-12">
        <div class="absolute inset-0 bg-[url('https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80')] bg-cover bg-center"></div>
        <div class="relative bg-gray-900 bg-opacity-75 py-32 px-6 sm:px-12">
            <div class="max-w-3xl">
                <h1 class="text-5xl font-bold text-white mb-6">Welcome to Luxury Hotel</h1>
                <p class="text-xl text-gray-200 mb-8">Experience unparalleled luxury and comfort in the heart of the city.</p>
                <a href="/bookings/new" class="inline-block bg-blue-600 text-white px-8 py-4 rounded-lg text-lg font-semibold hover:bg-blue-700 transition duration-300 transform hover:scale-105">
                    Book Your Stay
                </a>
            </div>
        </div>
    </div>

    <!-- Features Grid -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-12">
        <!-- Room Types -->
        <div class="bg-white p-8 rounded-xl shadow-lg transform hover:scale-105 transition duration-300">
            <div class="text-blue-600 mb-4">
                <i class="fas fa-bed text-4xl"></i>
            </div>
            <h2 class="text-2xl font-semibold mb-4">Luxurious Rooms</h2>
            <p class="text-gray-600">Immerse yourself in our meticulously designed rooms, featuring premium amenities and stunning views.</p>
        </div>

        <!-- Services -->
        <div class="bg-white p-8 rounded-xl shadow-lg transform hover:scale-105 transition duration-300">
            <div class="text-blue-600 mb-4">
                <i class="fas fa-concierge-bell text-4xl"></i>
            </div>
            <h2 class="text-2xl font-semibold mb-4">Premium Services</h2>
            <p class="text-gray-600">24/7 concierge, spa treatments, fine dining, and more to make your stay exceptional.</p>
        </div>

        <!-- Location -->
        <div class="bg-white p-8 rounded-xl shadow-lg transform hover:scale-105 transition duration-300">
            <div class="text-blue-600 mb-4">
                <i class="fas fa-map-marker-alt text-4xl"></i>
            </div>
            <h2 class="text-2xl font-semibold mb-4">Prime Location</h2>
            <p class="text-gray-600">Located in the city center, with easy access to attractions, shopping, and dining.</p>
        </div>
    </div>

    <!-- Featured Rooms -->
    <div class="bg-white rounded-xl shadow-lg p-8">
        <h2 class="text-3xl font-bold mb-8 text-center">Featured Rooms</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- Room Card 1 -->
            <div class="rounded-xl overflow-hidden shadow-lg transform hover:scale-105 transition duration-300">
                <div class="h-64 bg-[url('https://images.unsplash.com/photo-1578683010236-d716f9a3f461?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80')] bg-cover bg-center"></div>
                <div class="p-6">
                    <h3 class="text-xl font-semibold mb-2">Deluxe Suite</h3>
                    <p class="text-gray-600 mb-4">Spacious suite with city views</p>
                    <div class="flex justify-between items-center">
                        <span class="text-blue-600 font-bold">From $200/night</span>
                        <a href="/rooms/deluxe" class="text-blue-600 hover:text-blue-800">View Details →</a>
                    </div>
                </div>
            </div>

            <!-- Room Card 2 -->
            <div class="rounded-xl overflow-hidden shadow-lg transform hover:scale-105 transition duration-300">
                <div class="h-64 bg-[url('https://images.unsplash.com/photo-1590490360182-c33d57733427?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80')] bg-cover bg-center"></div>
                <div class="p-6">
                    <h3 class="text-xl font-semibold mb-2">Executive Room</h3>
                    <p class="text-gray-600 mb-4">Modern comfort for business travelers</p>
                    <div class="flex justify-between items-center">
                        <span class="text-blue-600 font-bold">From $150/night</span>
                        <a href="/rooms/executive" class="text-blue-600 hover:text-blue-800">View Details →</a>
                    </div>
                </div>
            </div>

            <!-- Room Card 3 -->
            <div class="rounded-xl overflow-hidden shadow-lg transform hover:scale-105 transition duration-300">
                <div class="h-64 bg-[url('https://images.unsplash.com/photo-1592229505726-ca121723b8ef?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80')] bg-cover bg-center"></div>
                <div class="p-6">
                    <h3 class="text-xl font-semibold mb-2">Standard Room</h3>
                    <p class="text-gray-600 mb-4">Comfortable and affordable</p>
                    <div class="flex justify-between items-center">
                        <span class="text-blue-600 font-bold">From $100/night</span>
                        <a href="/rooms/standard" class="text-blue-600 hover:text-blue-800">View Details →</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 