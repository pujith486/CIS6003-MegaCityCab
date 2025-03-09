<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Home</title>
       <link rel="stylesheet" href="styles.css">

</head>
<body>
    <%@ include file="/pages/header.jsp" %>


    <div class="slider-container">
        <div class="slider" id="slider">
            <div class="slide"><img src="images/banner.jpg" alt="Cab Service 1"></div>
            <div class="slide"><img src="images/banner.jpg" alt="Cab Service 2"></div>
            <div class="slide"><img src="images/banner.jpg" alt="Cab Service 3"></div>
        </div>
    </div>

    <div class="hero">
        <h2>Welcome to Mega City Cab Service</h2>
        <p>Efficient, reliable, and affordable cab service in Colombo City.</p>
        <a href="/MegaCityCab/pages/login.jsp" class="btn-login">Book a Ride</a>
    </div>

    <div class="services">
        <div class="service-box">
            <img src="images/icon-car.svg" alt="Fast Service">
            <h3>Fast & Reliable</h3>
            <p>Get to your destination on time with our fast and efficient cab service.</p>
        </div>
        <div class="service-box">
            <img src="images/icon-drivers.svg" alt="Affordable Rides">
            <h3>Affordable Rides</h3>
            <p>Enjoy cost-effective rides without compromising on comfort and safety.</p>
        </div>
        <div class="service-box">
            <img src="images/icon-experience.svg" alt="Safety First">
            <h3>Safety First</h3>
            <p>Our professional drivers ensure a safe journey for every passenger.</p>
        </div>
    </div>
    
 <div class="hero">
    <h2>Welcome to Wonder Of Asia...</h2>
    <p>
        Travel around Sri Lanka in a comfy car with a Driver only for just $60. We assure our service with very friendly &amp; safe drivers (No hidden charges).
    </p>
</div>

<div class="special-packages">
    <h3>Special Packages</h3>
    <p>Pre-defined destinations from Airport</p>
    <div class="packages-grid">
        <div class="package-card">
            <h4>Airport to Mirissa</h4>
            <p>LKR 21,000/=</p>
        </div>
        <div class="package-card">
            <h4>Airport to Hikkaduwa</h4>
            <p>LKR 55,000/=</p>
        </div>
        <div class="package-card">
            <h4>Airport to Galle</h4>
            <p>LKR 26,000/=</p>
        </div>
        <div class="package-card">
            <h4>Airport to Unawatuna</h4>
            <p>LKR 15,000/=</p>
        </div>
        <div class="package-card">
            <h4>Airport to Weligama</h4>
            <p>LKR 35,000/=</p>
        </div>
        <div class="package-card">
            <h4>Airport to Bentota</h4>
            <p>LKR 40,000/=</p>
        </div>
    </div>
</div>
       <%@ include file="/pages/footer.jsp" %>


    <script>
        let index = 0;
        function slideShow() {
            const slides = document.getElementById("slider");
            index++;
            if (index > 2) { index = 0; }
            slides.style.transform = `translateX(-${index * 100}%)`;
        }
        setInterval(slideShow, 3000);
    </script>
</body>
</html>