<%-- 
    Document   : body
    Created on : 15 thg 6, 2025, 16:36:59
    Author     : mac
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
          <link rel="stylesheet" href="${pageContext.request.contextPath}/css/body.css">
        <title>Dat Villa</title>
    </head>
    <body>
       <c:if test="${empty listAllRoom}">
        <p>Không có Room nào.</p>
        </c:if>
    
    <div class="room-list-wrapper container mt-4 ">
        <div class="row">
            <c:forEach var="a" items="${listAllRoom}">
                <div class="col-md-4 mb-3">
                    <div class="card">

                        <div class="card-body">
                            <p class="card-text">RoomNumber: ${a.room_number}</p>
                            <p class="card-text">Floor: ${a.floor}</p>
                            <p class="card-text">Capacity: ${a.capacity} Person</p>
                            <c:if test="${sessionScope.acc != null}">
                            <a href="bookingroom?aid=${a.id_room}" class="btn btn-primary">Booking</a>
                            
                            </c:if>
                           
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    </body>
</html>
