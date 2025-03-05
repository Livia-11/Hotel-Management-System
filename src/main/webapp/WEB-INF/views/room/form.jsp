<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mx-auto px-4 py-8">
    <div class="max-w-2xl mx-auto">
        <h1 class="text-2xl font-bold mb-6">
            ${room == null ? 'Add New Room' : 'Edit Room'}
        </h1>

        <c:if test="${error != null}">
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
                ${error}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/rooms${room == null ? '' : '/edit/'.concat(room.roomId)}" 
              method="post" class="space-y-4">
            <div>
                <label for="roomNumber" class="block text-sm font-medium text-gray-700">Room Number</label>
                <input type="text" id="roomNumber" name="roomNumber" value="${room.roomNumber}"
                       class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
                       required>
            </div>

            <div>
                <label for="roomType" class="block text-sm font-medium text-gray-700">Room Type</label>
                <select id="roomType" name="roomType"
                        class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
                        required>
                    <option value="">Select a type</option>
                    <option value="Standard" ${room.roomType == 'Standard' ? 'selected' : ''}>Standard</option>
                    <option value="Deluxe" ${room.roomType == 'Deluxe' ? 'selected' : ''}>Deluxe</option>
                    <option value="Suite" ${room.roomType == 'Suite' ? 'selected' : ''}>Suite</option>
                    <option value="Executive" ${room.roomType == 'Executive' ? 'selected' : ''}>Executive</option>
                </select>
            </div>

            <div>
                <label for="price" class="block text-sm font-medium text-gray-700">Price per Night</label>
                <input type="number" id="price" name="price" value="${room.price}"
                       class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
                       step="0.01" min="0" required>
            </div>

            <div>
                <label for="description" class="block text-sm font-medium text-gray-700">Description</label>
                <textarea id="description" name="description" rows="3"
                         class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">${room.description}</textarea>
            </div>

            <div class="flex items-center">
                <input type="checkbox" id="isAvailable" name="isAvailable" 
                       ${room == null || room.available ? 'checked' : ''}
                       class="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300 rounded">
                <label for="isAvailable" class="ml-2 block text-sm text-gray-900">
                    Available for booking
                </label>
            </div>

            <div class="flex justify-end space-x-4">
                <a href="${pageContext.request.contextPath}/rooms"
                   class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">Cancel</a>
                <button type="submit"
                        class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                    ${room == null ? 'Create Room' : 'Update Room'}
                </button>
            </div>
        </form>
    </div>
</div> 