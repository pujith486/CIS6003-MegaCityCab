<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Car - Mega City Cab</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="container">
        <h1>Update Car</h1>
        <form action="carAddServlet" method="post">
                <input type="hidden" id="carId" name="carId" required>
            <div class="input-group">
                <label for="model">Model</label>
                <input type="text" id="model" name="model" required>
            </div>
            <div class="input-group">
                <label for="registrationNo">Registration Number</label>
                <input type="text" id="registrationNo" name="registrationNo" required>
            </div>
            <div class="input-group">
                <label for="availability">Availability</label>
                <select id="availability" name="availability" required>
                    <option value="true">Available</option>
                    <option value="false">Not Available</option>
                </select>
            </div>
            <button type="submit">Update Car</button>
        </form>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>
