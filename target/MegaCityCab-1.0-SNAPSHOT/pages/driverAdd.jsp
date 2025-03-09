<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Driver - Mega City Cab</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="container">
        <h1>Add Driver</h1>
        <form action="driverAddServlet" method="post">
                <input type="hidden" id="driverId" name="driverId" required>
            <div class="input-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="input-group">
                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone" required>
            </div>
            <div class="input-group">
                <label for="licenseNumber">License Number</label>
                <input type="text" id="licenseNumber" name="licenseNumber" required>
            </div>
            <button type="submit">Add Driver</button>
        </form>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>
