<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%@ include file="connection.jsp"%>
    <%@ page import="com.Mess,java.util.Date,java.text.SimpleDateFormat" %>
    <%@ page session="true" %>
     
    <%
String user_name=(String)session.getAttribute("user_name");
    Integer user_id=(Integer)session.getAttribute("user_id");
    if(user_id==null)
    {
    	session.setAttribute("Error","Session Expired Please login again");
    	response.sendRedirect("http://localhost:8080/friendscloud/login.html");
    }
    int id=Integer.parseInt(request.getParameter("muser"));
   String msg=request.getParameter("msg");
   String dat=request.getParameter("da");
   SimpleDateFormat p1=new SimpleDateFormat("yyyy-MM-dd:HH:mm:ss");
   Date d=new Date();
   dat=p1.format(d);
   
    String sql="insert into message(frm,too,mtime,status,sender,rec,message) values("+user_id+","+id+",'"+dat+"',"+0+","+user_id+","+id+",'"+msg+"')"; 
    Statement stmt = con.createStatement();
    stmt.executeUpdate(sql);
    out.print("sucess");

    con.close();
    %>