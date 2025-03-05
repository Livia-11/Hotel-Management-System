<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container mx-auto px-4 py-8">
    <div class="max-w-2xl mx-auto">
        <h1 class="text-2xl font-bold mb-6">
            ${booking == null ? 'New Booking' : 'Edit Booking'}
        </h1>

        <c:if test="${error != null}">
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
                ${error}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/bookings${booking == null ? '' : '/edit/'.concat(booking.bookingId)}" 
              method="post" class="space-y-6" id="bookingForm">
            
            <div>
                <label for="guestId" class="block text-sm font-medium text-gray-700">Guest</label>
                <select id="guestId" name="guestId" required
                        class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">
                    <option value="">Select a guest</option>
                    <c:forEach var="guest" items="${guests}">
                        <option value="${guest.guestId}" ${booking.guest.guestId == guest.guestId ? 'selected' : ''}>
                            ${guest.firstName} ${guest.lastName} (${guest.email})
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div>
                <label for="roomId" class="block text-sm font-medium text-gray-700">Room</label>
                <select id="roomId" name="roomId" required
                        class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">
                    <option value="">Select a room</option>
                    <c:forEach var="room" items="${rooms}">
                        <option value="${room.roomId}" ${booking.room.roomId == room.roomId ? 'selected' : ''}
                                data-price="${room.price}">
                            ${room.roomNumber} - ${room.roomType} ($${room.price}/night)
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label for="checkInDate" class="block text-sm font-medium text-gray-700">Check-in Date</label>
                    <input type="date" id="checkInDate" name="checkInDate" 
                           value="${booking.checkInDate}"
                           min="${booking == null ? java.time.LocalDate.now() : ''}"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
                           required>
                </div>

                <div>
                    <label for="checkOutDate" class="block text-sm font-medium text-gray-700">Check-out Date</label>
                    <input type="date" id="checkOutDate" name="checkOutDate" 
                           value="${booking.checkOutDate}"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
                           required>
                </div>
            </div>

            <div class="bg-gray-50 p-4 rounded-lg">
                <h3 class="text-lg font-medium text-gray-900 mb-2">Booking Summary</h3>
                <div class="space-y-2">
                    <div class="flex justify-between">
                        <span class="text-gray-600">Number of Nights:</span>
                        <span id="nightsCount">-</span>
                    </div>
                    <div class="flex justify-between">
                        <span class="text-gray-600">Price per Night:</span>
                        <span id="pricePerNight">-</span>
                    </div>
                    <div class="flex justify-between font-bold">
                        <span class="text-gray-900">Total Price:</span>
                        <span id="totalPrice">-</span>
                    </div>
                </div>
            </div>

            <div class="flex justify-end space-x-4">
                <a href="${pageContext.request.contextPath}/bookings"
                   class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">Cancel</a>
                <button type="submit"
                        class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                    ${booking == null ? 'Create Booking' : 'Update Booking'}
                </button>
            </div>
        </form>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('bookingForm');
    const checkInDate = document.getElementById('checkInDate');
    const checkOutDate = document.getElementById('checkOutDate');
    const roomSelect = document.getElementById('roomId');
    const nightsCount = document.getElementById('nightsCount');
    const pricePerNight = document.getElementById('pricePerNight');
    const totalPrice = document.getElementById('totalPrice');

    function updateSummary() {
        const checkIn = new Date(checkInDate.value);
        const checkOut = new Date(checkOutDate.value);
        const selectedRoom = roomSelect.options[roomSelect.selectedIndex];

        if (checkInDate.value && checkOutDate.value && selectedRoom.value) {
            const nights = Math.round((checkOut - checkIn) / (1000 * 60 * 60 * 24));
            const price = parseFloat(selectedRoom.dataset.price);
            
            if (nights > 0) {
                nightsCount.textContent = nights;
                pricePerNight.textContent = `$${price.toFixed(2)}`;
                totalPrice.textContent = `$${(nights * price).toFixed(2)}`;
            } else {
                nightsCount.textContent = '-';
                pricePerNight.textContent = '-';
                totalPrice.textContent = '-';
            }
        }
    }

    checkInDate.addEventListener('change', function() {
        // Set minimum check-out date to the day after check-in
        const minCheckOut = new Date(checkInDate.value);
        minCheckOut.setDate(minCheckOut.getDate() + 1);
        checkOutDate.min = minCheckOut.toISOString().split('T')[0];
        
        if (checkOutDate.value && new Date(checkOutDate.value) <= new Date(checkInDate.value)) {
            checkOutDate.value = minCheckOut.toISOString().split('T')[0];
        }
        
        updateSummary();
    });

    checkOutDate.addEventListener('change', updateSummary);
    roomSelect.addEventListener('change', updateSummary);

    // Initialize summary if editing existing booking
    if (checkInDate.value && checkOutDate.value && roomSelect.value) {
        updateSummary();
    }
});
</script> 