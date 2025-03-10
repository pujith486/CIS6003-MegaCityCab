import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {

    // JDBC configuration (You can update this with your actual database connection details)
    private static final String DB_URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "your_password";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user input from the form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate input (you can add more validation as needed)
        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            // If input is invalid, redirect back to the login page with an error message
            request.setAttribute("errorMessage", "Please enter both username and password.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        // Validate user credentials against the database
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, username);
                stmt.setString(2, password);

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    // User authenticated successfully, create a session
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);

                    // Redirect to the dashboard or home page
                    response.sendRedirect("/MegaCityCab/pages/dashboard.jsp");
                } else {
                    // Invalid credentials
                    request.setAttribute("errorMessage", "Invalid username or password.");
                    request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database connection errors
            request.setAttribute("errorMessage", "Database error. Please try again later.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
        }
    }
}
