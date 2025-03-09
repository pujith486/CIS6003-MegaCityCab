<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Help - Mega City Cab</title>
        <link rel="stylesheet" href="../styles.css">
    </head>
    <body>
        <%@ include file="header.jsp" %>

        <div class="container help-container">
            <h1>Help and Support</h1>
            
            <!-- Contact Information Section -->
            <section class="contact-info">
                <h2>Contact Information</h2>
                <p>If you need assistance, please contact us at:</p>
                <p>Email: <a href="mailto:support@megacitycab.com">support@megacitycab.com</a></p>
                <p>Phone: 123-456-7890</p>
            </section>
            
            <!-- FAQ Section -->
            <section class="faq">
                <h2>Frequently Asked Questions (FAQs)</h2>
                <div class="faq-item">
                    <h3>How do I book a ride?</h3>
                    <p>You can book a ride by logging into your account and clicking the "Book a Ride" button on the homepage. Follow the prompts to select your destination and preferred vehicle.</p>
                </div>
                <div class="faq-item">
                    <h3>What payment methods do you accept?</h3>
                    <p>We accept various payment methods including credit/debit cards, mobile payments, and cash.</p>
                </div>
                <div class="faq-item">
                    <h3>How do I reset my password?</h3>
                    <p>If you forgot your password, click on the "Forgot Password" link on the login page and follow the instructions to reset it.</p>
                </div>
                <div class="faq-item">
                    <h3>Is my data secure?</h3>
                    <p>Yes, we use state-of-the-art security measures to protect your personal information and payment details.</p>
                </div>
                <div class="faq-item">
                    <h3>How can I report an issue with my ride?</h3>
                    <p>If you experience any issues during your ride, please contact our support team immediately via phone or email. You can also provide feedback through our app.</p>
                </div>
            </section>
            
            <!-- Troubleshooting Section -->
            <section class="troubleshooting">
                <h2>Troubleshooting</h2>
                <p>If you're experiencing issues with our website or app, try the following steps:</p>
                <ul>
                    <li>Clear your browser cache and cookies.</li>
                    <li>Ensure you are using the latest version of your web browser.</li>
                    <li>Restart your device and try again.</li>
                    <li>If the issue persists, contact our support team.</li>
                </ul>
            </section>
            
            <!-- User Guides Section -->
            <section class="guides">
                <h2>User Guides</h2>
                <p>Learn how to get the most out of our service:</p>
                <ul>
                    <li><a href="/MegaCityCab/pages/how-to-book.jsp">How to Book a Ride</a></li>
                    <li><a href="/MegaCityCab/pages/payment-guide.jsp">Payment Guide</a></li>
                    <li><a href="/MegaCityCab/pages/driver-tips.jsp">Driver Tips</a></li>
                </ul>
            </section>
        </div>

        <%@ include file="footer.jsp" %>
    </body>
</html>
