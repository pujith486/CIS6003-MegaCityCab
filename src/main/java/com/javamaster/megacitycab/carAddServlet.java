import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class CarAddServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String model = request.getParameter("model");
        String registrationNo = request.getParameter("registrationNo");
        boolean availability = Boolean.parseBoolean(request.getParameter("availability"));

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

            // SQL query to insert a new car into the database
            String sql = "INSERT INTO cars (model, registration_no, availability) VALUES (?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, model);
            ps.setString(2, registrationNo);
            ps.setBoolean(3, availability);

            // Execute the insert
            int rowsAffected = ps.executeUpdate();

            // Check if the car was added successfully
            if (rowsAffected > 0) {
                // Redirect to success page (e.g., car list page)
                response.sendRedirect("carList.jsp");
            } else {
                // Forward to an error page if the insert failed
                request.setAttribute("errorMessage", "Failed to add the car.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("addCar.jsp");
                dispatcher.forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException e) {
            // Handle exceptions
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("addCar.jsp");
            dispatcher.forward(request, response);
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
