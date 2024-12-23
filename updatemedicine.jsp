<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Medicine</title>
</head>
<body>
    
    <% 
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // Establish database connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");

            // Get the form data
            String name = request.getParameter("name");
            String power = request.getParameter("power");
            String cost = request.getParameter("cost");
            String description = request.getParameter("description");
            String img=request.getParameter("img");

            // Update the car details in the database
            String updateQuery = "UPDATE medicines SET power=?, cost=?, description=?,image=? WHERE name=?";
            pstmt = conn.prepareStatement(updateQuery);
            
            pstmt.setString(1, power);
            pstmt.setString(2, cost);
            pstmt.setString(3, description);
            pstmt.setString(4,img);
            pstmt.setString(5,name); 
            
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
               response.sendRedirect("medicinedetails.jsp");
            } else {
                out.println("<p>Failed to update medicine details.</p>");
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
