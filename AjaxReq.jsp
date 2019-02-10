<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%@ include file="connection.jsp"%>
    <%@ page import="com.register.Fil" %>
    
    <%@ page session="true" %>
    
    <%
   
String user_name=(String)session.getAttribute("user_name");
    Integer user_id=(Integer)session.getAttribute("user_id");
   
   
    String fname="",lname="",pic="",op="";
          op=request.getParameter("op");
          System.out.println("op in ajax="+op);
          if(op.equals("del"))
          {
        	  String na=request.getParameter("fname1");
        	  System.out.println("op in ajax= na"+na);
        	  if(Fil.delete(na))
        		  out.print("true");
        		  else 
        			   out.print("false");
        	  
          }
          
          if(op.equals("1"))
          {
      		session.setAttribute("op","1"); 
      		return;
          }
          if(op.equals("2"))
          {
      		session.setAttribute("op","2"); 
      		return;
          }
          
          if(op.equals("3"))
          {	String n=request.getParameter("dir");
      		session.setAttribute("dir",n); 
      		return;
          }
          
          
    String sql = "select pic from user_profile where user_id="+user_id.intValue();
	Statement stmt = con.createStatement();
	
	System.out.println("Op="+op);
	
	
	if(op.equals("pic")){
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next())
	{
		pic=rs.getString(1);
		System.out.println(pic);
		}
	%>
	
 <p class="centered" id="pic" onclick="update()"><a data-toggle="modal" href="indexfinal.html#myModal12"><img src="<%= pic %>" class="img-circle" width="90px" height="90px" id="pic1"></a></p>
 	<%
	}
	
	con.close();
 %>