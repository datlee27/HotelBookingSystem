<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Đường dẫn CSS riêng cho banner (có thể gom vào style.css nếu bạn thích) -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/banner.css">

<!-- ===== HERO / BANNER ===== -->
<section class="hero-banner d-flex flex-column justify-content-center">
    <div class="container banner-content">
        <h1 class="display-4 fw-bold">Find Your Perfect Stay</h1>
        <p class="lead mb-4">Discover comfort and luxury with our premium room selection. Book your stay today.</p>

    
    </div>

    <!-- ===== SEARCH CARD (form) ===== -->
    <div class="search-card container">
        <form class="row g-3 align-items-end"
              action="<%= application.getContextPath() %>/findroom"
              method="get"
              onsubmit="return validateBooking()">

            <!-- Location (tùy ý lấy từ DB) -->
            <div class="col-lg-3 d-flex flex-column">
                <label class="form-label">Location</label>
                <select class="form-select" name="location">
                    <option value="">Đà Nẵng</option>
                    <!-- Ví dụ dựng sẵn, bạn có thể loop bằng JSTL -->
                   
                </select>
            </div>

            <!-- Check-in -->
            <div class="col-lg-3 d-flex flex-column">
                <label class="form-label">Check-in Date</label>
                <input type="datetime-local"
                       id="checkIn"
                       class="form-control"
                       name="checkIn"
                       value="${checkIn}"
                       required>
            </div>

            <!-- Check-out -->
            <div class="col-lg-3 d-flex flex-column">
                <label class="form-label">Check-out Date</label>
                <input type="datetime-local"
                       id="checkOut"
                       class="form-control"
                       name="checkOut"
                       value="${checkOut}"
                       required>
            </div>

            <!-- Guests -->
            <div class="col-lg-2 d-flex flex-column">
                <label class="form-label">Guests</label>
                <select class="form-select" name="guests">
                    <option value="1">1 Guest</option>
                    <option value="2">2 Guests</option>
                    <option value="3">3 Guests</option>
                    <option value="4">4 Guests</option>
                </select>
            </div>

            <!-- Submit -->
            <div class="col-lg-1 d-flex flex-column">
                <button type="submit" class="btn btn-primary">Search Rooms</button>
            </div>
        </form>
    </div>
</section>

<!-- ===== VALIDATION SCRIPT ===== -->
<script>
function validateBooking() {
    const checkIn  = new Date(document.getElementById("checkIn").value);
    const checkOut = new Date(document.getElementById("checkOut").value);
    const now      = new Date();

    if (checkIn <= now) {
        alert("Check-in time must be later than current time.");
        return false;
    }
    const hoursDiff = (checkOut - checkIn) / (1000 * 60 * 60);
    if (hoursDiff < 12) {
        alert("Check-out time must be at least 12 hours after check-in.");
        return false;
    }
    return true;
}
</script>
