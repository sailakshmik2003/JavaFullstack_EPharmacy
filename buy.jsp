<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.UUID" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <style>
        .vegetable {
            position: absolute;
            bottom: 20px;
            right: 20px;
            display:inline-flex;
        }
    </style>
</head>
<body>
<%
String email = (String) session.getAttribute("email");
Float totalPrice = (Float) session.getAttribute("totalPrice");
String orderId = UUID.randomUUID().toString();
String vegname = null;
Float quantityinkg = null;
Float pricetotal = null;

if (email == null || totalPrice == null) {
    // Handle the case when username or totalPrice is not available
    // Redirect or display an error message
    out.println("<h2>Error: Required session attributes not found.</h2>");
} else {
    // Proceed with database operations
    Connection conn = null;
    PreparedStatement selectStmt = null;
    PreparedStatement insertStmt = null;
    PreparedStatement deleteStmt = null;
    ResultSet rs = null;

    try {
        // Establish database connection
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");

        // Retrieve data from cart table
        String selectQuery = "SELECT name, SUM(quantity) AS total_quantity, SUM(total) AS total_price FROM cart WHERE email = ? GROUP BY name";
        selectStmt = conn.prepareStatement(selectQuery);
        selectStmt.setString(1, email);
        rs = selectStmt.executeQuery();

        // Iterate over the ResultSet and insert data into buy table
        while (rs.next()) {
            String name = rs.getString("name");
            Float quantity = rs.getFloat("total_quantity");
            Float price = rs.getFloat("total_price");

            vegname = name;
            quantityinkg = quantity;
            pricetotal = price;

            // Insert data into buy table
            String insertQuery = "INSERT INTO buy (email, order_date,quantity, price, total, orderid,name) VALUES (?, ?, ?, ?, ?, ?,?)";
            insertStmt = conn.prepareStatement(insertQuery);
            insertStmt.setString(1, email);
            insertStmt.setDate(2, new java.sql.Date(System.currentTimeMillis()));
            insertStmt.setFloat(3, quantity);
            insertStmt.setString(4, String.valueOf(price));
            insertStmt.setFloat(5, totalPrice);
            insertStmt.setString(6, orderId);
            insertStmt.setString(7, name);
            insertStmt.executeUpdate();
        }

        // Delete records from cart table
        String deleteQuery = "DELETE FROM cart WHERE email = ?";
        deleteStmt = conn.prepareStatement(deleteQuery);
        deleteStmt.setString(1, email);
        deleteStmt.executeUpdate();

        // Display order confirmed message
        out.println("<h2>Order Confirmed!</h2>");
        out.println("<p>Thank you for your purchase.</p>");
%>
        <p>Order ID: <%= orderId %></p>
<% 
} catch (Exception e) {
    e.printStackTrace();
    out.println("<h2>Error occurred during database operation: " + e.getMessage() + "</h2>");
}
 finally {
        // Close database resources
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (selectStmt != null) {
            try {
                selectStmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (insertStmt != null) {
            try {
                insertStmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (deleteStmt != null) {
            try {
                deleteStmt.close();
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
}
%>
<p><a href="myorders.jsp">Click Here</a> to see order details!</p>
</body>
</html>
