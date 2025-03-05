<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mx-auto px-4 py-8">
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-bold">Guest List</h1>
        <a href="${pageContext.request.contextPath}/guests/new" 
           class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
            Add New Guest
        </a>
    </div>

    <div class="bg-white shadow-md rounded-lg overflow-hidden">
        <table class="min-w-full">
            <thead class="bg-gray-100">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Phone</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
                <c:forEach var="guest" items="${guests}">
                    <tr>
                        <td class="px-6 py-4">
                            ${guest.firstName} ${guest.lastName}
                        </td>
                        <td class="px-6 py-4">${guest.email}</td>
                        <td class="px-6 py-4">${guest.phone}</td>
                        <td class="px-6 py-4">
                            <a href="${pageContext.request.contextPath}/guests/edit/${guest.guestId}" 
                               class="text-blue-600 hover:text-blue-900 mr-3">Edit</a>
                            <button onclick="deleteGuest(${guest.guestId})" 
                                    class="text-red-600 hover:text-red-900">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
function deleteGuest(id) {
    if (confirm('Are you sure you want to delete this guest?')) {
        fetch('${pageContext.request.contextPath}/guests/' + id, {
            method: 'DELETE'
        }).then(response => {
            if (response.ok) {
                window.location.reload();
            } else {
                alert('Error deleting guest');
            }
        });
    }
}
</script> 