<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ include file="connection.jsp"%>
    <%
    String sql=null;
String name=request.getParameter("name");
    String op=request.getParameter("op");
    if(op.equals("username"))
 sql = "select user_name from user_login where user_name='"+name+"'";
    else
    	sql = "select user_email from user_login where user_email='"+name+"'";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);


if (rs.next()){
out.print("true");
}
else out.print("false");
    
      rs.close();
	con.close();
%>