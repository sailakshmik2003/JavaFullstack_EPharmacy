<%@page import="java.sql.*,java.util.*"%>
<%
String fname=request.getParameter("email");
String pass=request.getParameter("password");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");
	PreparedStatement pst=con.prepareStatement("insert into login values(?,?)");
	pst.setString(1,fname);
	pst.setString(2,pass);
	pst.executeUpdate();
	if(pst!=null)
	{
		 out.print("<h1>Insert successfully</h1>");
	}
	con.close();
}
catch(Exception e)
{
	%>
		<%=e%>
}
<%
}
%>
