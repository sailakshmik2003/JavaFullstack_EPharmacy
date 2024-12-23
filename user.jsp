<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        h2{color:rgb(27, 27, 27);text-align: center;}
        .book1{display:inline-block;}
        body{background-image: url("images/reg1.webp");background-size: 1370px;}
        .book2{color:rgb(26, 25, 25);font-size: 20px;align-content: end;}
        input, select {
        width: 80%;
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
        color: rgb(24, 24, 24);
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
  background-color:rgba(133, 134, 133, 0.3);
  padding: 20px;
}

    </style>
</head>
<body style="text-align: right;"><br><br><br><br>

    
      
      <div class="book1">
        <% 
        // Check if an error message exists in the session
        String errorMessage = (String) session.getAttribute("ErrorMessage");
        if (errorMessage != null) {
            %>
            <br><center>
            <span style="color: red;font-size: 20px;"><%= errorMessage %></span></center>
            <%
            // Remove the error message from the session after displaying it
            session.removeAttribute("ErrorMessage");
        }
        %>
        <h2>Login As User</h2><br>
    <form action="userlogin.jsp" class="book2" style="text-align: left;">
        <label for="email"><b>Enter your email:</b></label>
        <input type="email" id="email" name="email" required><br><br>
        <label for="password"><b>Enter your password:</b></label>
        <input type="password" name="password" required>
<center>
        <input type="submit" value="Sign In"></center>
        Don't have an account? <a href="register.html">Create account</a>
      </form> 
      </div>
    
</body>
</html>