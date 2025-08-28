<%-- 
    Document   : user
    Created on : 15 thg 6, 2025, 17:12:43
    Author     : mac
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <title>Your Room</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/printbooking.css">
    </head>
    <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="<%= application.getContextPath() %>/room">Back</a>   
    </nav>
     <table>
    <thead>
        <tr>
   
            <th>Room Number</th>
            <th>BookingDate</th>
            <th>Check-in</th>
            <th>Check-out</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="b" items="${bookingByCusId}">
            <tr class="printRoomById">
               
                <td>${b.room_number}</td>
                <td>${b.booking_date}</td>                
                <td>${b.start_time}</td>
                <td>${b.end_time}</td>
         
                <td>
                   
                    <a href="delete?bid=${b.id_booking}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
    </body>
</html>
