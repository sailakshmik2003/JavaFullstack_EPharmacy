<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
// Retrieve the admin username from the session attribute
String email = (String) session.getAttribute("email");

%>

<!DOCTYPE html>
<html>
<head>
    <title>My Cart</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <table>
        <tr>
            <th>Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Delete</th>
        </tr>
        <% 
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");

            String selectQuery = "SELECT * FROM cart where email='" + email + "'";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(selectQuery);

            while (rs.next()) {
                String itemName = rs.getString("name");
                int itemQuantity = rs.getInt("quantity");
                float itemTotalPrice = rs.getFloat("total");

        %>
        <tr>
            <td><%= itemName %></td>
            <td><%= itemQuantity %></td>
            <td><%= itemTotalPrice %></td>
            <td><a href="deletecart.jsp?name=<%= itemName %>">Delete</a></td>

        </tr>
        <%  
        }
        
        // Calculate total price
        String sQuery = "SELECT SUM(total) AS total FROM cart WHERE email='" + email + "'";
        rs = stmt.executeQuery(sQuery);
        if (rs.next()) {
            Float totalPrice = rs.getFloat("total");
            session.setAttribute("totalPrice",totalPrice);
        %>
        <tr>
            <td colspan="2" align="right">Total Price:</td>
            <td><%= totalPrice %></td>
         
        </tr>
        
        <% 
        }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
    </table><br><br><br>
    <button type="button" class="btn btn-info"><a href="buy.jsp" style="text-decoration: none;color: rgb(0, 0, 0);">Buy</a></button><br/><br/><br>
</body>
</html>
