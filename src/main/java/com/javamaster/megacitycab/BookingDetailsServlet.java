package com.javamaster.megacitycab;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bookingDetailsServlet")
public class BookingDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch bookings from the database
        BookingDAO bookingDAO = new BookingDAO();
        List<Booking> bookings = bookingDAO.getAllBookings();

        // Set the bookings list as a request attribute for JSP
        request.setAttribute("bookings", bookings);

        // Forward to the bookingDetails.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/bookingDetails.jsp");
        dispatcher.forward(request, response);
    }
}
