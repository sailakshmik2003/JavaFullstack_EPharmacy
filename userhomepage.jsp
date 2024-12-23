<%
    // Retrieve the admin username from the session attribute
    String email = (String) session.getAttribute("email");
    

    // Check if the admin username is null or empty
    if (email == null || email.isEmpty()) {
         // Provide a default value if the admin username is not set
         response.sendRedirect("main.html");
    }
    
%>
<html>
    <head>
        <title>PHARMACY</title>
        <style>
           
            body{background-image: url("images/bg5.jpg");background-repeat: no-repeat;background-size:1380px;}
            .c1 ul li{display:inline-flex;text-decoration: none;width:180px;color:rgb(185, 5, 5);font-family:Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;font-size:30px;margin-top:-8px;}
            .c1 ul li a{text-decoration: none;color:black;font-size:20px;font-size: 25px;}
            #i2{font-size:50px;font-family:'Times New Roman', Times, serif;}
            .c1 ul li h2 a{color:black;}
        
.dropbtn {
  
  
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;

}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  font-size: 15px;
}

.dropdown:hover .dropdown-content {display: block;}


        </style>
    </head>
    <body>
    <div class="c1">
        <ul>
        <li><img src="images/lifecare.png" width="180" height="60"></li>
        
       <li></li>
        <li><a href="about.html">&nbsp;&nbsp;&nbsp;About&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="pharmacy.jsp">&nbsp;&nbsp;&nbsp;Pharmacy&nbsp;&nbsp;&nbsp;</a></li>
        
        <li><a href="myorders.jsp">&nbsp;&nbsp;&nbsp;My Orders&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="mycart.jsp">My Cart</a></li>
        <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>


</body>
    

</html>