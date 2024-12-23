<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Medicine</title>
</head>
<body>
    
    <% 
    String name=request.getParameter("name");
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // Establish database connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");

           out.println(name);

            // Update the car details in the database
            String updateQuery = "delete from cart WHERE name=?";
            pstmt = conn.prepareStatement(updateQuery);
            
           
            pstmt.setString(1,name); 
            
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
              response.sendRedirect("mycart.jsp");
            } else {
                out.println("<p>Failed to delete medicine details.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close database resources
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
    %>
</body>
</html>
