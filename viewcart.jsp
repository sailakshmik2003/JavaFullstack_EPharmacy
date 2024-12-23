<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%
    // Retrieve the cart from the session attribute or create a new one if it doesn't exist
    Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
    if (cart == null) {
        cart = new HashMap<>();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Cart</title>
</head>
<body>
    <h1>Cart</h1>
    
    <% if (cart.isEmpty()) { %>
        <p>Your cart is empty.</p>
    <% } else { %>
        <table>
            <tr>
                <th>Item Name</th>
                <th>Quantity</th>
            </tr>
            <% for (Map.Entry<String, Integer> entry : cart.entrySet()) { %>
                <tr>
                    <td><%= entry.getKey() %></td>
                    <td><%= entry.getValue() %></td>
                </tr>
            <% } %>
        </table>
    <% } %>
    
    <p><a href="clearcart.jsp">Clear Cart</a></p>
</body>
</html>
