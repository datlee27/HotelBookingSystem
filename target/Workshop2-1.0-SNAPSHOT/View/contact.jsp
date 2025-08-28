<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Booking Room</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f3f4f6;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 60px auto;
            background: white;
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 6px;
            color: #333;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }

        button {
            background-color: #2980b9;
            color: white;
            padding: 14px;
            width: 100%;
            border: none;
            font-size: 16px;
            border-radius: 10px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        button:hover {
            background-color: #1f6391;
        }

        .info-box {
            margin-top: 30px;
            padding: 20px;
            background: #ecf0f1;
            border-radius: 10px;
        }

        .info-box p {
            margin: 6px 0;
            font-size: 15px;
        }

        .info-box strong {
            color: #2c3e50;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #c3e6cb;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Contact Us</h2>

    <c:if test="${not empty success}">
        <div class="alert-success">${success}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/contact" method="post">
        <div class="form-group">
            <label for="name">Your Name:</label>
            <input type="text" name="name" id="name" required/>
        </div>
        <div class="form-group">
            <label for="email">Your Email:</label>
            <input type="email" name="email" id="email" required/>
        </div>
        <div class="form-group">
            <label for="subject">Subject:</label>
            <input type="text" name="subject" id="subject" required/>
        </div>
        <div class="form-group">
            <label for="message">Your Message:</label>
            <textarea name="message" id="message" required></textarea>
        </div>
        <button type="submit">Send Message</button>
    </form>

    <div class="info-box">
        <p><strong>Phone:</strong> +84 123 456 789</p>
        <p><strong>Email:</strong> booking@dathotel.com</p>
        <p><strong>Address:</strong> 123 abc, Quận Ngũ Hành Sơn, TP. Đà Nẵng</p>
        <p><strong>Working Hours:</strong> 8:00 – 22:00 (Mon–Sun)</p>
    </div>
</div>
</body>
</html>
