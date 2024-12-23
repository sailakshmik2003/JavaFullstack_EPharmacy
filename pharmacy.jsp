<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    // Retrieve the admin username from the session attribute
    String email = (String) session.getAttribute("email");
    

   
    
%>

<!DOCTYPE html>
<html>
<head>
    <title>Pharmacy</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <style>
        ul li a{display:inline-flex;width:400px;text-decoration: none;}
        ul li{text-decoration: none;list-style: none;}
        .container-row {
            display: inline-flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        .card {
            width: 300px;
            margin: 10px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
        }

        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }

        .card img {
            width: 100%;
            height: 200px;
        }

        .card-content {
            padding: 15px;
        }

        .card-title {
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .card-description {
            margin-bottom: 10px;
        }

        .card-quantity {
            margin-bottom: 10px;
        }

        .card-price {
            margin-bottom: 10px;
        }

        .card-total-price {
            margin-bottom: 10px;
        }

        .card-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .card-button:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        function calculateTotalPrice(name) {
            var quantityInput = document.getElementById("quantity-" + name);
            var amountInput = document.getElementById("amount-" + name).innerText;
            var amount = parseFloat(amountInput.split(": ")[1]);
            var totalPriceInput = document.getElementById("totalPrice-" + name);

            var kg = parseFloat(quantityInput.value);
            var totalPrice = kg * amount;
            totalPriceInput.value = totalPrice.toFixed(2);
        }
    </script>
    <script src="https://kit.fontawesome.com/6e3e20be2d.js" crossorigin="anonymous"></script>
</head>
<body><br>
    <div class="container-fluid">
  <div class="row">
   <div class="col-10"></div>
    <div class="col-1">
            <a href="userhomepage.jsp" style="color:black;text-decoration: none;font-size: 25px;">Home</a></div>
            <div class="col-1">
            <a href="mycart.jsp"><i class="fa-solid fa-cart-shopping" style="font-size:40px;"></i></a></div>
        </div>
        </div>
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
                String img = rs.getString("image");
    %>  
    
    <div class="container-row">
        <div class="card">
            <img src='<%= img %>' width="25%" height="30%">
            <div class="card-content">
                <h3 class="card-title"><%= name %></h3>
                <p class="card-description"><%= description %></p>
                <p class="card-quantity">Power: <%= power %></p>
                <p class="card-price" id="amount-<%= name %>">Cost: <%= cost %></p>
                <form action="addtocart.jsp">
                    <input type="hidden" name="name" value="<%= name %>">
                    <input type="number" id="quantity-<%= name %>" name="quantity" placeholder="Quantity" step="1"><br><br>
                    <input type="button" value="Calculate" onclick="calculateTotalPrice('<%= name %>')"><br><br>
                    <input type="text" id="totalPrice-<%= name %>" name="totalprice" readonly><br><br>
                    <input type="submit" value="Add to Cart" class="card-button">
                </form>
            </div>
        </div>
    </div>
    
    <%  
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
</body>
</html>
