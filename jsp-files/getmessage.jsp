<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%@ include file="connection.jsp"%>
    <%@ page import="com.Mess" %>
    <%@ page session="true" %>
    
    <%
String user_name=(String)session.getAttribute("user_name");
    Integer user_id=(Integer)session.getAttribute("user_id");
    String id=request.getParameter("muser");
    int muser=Integer.parseInt(request.getParameter("muser"));
  
    if(user_id==null)
    {
    	//session.setAttribute("Error","Session Expired Please login again");
    	//response.sendRedirect("http://localhost:8080/friendscloud/login.html");
    }
    String sender="",rec="",message="";
    int mid,i=0,total=0;
    String sq="select count(*) from message where rec="+user_id+" and sender="+muser+" or frm="+user_id+" and too="+muser;
    String sql = "select mid,message,mtime from message where rec="+user_id+" and sender="+muser;//reciver
    String sql2 = "select mid,message,mtime from message where frm="+user_id+" and too="+muser;//sender
	Statement stmt = con.createStatement();
	
	ResultSet rs=stmt.executeQuery(sq);
	rs.next();
	total=rs.getInt(1);
	Mess[] m=new Mess[total];
	rs=stmt.executeQuery(sql);
	while(rs.next())
	{ 
		mid=rs.getInt(1);
		message=rs.getString(2);
		String mtime=rs.getString(3);
		
		m[i]=new Mess(mid,message,"R",mtime);
		i++;
		
	}
	//Connection con1= DriverManager.getConnection(URL);
	//stmt2=con1.createStatement();
	rs=stmt.executeQuery(sql2);
	//ResultSetMetaData rsm=rs.getMetaData();
	
	while(rs.next())
	{
		mid=rs.getInt(1);
		message=rs.getString(2);
		//pic=rs.getString(3);
		String mtime=rs.getString(3);
		m[i]=new Mess(mid,message,"S",mtime);
		i++;
		
	}
	
	m=Mess.sort(m);
		
	
 %>
<html>
<head>

   
    <link href="reg/assets2/css/bootstrap.css" rel="stylesheet" />
        <link href="reg/assets2/css/custom.css" rel="stylesheet" />
		<link href="reg/assets2/css/style.css" rel="stylesheet">
    <link href="reg/assets2/css/style-responsive.css" rel="stylesheet">
    

</head>
<body>
    
     
     


                                    <%for(int j=0;j<m.length;j++)
                                    	{
                                    	if(m[j].flag.equals("S"))
                                    	{
                                    	%>
                                    
                                    <div class="chat-widget-left">
                                    <button type="button" class="close" >&times;</button>
                                         <%= m[j].mes%>
                                    </div>
                                    <div class="chat-widget-name-left">
                                        <h6><%= m[j].mtime%> </h6>
                                    </div>
                                    <%}else if(m[j].flag.equals("R"))
                                    	{%>
                                    <div class="chat-widget-right">
                                    <button type="button" class="close" >&times;</button>
                                        <%= m[j].mes%>
                                    </div>
                                    <div class="chat-widget-name-right">
                                        <h6><%=m[j].mtime %> </h6>
                                    </div>
                                    <%}
                                    	}
                                    	
                                    	con.close();%>
                              
                    