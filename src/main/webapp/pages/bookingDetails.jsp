<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Details - Mega City Cab</title>
    <link rel="stylesheet" href="../styles.css">
    <style>
        /* Modal Styling */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
            position: relative;
        }
        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            position: absolute;
            right: 10px;
            top: 10px;
            cursor: pointer;
        }
        .update-btn {
            padding: 8px 15px;
            margin: 5px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }
        .update-btn:hover {
            background-color: #0056b3;
        }
        .input-group {
            margin: 10px 0;
        }
        select, input {
            padding: 10px;
            width: 100%;
            font-size: 1em;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="container">
        <h1>Your Bookings</h1>
        <table>
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Pickup Location</th>
                    <th>Destination</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Example dynamic data loop, assuming you have a list of bookings in your request
                    for (Booking booking : bookings) {
                %>
                <tr>
                    <td><%= booking.getBookingId() %></td>
                    <td><%= booking.getPickupLocation() %></td>
                    <td><%= booking.getDestination() %></td>
                    <td><%= booking.getTotal() %></td>
                    <td><%= booking.getStatus() %></td>
                    <td>
                        <button class="update-btn" onclick="openModal(<%= booking.getBookingId() %>, '<%= booking.getPickupLocation() %>', '<%= booking.getDestination() %>', <%= booking.getTotal() %>, <%= booking.getTax() %>, <%= booking.getDiscount() %>)">Update Booking</button>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Unified Update Modal -->
    <div id="updateModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Update Booking</h2>
            <form action="updateBookingServlet" method="post">
                <input type="hidden" id="bookingId" name="bookingId" required>
                <div class="input-group">
                    <label for="driverName">Select Driver</label>
                    <select id="driverName" name="driverName" required>
                        <option value="driver1">Jane Smith</option>
                        <option value="driver2">Bob Jones</option>
                    </select>
                </div>
                <div class="input-group">
                    <label for="carModel">Select Car Model</label>
                    <select id="carModel" name="carModel" required>
                        <option value="model1">Toyota Prius</option>
                        <option value="model2">Honda Civic</option>
                    </select>
                </div>
                <div class="input-group">
                    <label for="totalFare">Total Fare</label>
                    <input type="number" id="totalFare" name="totalFare" required>
                </div>
                <div class="input-group">
                    <label for="tax">Tax</label>
                    <input type="number" id="tax" name="tax" required>
                </div>
                <div class="input-group">
                    <label for="discount">Discount</label>
                    <input type="number" id="discount" name="discount">
                </div>
                <button type="submit" class="update-btn">Update Booking</button>
            </form>
        </div>
    </div>

    <script>
        function openModal(bookingId, pickupLocation, destination, totalFare, tax, discount) {
            document.getElementById("bookingId").value = bookingId;
            document.getElementById("totalFare").value = totalFare;
            document.getElementById("tax").value = tax;
            document.getElementById("discount").value = discount;
            document.getElementById("updateModal").style.display = "block";
        }

        function closeModal() {
            document.getElementById("updateModal").style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == document.getElementById("updateModal")) {
                closeModal();
            }
        }
    </script>

    <%@ include file="footer.jsp" %>
</body>
</html>
