<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Bill - Mega City Cab</title>
    <link rel="stylesheet" href="../styles.css">
    <!-- Include jsPDF Library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <!-- Include jQuery Library -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>

    <!-- Generate PDF when form is submitted -->
    <form id="generateBillForm">
        <div class="container">
            <h1>Generate Bill</h1>
            <div class="input-group">
                <label for="bookingId">Booking ID</label>
                <input type="text" id="bookingId" name="bookingId" required>
            </div>
            <button type="submit">Generate Bill</button>
        </div>
    </form>

    <script>
        // Handle form submission and PDF generation
        $('#generateBillForm').submit(function (e) {
            e.preventDefault();

            // Get booking ID from form input
            var bookingId = $('#bookingId').val();

            // Hardcoded values based on bookingId for this example
            // This should be replaced with actual dynamic values from the database
            var bookingData = {
                1: {
                    pickupLocation: "Colombo",
                    destination: "Mount Lavinia",
                    totalAmount: "1200.00",
                    status: "Confirmed"
                },
                2: {
                    pickupLocation: "Kandy",
                    destination: "Nuwara Eliya",
                    totalAmount: "1400.00",
                    status: "Pending"
                },
                3: {
                    pickupLocation: "Galle",
                    destination: "Matara",
                    totalAmount: "1750.00",
                    status: "Completed"
                },
                4: {
                    pickupLocation: "Negombo",
                    destination: "Colombo",
                    totalAmount: "850.00",
                    status: "Cancelled"
                },
                5: {
                    pickupLocation: "Anuradhapura",
                    destination: "Polonnaruwa",
                    totalAmount: "1900.00",
                    status: "Confirmed"
                }
            };

            // Get the data for the entered bookingId
            var booking = bookingData[bookingId];

            // If booking is not found, display an error
            if (!booking) {
                alert("Invalid Booking ID");
                return;
            }

            // Create a new jsPDF instance
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            // Add content to the PDF
            doc.setFontSize(20);
            doc.text('Mega City Cab - Invoice', 105, 20, null, null, 'center');
            doc.setFontSize(12);
            doc.text('Booking ID: ' + bookingId, 10, 40);
            doc.text('Pickup Location: ' + booking.pickupLocation, 10, 50);
            doc.text('Destination: ' + booking.destination, 10, 60);
            doc.text('Total: $' + booking.totalAmount, 10, 70);
            doc.text('Status: ' + booking.status, 10, 80);

            // Add Menu to the PDF document (hardcoded)
            doc.text('--- Menu ---', 10, 90);
            doc.text('1. Colombo to Mount Lavinia - $1000', 10, 100);
            doc.text('2. Colombo to Negombo - $1500', 10, 110);
            doc.text('3. Colombo to Kandy - $2000', 10, 120);
            doc.text('4. Colombo to Galle - $2500', 10, 130);
            doc.text('5. Colombo to Anuradhapura - $3000', 10, 140);

            // Save the PDF with the filename including booking ID
            doc.save('invoice_' + bookingId + '.pdf');
        });
    </script>

    <%@ include file="footer.jsp" %>

</body>
</html>
