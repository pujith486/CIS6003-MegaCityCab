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
$('#generateBillForm').submit(function (e) {
    e.preventDefault();

    var bookingId = $('#bookingId').val();

    $.ajax({
        url: "GenerateBillServlet",
        type: "POST",
        data: { bookingId: bookingId },
        dataType: "json",
        success: function (response) {
            if (response.success) {
                const { jsPDF } = window.jspdf;
                const doc = new jsPDF();

                doc.setFontSize(20);
                doc.text('Mega City Cab - Invoice', 105, 20, null, null, 'center');
                doc.setFontSize(12);
                doc.text('Booking ID: ' + response.bookingId, 10, 40);
                doc.text('Pickup Location: ' + response.pickupLocation, 10, 50);
                doc.text('Destination: ' + response.destination, 10, 60);
                doc.text('Total: $' + response.totalAmount, 10, 70);
                doc.text('Status: ' + response.status, 10, 80);

                // Save PDF
                doc.save('invoice_' + response.bookingId + '.pdf');
            } else {
                alert(response.error);
            }
        },
        error: function () {
            alert("Error fetching booking details.");
        }
    });
});

    </script>

    <%@ include file="footer.jsp" %>

</body>
</html>
