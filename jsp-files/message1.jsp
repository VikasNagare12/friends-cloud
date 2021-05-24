<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.Friend,java.util.*,com.User" %>
    
    <%String id=request.getParameter("muser");
    
        Integer user_id=(Integer)session.getAttribute("user_id");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
iframe.mess{
border:none;
height:550px;
width:400px;
margin-top:20px;
overflow:visible;


}
</style>
 <script src="ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   
    <link href="reg/assets2/css/bootstrap.css" rel="stylesheet" />
        <link href="reg/assets2/css/custom.css" rel="stylesheet" />
		<link href="reg/assets2/css/style.css" rel="stylesheet">
    <link href="reg/assets2/css/style-responsive.css" rel="stylesheet">
</head>
<body>
<div style="margin: 0px 20px 3px 0px;width:400px;" >
	<div class="col-lg-3 ds" style="width:400px;">
						<h3>Your friends</h3>
                      <!-- First Member -->
                      <%
                      Friend f=new Friend(user_id.intValue());
                      ArrayList a=f.allfid();
                      Iterator ii=a.iterator();
                      while(ii.hasNext())
                      {
                    	  int id1=new Integer((Integer)ii.next()).intValue();
                    	  User u=new User(id1);
                      
                      %>
                      <div>
                      <a href="message.jsp?muser=<%=id1 %>" target="mes">
                      <div class="desc"><span class="badge bg-theme">4</span>
                      	<div class="thumb">
                      		<img class="img-circle" src="<%=u.pic %>" width="50px" height="50px" align="">
                      	</div>
                      	<div class="details" style="margin-left:30px;">
                      		<p><%= u.fullname%><br/>
                      		   <muted style="color:green;">Available</muted>
                      		</p>
                      	</div>
                      </div></a></div>
                      <%} %>
                      </div>
						</div>	
<iframe src="message.jsp?muser=<%=id%>" class="mess" marginwidth="30" name="mes"></iframe>


</body>
</html>