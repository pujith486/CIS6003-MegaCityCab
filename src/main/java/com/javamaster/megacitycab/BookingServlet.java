package com.javamaster.megacitycab;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "BookingServlet", urlPatterns = {"/BookingServlet"})
public class BookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Only one definition of doGet
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the booking from the session
        HttpSession session = request.getSession();
        Booking booking = (Booking) session.getAttribute("booking");

        if (booking != null) {
            // Set the booking as a request attribute
            request.setAttribute("booking", booking);
            
            // Forward to the booking details page
            RequestDispatcher dispatcher = request.getRequestDispatcher("bookingDetails.jsp");
            dispatcher.forward(request, response);
        } else {
            // If no booking found, redirect to an error page
            response.sendRedirect("error.jsp");
        }
    }
}
