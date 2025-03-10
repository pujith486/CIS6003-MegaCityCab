import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class CarUpdateServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the car ID from the request
        int carId = Integer.parseInt(request.getParameter("carId"));

        // Database connection parameters (replace with actual values)
        String dbURL = "jdbc:mysql://localhost:3306/megacitycab";
        String dbUsername = "root";
        String dbPassword = "password";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Establish connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // SQL query to retrieve car details by carId
            String sql = "SELECT model, registration_no, availability FROM cars WHERE car_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, carId);

            // Execute the query
            rs = ps.executeQuery();

            // Check if car details are found
            if (rs.next()) {
                // Set the car details as request attributes
                request.setAttribute("carId", carId);
                request.setAttribute("model", rs.getString("model"));
                request.setAttribute("registrationNo", rs.getString("registration_no"));
                request.setAttribute("availability", rs.getBoolean("availability") ? "true" : "false");

                // Forward the request to the JSP page to display the car details
                RequestDispatcher dispatcher = request.getRequestDispatcher("updateCar.jsp");
                dispatcher.forward(request, response);
            } else {
                // If car not found, send an error message or redirect
                response.sendRedirect("errorPage.jsp");
            }

        } catch (SQLException | ClassNotFoundException e) {
            // Handle exceptions
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        } finally {
            // Close database resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
