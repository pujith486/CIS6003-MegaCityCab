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

@WebServlet("/bookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve user input from the form
        String pickupLocation = request.getParameter("pickupLocation");
        String destination = request.getParameter("destination");
        String telephone = request.getParameter("telephone");

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/megacitycab"; // Update with your database URL
        String dbUser = "root"; // Update with your DB username
        String dbPassword = ""; // Update with your DB password

        try (PrintWriter out = response.getWriter()) {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Insert booking details into the database
            String sql = "INSERT INTO bookings (pickup_location, destination, telephone) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, pickupLocation);
            stmt.setString(2, destination);
            stmt.setString(3, telephone);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<h2>Booking Successful!</h2>");
                out.println("<p>Pickup Location: " + pickupLocation + "</p>");
                out.println("<p>Destination: " + destination + "</p>");
                out.println("<p>Telephone: " + telephone + "</p>");
                out.println("<a href='index.jsp'>Go Back</a>");
            } else {
                out.println("<h2>Booking Failed. Please try again.</h2>");
            }

            // Close resources
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
