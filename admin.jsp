<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Result</title>
</head>
<body>
    <%-- Retrieve the submitted credentials --%>
    <% String username = request.getParameter("email");
       String password = request.getParameter("password");

       // Check if the credentials are correct
       if (username.equals("sailakshmi@gmail.com") && password.equals("sai20")) {
           // Valid credentials, redirect to the admin dashboard
           session.setAttribute("adminemail",username);
           response.sendRedirect("adminhomepage.jsp");
       } else {
           // Invalid credentials, display an error message
           session.setAttribute("adminErrorMessage", "Invalid email or password. Please try again.");
           response.sendRedirect("adminlogin.jsp");
       }
    %>
</body>
</html>
