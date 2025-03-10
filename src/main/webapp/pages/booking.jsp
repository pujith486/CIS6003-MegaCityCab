<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking - Mega City Cab</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>

    <%@ include file="header.jsp" %>

    <div class="container">
        <h1>Book a Ride</h1>
        
        <!-- Display success message if booking is confirmed -->
        <% 
            String bookingStatus = request.getParameter("status");
            if ("success".equals(bookingStatus)) { 
        %>
            <div class="success-message">
                <p>Booking Successful! Your ride has been scheduled.</p>
            </div>
        <% } else if ("error".equals(bookingStatus)) { %>
            <div class="error-message">
                <p>Booking Failed! Please try again.</p>
            </div>
        <% } %>

        <form action="bookingServlet" method="post">
            <div class="input-group">
                <label for="pickupLocation">Pickup Location</label>
                <input type="text" id="pickupLocation" name="pickupLocation" required>
            </div>
            <div class="input-group">
                <label for="destination">Destination</label>
                <input type="text" id="destination" name="destination" required>
            </div>
            <div class="input-group">
                <label for="telephone">Telephone</label>
                <input type="text" id="telephone" name="telephone" required>
            </div>
            <button type="submit">Book Ride</button>
        </form>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>
