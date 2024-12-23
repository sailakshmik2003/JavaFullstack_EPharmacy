<%
  // Perform logout actions
  session.invalidate(); // Invalidate the session
  response.sendRedirect("main.html"); // Redirect to the login page
%>
