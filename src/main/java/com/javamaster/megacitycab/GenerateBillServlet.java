package com.javamaster.megacitycab;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

@WebServlet("/GenerateBillServlet")
public class GenerateBillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials (modify as per your DB setup)
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        String bookingId = request.getParameter("bookingId");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT b.bookingId, b.pickupLocation, b.destination, b.totalAmount, b.status " +
                         "FROM Booking b WHERE b.bookingId = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, bookingId);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                jsonResponse.put("bookingId", rs.getInt("bookingId"));
                jsonResponse.put("pickupLocation", rs.getString("pickupLocation"));
                jsonResponse.put("destination", rs.getString("destination"));
                jsonResponse.put("totalAmount", rs.getDouble("totalAmount"));
                jsonResponse.put("status", rs.getString("status"));
                jsonResponse.put("success", true);
            } else {
                jsonResponse.put("error", "Invalid Booking ID");
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            jsonResponse.put("error", e.getMessage());
        }

        out.print(jsonResponse.toString());
        out.flush();
    }
}
