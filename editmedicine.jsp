<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Medicine</title>
    <script src="https://kit.fontawesome.com/15d438045a.js" crossorigin="anonymous"></script>
    <style>
        body{
            margin-top: 0px;
            background-image: url("images/adminbg.avif");
            background-repeat: no-repeat;
            background-size: cover;
        }
        input{
    font-size: 20px;
    border: 2px solid black;
    border-radius: 5px;
}
textarea{
    font-size: 20px;
    border: 2px solid black;
    border-radius: 5px;
}
.form{
    margin-top: 20px;
    margin-left: 50px;
    color: rgb(4, 4, 4);
    border: 3px solid rgb(241, 229, 229);
    padding-left: 30px;
    padding-right: 30px;
    padding-top: 5px;
    padding-bottom: 15px;
    background-color: rgb(241, 229, 229);
}
.form:hover{
    box-shadow: 5px 5px 5px 5px rgb(192, 176, 176);
}
.row{
    display: flex;
}
label{
 
 
  font-size:20px;
}


    </style>
</head>
<body>
    
   
    <div class="row row1">
    <div class="form">
    
        <h1 class="signup1">Edit Medicine</h1>
    <form action="updatemedicine.jsp" method="post">
        <input type="hidden" name="name" value="<%= request.getParameter("name") %>">
        <label for="brand">Medicine Name:</label><br>
        <input type="text" id="brand" name="name" value="<%= request.getParameter("name") %>" readonly><br><br>
        <label for="model">Power:</label><br>
        <input type="text" id="model" name="power" value="<%= request.getParameter("power") %>"><br><br>
        <label for="carNumber">Cost:</label><br>
        <input type="text" id="carNumber" name="cost" value="<%= request.getParameter("cost") %>"><br><br>
        <label for="description">Description:</label><br>
        <textarea id="description" name="description" value="<%= request.getParameter("description") %>"></textarea><br><br>
        
          <label for="img">Image Path:</label><br>
        <input type="text" id="img" name="img" value="<%= request.getParameter("image") %>"><br><br>
        <input type="submit" value="Update">
    </form>
</div></div>



</body>
</html>
