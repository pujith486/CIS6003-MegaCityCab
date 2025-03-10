import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class SignupServlet extends HttpServlet {

    // JDBC configuration (You can update this with your actual database connection details)
    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "your_password";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user input from the form
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate that passwords match
        if (!password.equals(confirmPassword)) {
            // If passwords do not match, send an error message
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("/pages/signup.jsp").forward(request, response);
            return;
        }

        // Validate input fields (you can add more validation as needed)
        if (name == null || name.isEmpty() || username == null || username.isEmpty() || email == null || email.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("/pages/signup.jsp").forward(request, response);
            return;
        }

        // Hash the password (In production, use a secure hashing algorithm like bcrypt)
        String hashedPassword = password; // For simplicity, this is the plain password. Please hash the password for security!

        // Save the user details into the database
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "INSERT INTO users (name, username, email, password) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, name);
                stmt.setString(2, username);
                stmt.setString(3, email);
                stmt.setString(4, hashedPassword);

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    // Redirect to login page after successful registration
                    response.sendRedirect("/MegaCityCab/pages/login.jsp");
                } else {
                    // Registration failed, send error message
                    request.setAttribute("errorMessage", "Registration failed. Please try again.");
                    request.getRequestDispatcher("/pages/signup.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database connection errors
            request.setAttribute("errorMessage", "Database error. Please try again later.");
            request.getRequestDispatcher("/pages/signup.jsp").forward(request, response);
        }
    }
}
