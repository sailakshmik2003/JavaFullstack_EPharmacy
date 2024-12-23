<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<% 
    String name = request.getParameter("name");
    String power = request.getParameter("power");
    String cost = request.getParameter("cost");
    String description = request.getParameter("description");
    String img=request.getParameter("img");
    Connection conn = null;
    PreparedStatement stmt = null;
    
    try {
        // Establish database connection
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");

        
        String insertQuery = "INSERT INTO medicines (name, power, cost,description,image) VALUES (?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(insertQuery);
        stmt.setString(1, name);
        stmt.setString(2, power);
        stmt.setString(3, cost);
        stmt.setString(4, description);
        stmt.setString(5,img);
        int rowsInserted = stmt.executeUpdate();
        
        if (rowsInserted > 0) {
            response.sendRedirect("medicinedetails.jsp");
        } else {
            throw new SQLException("Failed to insert medicine details.");
        }
    } 
    catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close database resources
        if (stmt != null) {
            try {
                stmt.close();
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
