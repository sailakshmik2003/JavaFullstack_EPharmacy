<%@ page import="java.sql.*" %>

<%
   // Retrieve form data
   String firstName = request.getParameter("fname");
   String lastName = request.getParameter("lname");
   String phoneNumber = request.getParameter("phone");
   String email = request.getParameter("email");
   String password = request.getParameter("password");

   // Connect to the MySQL database
   String url = "jdbc:oracle:thin:@localhost:1521:XE";
   String username = "system";
   String dbPassword = "system";

   try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","system");

      // Insert data into the database
      String query = "INSERT INTO register (first_name, last_name, phone, email, password) VALUES (?, ?, ?, ?, ?)";
      PreparedStatement pst = con.prepareStatement(query);
      pst.setString(1, firstName);
      pst.setString(2, lastName);
      pst.setString(3, phoneNumber);
      pst.setString(4, email);
      pst.setString(5, password);
      pst.executeUpdate();

      // Close the database connection
      pst.close();
      con.close();

      // Redirect to a success page or display a success message
      response.sendRedirect("user.jsp");
      
      
   } catch (Exception e) {
      e.printStackTrace();
      out.println(e);
      // Redirect to an error page or display an error message
      out.print("<h1>Error message</h1>");
      
   }
%>
