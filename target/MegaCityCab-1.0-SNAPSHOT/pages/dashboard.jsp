<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Mega City Cab</title>
    <link rel="stylesheet" href="../styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            padding: 40px 20px;
            text-align: center;
        }

        h1 {
            font-size: 2.5em;
            color: #333;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2em;
            color: #555;
            margin-bottom: 40px;
        }

        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 30px;
            justify-items: center;
        }

        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 100%;
            max-width: 280px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }

        .card h2 {
            font-size: 1.8em;
            margin-bottom: 20px;
            color: #333;
        }

        .card a {
            display: inline-block;
            padding: 12px 20px; /* Same padding for all buttons */
            margin: 10px 0;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 1.1em;
            font-weight: bold;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%; /* Ensure buttons stretch to container width */
            max-width: 280px; /* Keep buttons at the same max width as card */
        }

        .card a:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            transform: translateY(-4px);
        }

        .card a:active {
            background-color: #003d7a;
            transform: translateY(1px);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="container">
        <h1>Welcome to Mega City Cab Dashboard Admin, </h1>
         <p>Manage your bookings, drivers, cars, and more.</p>

<!--        <p>Manage your bookings, drivers, cars, and more.</p>-->

        <!-- Card Container for Different Actions -->
        <div class="card-container">
            <div class="card">
                <h2>Manage Bookings</h2>
                <a href="/MegaCityCab/pages/booking.jsp">Create a New Booking</a>
                <a href="/MegaCityCab/pages/bookingDetails.jsp">View Bookings</a>
            </div>

            <div class="card">
                <h2>Generate Bill</h2>
                <a href="/MegaCityCab/pages/bill.jsp">Generate Bill</a>
            </div>

<!--            <div class="card">
                <h2>Logout</h2>
                <a href="/MegaCityCab/pages/logout.jsp">Logout</a>
            </div>-->

<!--             New Card for Car Details -->
            <div class="card">
                <h2>Car Details</h2>
                <a href="/MegaCityCab/pages/carDetailsAdd.jsp">Add Car</a>
                <a href="/MegaCityCab/pages/carDetailsUpdate.jsp">Update Car</a>
            </div>

            <!-- New Card for Driver Details -->
            <div class="card">
                <h2>Driver Details</h2>
                <a href="/MegaCityCab/pages/driverAdd.jsp">Add Driver</a>
                <a href="/MegaCityCab/pages/driverUpdate.jsp">Update Driver</a>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>
