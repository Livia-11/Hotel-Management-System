<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container mx-auto px-4 py-8">
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-bold">Bookings</h1>
        <a href="${pageContext.request.contextPath}/bookings/new" 
           class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
            New Booking
        </a>
    </div>

    <div class="bg-white shadow-md rounded-lg overflow-hidden">
        <table class="min-w-full">
            <thead class="bg-gray-100">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Guest</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Room</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Check In</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Check Out</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Total Price</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
                <c:forEach var="booking" items="${bookings}">
                    <tr>
                        <td class="px-6 py-4">
                            ${booking.guest.firstName} ${booking.guest.lastName}
                        </td>
                        <td class="px-6 py-4">
                            ${booking.room.roomNumber} (${booking.room.roomType})
                        </td>
                        <td class="px-6 py-4">${booking.checkInDate}</td>
                        <td class="px-6 py-4">${booking.checkOutDate}</td>
                        <td class="px-6 py-4">$${booking.totalPrice}</td>
                        <td class="px-6 py-4">
                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full 
                                ${booking.status == 'CONFIRMED' ? 'bg-green-100 text-green-800' : 
                                  booking.status == 'PENDING' ? 'bg-yellow-100 text-yellow-800' : 
                                  'bg-red-100 text-red-800'}">
                                ${booking.status}
                            </span>
                        </td>
                        <td class="px-6 py-4">
                            <a href="${pageContext.request.contextPath}/bookings/edit/${booking.bookingId}" 
                               class="text-blue-600 hover:text-blue-900 mr-3">Edit</a>
                            <c:if test="${booking.status != 'CANCELLED'}">
                                <button onclick="cancelBooking(${booking.bookingId})" 
                                        class="text-red-600 hover:text-red-900">Cancel</button>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
function cancelBooking(id) {
    if (confirm('Are you sure you want to cancel this booking?')) {
        fetch('${pageContext.request.contextPath}/bookings/cancel/' + id, {
            method: 'POST'
        }).then(response => {
            if (response.ok) {
                window.location.reload();
            } else {
                alert('Error cancelling booking');
            }
        });
    }
}
</script> 