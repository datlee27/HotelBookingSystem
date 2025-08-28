<%-- 
    Document   : header
    Created on : 15 thg 6, 2025, 16:36:21
    Author     : mac
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fontawesome.com/search?q=password%20&o=r">
    <link rel="stylesheet" href="https://fontawesome.com/search">
    <link href="https://fonts.googleapis.com/css2?family=Segoe+UI&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    
    <title>DatVilla</title>
    </head>
    <body>
    <!-- Welcome Message -->
    <c:if test="${not empty sessionScope.fine}">
    <div id="welcomeMessage" style="color: green; font-weight: bold; text-align: center;">
        ${sessionScope.fine}
    </div>
    <c:if test="${not empty sessionScope.errorSearch}">
        <div class="alert alert-danger">${sessionScope.errorSearch}</div>
        <c:remove var="errorSearch" scope="session"/>
    </c:if>

    <!-- Lỗi đặt phòng -->
    <c:if test="${not empty sessionScope.errorbooking}">
        <div class="alert alert-danger">${sessionScope.errorbooking}</div>
        <c:remove var="errorbooking" scope="session"/>
    </c:if>

    
    <script>
        setTimeout(function () {
            var msg = document.getElementById("welcomeMessage");
            if (msg) {
                msg.style.display = "none";
            }
        }, 2000);
    </script>
    <c:remove var="fine" scope="session"/>
</c:if>
    

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="<%= application.getContextPath() %>/room">Dat_Villa</a>
    
    <!-- Form search room -->

        
    <!-- Responsive Toggle -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>


    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">

            <li class="nav-item active">
                <a class="nav-link" href="<%= application.getContextPath() %>/room">Home</a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="<%= application.getContextPath() %>/View/contact.jsp">Contact</a>
            </li>
            

            <c:if test="${sessionScope.acc == null}">
                <li class="nav-item">
                    <a class="nav-link" href="#" id="openLoginModal">Login</a>
                </li>
            </c:if>
               
            <c:if test="${sessionScope.acc != null}">
                <li class="nav-item">
                    <a class="nav-link" href="<%= application.getContextPath() %>/printbooking" style="color:blueviolet;">${sessionScope.acc.userName}'s Room</a>           
                </li>   
                  
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
                </li>
            </c:if>
        </ul>
    </div>
</nav>

<!-- Modal Login -->
   
<div id="loginModal" class="modal" style="display: none;">
    <div class="modal-content">
        <span class="close-btn" id="closeLoginModal">&times;</span>
       <form action="${pageContext.request.contextPath}/login" method="post">
            <h2 style="display: flex;  justify-content: center; align-items: center;">Login</h2>
            <c:if test="${not empty error}">
                <div style="color: red; font-weight: bold;">${error}</div>
            </c:if>
               <c:if test="${not empty error}">
    <script>
        document.getElementById("loginModal").style.display = "flex";
    </script>
</c:if>  
                
                
                
            <div class="form-group">
                 <i class="fa-regular fa-user" style="padding-right:3px;"></i>
                <label>Username:</label>
                <input type="text" class="form-control" name="userName" required>
            </div>
            <div class="form-group">
                <i class="fa-solid fa-key" style="padding-right:3px;"></i>
                <label>Password:</label>
                <div style="position: relative;">
                    <input type="password" class="form-control" name="passWord" id="passwordField" required>
                    <span id="eye" style="position:absolute; right:10px; top:50%; transform:translateY(-50%); cursor:pointer;"">
                        <i class="fa-regular fa-eye"></i>
                    </span>
                </div>
            </div>
            <button type="submit" class="btn btn-success">Login</button>
        </form>
    </div>
</div>




<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Modal JS -->
<script>
    document.getElementById("openLoginModal").addEventListener("click", function (e) {
        e.preventDefault();
        document.getElementById("loginModal").style.display = "flex";
    });

    document.getElementById("closeLoginModal").addEventListener("click", function () {
        document.getElementById("loginModal").style.display = "none";
    });

    document.getElementById("eye").addEventListener("click", function () {
        const passInput = document.getElementById("passwordField");
        const icon = this.querySelector("i");
        if (passInput.type === "password") {
            passInput.type = "text";
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");
        } else {
            passInput.type = "password";
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
        }
    });
    
 
</script>

    </body>
</html>
