<%
    // Retrieve the admin username from the session attribute
    String adminEmail = (String) session.getAttribute("adminemail");
    String adminusername = adminEmail.substring(0, adminEmail.indexOf("@"));

    // Check if the admin username is null or empty
    if (adminusername == null || adminusername.isEmpty()) {
         // Provide a default value if the admin username is not set
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hi! Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
           padding-left: 100px;
            background-image: url("images/adminbg.avif");
            background-repeat: no-repeat;
            background-size: cover;
        }
        
        h2 {
            color: #333;
        }
        
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            
            font-size: 25px;
            border-radius: 5px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        
        .btn-info {
            background-color: #2196F3;
        }
    </style>
</head>
<body>
    <h2>Hi, <%= adminusername %></h2><br><br><br>
    <button type="button" class="btn btn-info"><a href="add.html" style="text-decoration: none;color: white;">Add</a></button><br/><br/><br>
    <button type="button" class="btn btn-info"><a href="medicinedetails.jsp" style="text-decoration: none;color: white;">Medicines</a></button><br/><br><br>
    <button type="button" class="btn btn-info"><a href="orderdetails.jsp" style="text-decoration: none;color: white;">Order Details</a></button><br><br>
    <button type="button" class="btn btn-info"><a href="logout.jsp" style="text-decoration: none;color: white;">Logout</a></button>
    
</body>
</html>
