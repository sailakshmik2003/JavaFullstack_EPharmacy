<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
// Retrieve the admin username from the session attribute
String email = (String) session.getAttribute("email");

if (email != null) {
    String name = request.getParameter("name");
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    float totalPrice = Float.parseFloat(request.getParameter("totalprice"));

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");

        String insertQuery = "INSERT INTO cart (email,name, quantity, total) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(insertQuery);
        pstmt.setString(1, email);
        pstmt.setString(2, name);
        pstmt.setInt(3, quantity);
        pstmt.setFloat(4, totalPrice);
        int rows = pstmt.executeUpdate();

        // Redirect to viewcart.jsp after adding to the cart
       
            response.sendRedirect("pharmacy.jsp");
        
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
} else {
    response.sendRedirect("user.jsp");
}
%>
