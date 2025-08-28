<%-- 
    Document   : index
    Created on : 15 thg 6, 2025, 16:35:16
    Author     : mac
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <title>Dat Villa</title>
    </head>
    <body>
      <div class="wrapper">
            <%@include file="../include/header.jsp" %>
                    <c:if test="${not empty sessionScope.errorSearch}">
                      <div class="alert alert-danger">${sessionScope.errorSearch}</div>
                      <c:remove var="errorSearch" scope="session"/>
                    </c:if>

                  <!-- Lỗi đặt phòng -->
                    <c:if test="${not empty sessionScope.errorbooking}">
                      <div class="alert alert-danger">${sessionScope.errorbooking}</div>
                      <c:remove var="errorbooking" scope="session"/>
                    </c:if>
            <%@include file="../include/banner.jsp" %>
            <div class="main-content">
                
                <%@include file="../include/body.jsp" %>
            </div>
            <%@include file="../include/footer.jsp" %>
        </div>
    </body>
</html>
