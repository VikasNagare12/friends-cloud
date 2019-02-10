<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%@ include file="connection.jsp"%>
    <%@ page import="com.Mess,com.User" %>
    <%@ page session="true" %>
    
    <%
String user_name=(String)session.getAttribute("user_name");
    Integer user_id=(Integer)session.getAttribute("user_id");
    try{
    String id=request.getParameter("muser");
     int muser;
  
    if(user_id==null)
    {
    	//session.setAttribute("Error","Session Expired Please login again");
    	//response.sendRedirect("http://localhost:8080/friendscloud/login.html");
    }
    String sender="",rec="",message="";
   
    ResultSet rs;
    Statement stmt = con.createStatement();
    if(id==null)
    {
    String s = "select max(mid),too from message where frm="+user_id+" group by too";

    rs=stmt.executeQuery(s);
	rs.next();
	muser=rs.getInt(2);
    }else
    	
    	muser=Integer.parseInt(id);
    User mu=new User(muser),u=new User(user_id);
   
    int mid,i=0,total=0;
    String sq="select count(*) from message where rec="+user_id+" and sender="+muser+" or frm="+user_id+" and too="+muser;
    String sql = "select mid,message,mtime from message where rec="+user_id+" and sender="+muser;//reciver
    String sql2 = "select mid,message,mtime from message where frm="+user_id+" and too="+muser;//sender
	
	
	 rs=stmt.executeQuery(sq);
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
 <script src="ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   
    <link href="reg/assets2/css/bootstrap.css" rel="stylesheet" />
        <link href="reg/assets2/css/custom.css" rel="stylesheet" />
		<link href="reg/assets2/css/style.css" rel="stylesheet">
    <link href="reg/assets2/css/style-responsive.css" rel="stylesheet">
    <script>
   function reload(){
    	$(document).ready(function(){
    		var muser=$("#muser").val();
    		muser=muser.trim();
            	   	var n="getmessage.jsp?muser="+muser;  	    	
                $.get(n, function(data, status){
                	data=data.trim();
              // alert("clicked home");
                	document.getElementById("me").innerHTML=data;
                	   	
            });
     

    	});
   }
   setInterval('reload()',10000);
 //  setinterval("",1000);
    </script>
    <script>
    function getdate(){
    	var sd=new Date().toLocaleTimeString().replace("/.*(\d{2}:\d{2}\d{2}).*/", "$1");

    var rightNow = new Date();
    var res = rightNow.toISOString().slice(0,10).replace("/.*(\d{2}:\d{2}\d{2}).*/", "$1");
    	var s=res+":"+sd;
    	return s;
    	}
    function send(){
    	
    		var name=$("#t").val();
    		var muser=$("#muser").val();
    		muser=muser.trim();
    		$("#t").val("");
    		if(name!=""){
    			
    		     	   	var n="sendmsg.jsp?msg="+name+"&da="+getdate()+"&muser="+muser;  	    	
                $.get(n, function(data, status){
                	data=data.trim();
              // alert("clicked home"+status);
               reload();
                	//document.getElementById("me").innerHTML=data;
                             	   	
            });
    		
    		} else alert("Enter message please..."+muser);

    	
   }
    </script>
    

</head>
<body>
    
     <input type="hidden" value=" <%=muser%>" id="muser">
            

                        <div class="panel panel-success">
                            <div class="panel-heading">
                               <%=mu.fullname%>
                            </div>
                            <div class="panel-body" style="padding: 0px;">
                                <div class="chat-widget-main" id="me">


                                    <%
                                    for(int j=0;j<m.length;j++)
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
                                        <h6><%=m[j].mtime%> </h6>
                                    </div>
                                    <%}
                                    	}%>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Enter Message" id="t" />
                                    <span class="input-group-btn">
                                        <button class="btn btn-success" type="button"  id="send" onclick="send()">SEND</button>
                                    </span>
                                </div>
                            </div>
                        </div>


                    
                      
</div>
	</div>
                   
                </div>
                <!-- /. ROW  -->
               </div>
            </div>
        
    </div>
    </div>												
</body>
</html>
<% }
    catch(Exception e)
    {
    	
    	    }
    con.close();%>
