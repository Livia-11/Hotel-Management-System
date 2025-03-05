<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 h-screen flex items-center justify-center">
    <div class="bg-white p-8 rounded-lg shadow-lg">
        <h1 class="text-2xl text-red-600 font-bold mb-4">Error</h1>
        <p class="text-gray-600">An error occurred: ${pageContext.exception.message}</p>
        <a href="/" class="mt-4 inline-block text-blue-600 hover:text-blue-800">Return to Home</a>
    </div>
</body>
</html> 