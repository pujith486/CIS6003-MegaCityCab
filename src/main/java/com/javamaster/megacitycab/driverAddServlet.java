import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class DriverAddServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String licenseNumber = request.getParameter("licenseNumber");

        // Database connection parameters (replace with actual values)
        String dbURL = "jdbc:mysql://localhost:3306/megacitycab";
        String dbUsername = "root";
        String dbPassword = "password";

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Establish connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // SQL query to insert new driver
            String sql = "INSERT INTO drivers (name, phone, license_number) VALUES (?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, licenseNumber);

            // Execute the insert
            int rowsAffected = ps.executeUpdate();

            // Check if the insertion was successful
            if (rowsAffected > 0) {
                // Redirect to the driver list page or confirmation page
                response.sendRedirect("driverList.jsp");
            } else {
                // If insertion failed, show an error message
                request.setAttribute("errorMessage", "Failed to add the driver.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("addDriver.jsp");
                dispatcher.forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException e) {
            // Handle exceptions
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        } finally {
            // Close database resources
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
