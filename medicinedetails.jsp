<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Medicines List</title>
</head>
<body>
    <h2>Medicines</h2>
    <table border=2px solid black cellpadding="5">
        <tr>
            <th>Medicine Name</th>
            <th>Power</th>
            <th>Cost</th>
            <th>Description</th>
            <th>Image</th>
            <th></th>
            <th></th>
        </tr>
        <% 
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                // Establish database connection
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");

                // Execute SELECT query
                String selectQuery = "SELECT * FROM medicines";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(selectQuery);

                // Iterate over the ResultSet and display the data
                while (rs.next()) {
                    String name = rs.getString("name");
                    String power = rs.getString("power");
                    String cost = rs.getString("cost");
                    String description = rs.getString("description");
                    String img=rs.getString("IMAGE");
                    // Display the data row in the HTML table
                    
                    out.println("<tr>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + power + "</td>");
                    out.println("<td>" + cost + "</td>");
                    out.println("<td>" + description + "</td>");
                    out.println("<td>" + img + "</td>");
                    out.println("<td><a href='editmedicine.jsp?name=" + name + "&power=" + power + "&cost=" + cost + "&description=" + description + "&image=" + img + "'>edit</a></td>");
                    out.println("<td><a href='delete.jsp?name=" + name + "'>Delete</a></td>");

                    out.println("</tr>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close database resources
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
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
    </table><p><a href="adminhomepage.jsp">Click Here </a>to go to home page</p>
</body>
</html>
