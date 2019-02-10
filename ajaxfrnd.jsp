<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.Friend,com.register.Fil,java.io.*" %>
    
    <%
    String user_name=(String)session.getAttribute("user_name");
    Integer user_id=(Integer)session.getAttribute("user_id");
   
    Friend f=new Friend(user_id.intValue());
    String op=request.getParameter("op");
    
    if(op.equals("add"))
          {
        	  int fid=Integer.parseInt(request.getParameter("fid"));
        	  //System.out.println("op in ajax= na"+na);
        	  if(f.send(fid))
        		  out.print("true");
        		  else 
        			   out.print("false");
        	  
          }
    
    if(op.equals("accept"))
    {
  	  int fid=Integer.parseInt(request.getParameter("fid"));
  	  //System.out.println("op in ajax= na"+na);
  	  if(f.accept(fid))
   		  out.print("true");
  		  else 
  			   out.print("false");
  	  
    }
    
    if(op.equals("share"))
    {
  	  int fid=Integer.parseInt(request.getParameter("fid"));
  	  String name=request.getParameter("fname");
  	 Fil.share(new File(name), fid+"",user_id.toString());
  	  System.out.println(fid+name);
  	  
    }
    
          %>
