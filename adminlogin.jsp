<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
         h2{color:rgb(27, 27, 27);text-align: center;}
        .book1{display:inline-block;background-color: rgba(133, 134, 133, 0.3);}
        body{background-image: url("images/reg1.webp");background-size: 1370px;}
        .book2{color:rgb(252, 251, 251);font-size: 20px;align-content: end;background-color: rgba(76, 175, 80, 0.3);}
        input, select {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #f8f2f2;
        border-radius: 4px;
        box-sizing: border-box;
        font-size:18px;
        }
        input[type=submit] {
        width: 50%;
        
        background-color: #4CAF50;
        
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        }
        input[type=submit]:hover {
        background-color: #45a049;
        }

div {
  border-radius: 5px;
 
  padding: 20px;
}
label{
    float:left;
    font-size: 18px;
}

    </style>
</head>
<body>
    <br><br><br><br>
    <div class="login">
        <form action="admin.jsp" method="post">
            
            
    </style>
</head>
<body style="text-align: right;"><br>
    <div class="book1">
        <% 
            // Check if an error message exists in the session
            String errorMessage = (String) session.getAttribute("adminErrorMessage");
            if (errorMessage != null && !errorMessage.isEmpty()) {
                %>
                <br>
                <center>
                    <span style="color: red; font-size: 20px;"><%= errorMessage %></span>
                </center>
                <%
            
            }
            %>
        <h2>Login As Admin</h2><br>
    <form action="main.html" class="book2" style="text-align: left;">
        <label for="email"><b>Enter your email:</b></label>
        <input type="email" id="email" name="email" required><br><br>
        <label for="password"><b>Enter your password:</b></label>
        <input type="password" placeholder="" id="password" name="password" required>
<center>
        <input type="submit" value="Sign In"></center>
        
      </form> 
      </div>
</body>
</html>
