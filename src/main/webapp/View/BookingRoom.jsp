<%-- 
    Document   : BookingRoom
    Created on : 15 thg 6, 2025, 17:15:34
    Author     : mac
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkBooking.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Booking</title>
     
    </head>
    <body>
     
     
     <div id="bookingForm" class="modal" style="display: none;">
    <div class="modal-content">
        <span class="close-btn" onclick="window.location.href='room'">&times;</span>
        <form action="<%= application.getContextPath() %>/bookingroom" method="post" >
           
             <input type="hidden" name="id" value="${detailR.id_room}">
            <h4 style="text-align: center;">Check Your Room</h4>
            <div class="form-group">
                <label> Room Number</label>
               <input value="${detailR.room_number}" class="form-control" name="roomNumber" placeholder="Room Number" readonly>
            </div>
            
            <div class="form-group">
                 <label>Capacity</label>
               <input value="${detailR.capacity}" class="form-control" name="capacity" placeholder="Capacity" readonly>
            </div>
             <div class="form-group">
                  <label>Floor</label>
                <input value="${detailR.floor}" class="form-control" name="floor" placeholder="Floor" readonly>
            </div>                                           
           <div class="form-group">
               <label>Check-in Date & Time </label>
               <input id="checkIn" type="datetime-local" class="form-control" name="checkIn" value="${sessionScope.checkIn}" readonly>
           </div>

         
           <div class="form-group">
               <label>Check-out Date & Time </label>
               <input id="checkOut" type="datetime-local" class="form-control" name="checkOut" value="${sessionScope.checkOut}" readonly>
           </div>

            
            <div class="text-right">
                <button type="button" class="btn btn-secondary" onclick="window.location.href='room'">Cancel</button>
                <button type="submit" class="btn btn-success">Booking Room</button>
            </div>
        </form>
    </div>
</div>
             




<script>
      window.onload = function() {
        openBookingForm();
    }
    function openBookingForm() {
        document.getElementById('bookingForm').style.display = 'flex';
    }
    
    function validateBooking() {
    const checkIn = new Date(document.getElementById("checkIn").value);
    const checkOut = new Date(document.getElementById("checkOut").value);
    const now = new Date();

    // Check: check-in phải sau thời gian hiện tại
    if (checkIn <= now) {
        alert("Check-in time must be later than current time.");
        return false;
    }

    // Check: check-out phải sau check-in ít nhất 12 tiếng
    const hoursDiff = (checkOut - checkIn) / (1000 * 60 * 60);
    if (hoursDiff < 12) {
        alert("Check-out time must be at least 12 hours after check-in time.");
        return false;
    }

    return true;
}
</script>

     
    </body>
</html>
