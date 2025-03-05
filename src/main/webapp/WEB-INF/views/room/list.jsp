<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mx-auto px-4 py-8">
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-bold">Room List</h1>
        <div class="space-x-4">
            <a href="${pageContext.request.contextPath}/rooms/available" 
               class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600">
                View Available Rooms
            </a>
            <a href="${pageContext.request.contextPath}/rooms/new" 
               class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                Add New Room
            </a>
        </div>
    </div>

    <div class="bg-white shadow-md rounded-lg overflow-hidden">
        <table class="min-w-full">
            <thead class="bg-gray-100">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Room Number</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Type</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Price</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
                <c:forEach var="room" items="${rooms}">
                    <tr>
                        <td class="px-6 py-4">${room.roomNumber}</td>
                        <td class="px-6 py-4">${room.roomType}</td>
                        <td class="px-6 py-4">$${room.price}</td>
                        <td class="px-6 py-4">
                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full 
                                ${room.available ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}">
                                ${room.available ? 'Available' : 'Occupied'}
                            </span>
                        </td>
                        <td class="px-6 py-4">
                            <a href="${pageContext.request.contextPath}/rooms/edit/${room.roomId}" 
                               class="text-blue-600 hover:text-blue-900 mr-3">Edit</a>
                            <button onclick="deleteRoom(${room.roomId})" 
                                    class="text-red-600 hover:text-red-900">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
function deleteRoom(id) {
    if (confirm('Are you sure you want to delete this room?')) {
        fetch('${pageContext.request.contextPath}/rooms/' + id, {
            method: 'DELETE'
        }).then(response => {
            if (response.ok) {
                window.location.reload();
            } else {
                alert('Error deleting room');
            }
        });
    }
}
</script> 