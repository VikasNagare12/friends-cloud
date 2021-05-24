<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%@ include file="connection.jsp"%>
    <%@ page import="com.Friend" %>
    
    <%@ page session="true" %>
    
    <%
	String user_name=(String)session.getAttribute("user_name");
    Integer user_id=(Integer)session.getAttribute("user_id");
    
	Friend fr =new Friend(user_id.intValue());   
    
   /* if(user_id==null)
    {
    	session.setAttribute("Error","Session Expired Please login again");
    	response.sendRedirect("http://localhost:8080/friendscloud/login.html");
    }*/
    String fname="",lname="",pic="";
    
    
    String sql = "select user_id from user_profile  ";
    Connection con1 = DriverManager.getConnection(URL);
Statement stmt1 = con1.createStatement();
Statement stmt = con.createStatement();
	session.setAttribute("currentpage","friends()");
	
    
    
 %>
<html lang="en">
  <head>
    
   <script src="ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="reg/assets2/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="reg/assets2/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="reg/assets2/css/style.css" rel="stylesheet">
    <link href="reg/assets2/css/style-responsive.css" rel="stylesheet">

    <script src="reg/assets2/js/chart-master/Chart.js"></script>
     <script src="reg/assets2/js/userhome.js"></script>

    
  </head>

  <body>


  <section id="container" style="margin-bottom:0px;">
   
          <section class="wrapper site-min-height" style="margin-top:0px;">
          	<h3><i class="fa fa-angle-right"></i> All Friends </h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          		
          		<% Friend f=new Friend(user_id.intValue());
                ArrayList a=f.allfid();
                Iterator ii=a.iterator();
                while(ii.hasNext())
                {
          			int id=new Integer((Integer)ii.next()).intValue();  
          			 sql = "select fname,lname,pic from user_profile where user_id="+id;
          				ResultSet rs=stmt.executeQuery(sql);
          			if(rs.next())
          			{
          				fname=rs.getString(1);
          				lname=rs.getString(2);
          				pic=rs.getString(3);
          				}
          			
          				fname+=" "+lname;
          		     %>
          		
					
					<! -- PROFILE 01 PANEL -->
					<div class="col-lg-4 col-md-4 col-sm-4 mb">
							<!-- WHITE PANEL - TOP USER -->
							<div class="white-panel pn" style="margin:20px 0px 20px 0px;">
								<div class="white-header">
									<h5>Friend</h5>
								</div>
								<p><img src="<%= pic%>" class="img-circle" width="80px" height="80px"></p>
								<p><b><%out.print(fname);%> </b></p>
									<div class="row">
										<div class="col-md-6" >
											<p class="small mt">Mutual Friends</p>
											<p>20</p>
											<div class="profile-01 centered" onclick="message('message1.jsp?muser=<%=id%>')"><a  href="#">
									<p id="">Send Message</p></a>
								</div>
										</div>
										<div class="col-md-6">
											<p class="small mt">TOTAL Friends</p>
											<p>40</p>
											<div class="profile-01 centered">
									<%=fr.getStatus(id)%>
								</div>
											
										</div>
										
									</div>
									
								
							</div>
						</div> <!-- /col-md-4 -->
					
				
						<%} %>
						
							
					
          		</div>
          	</div>
			
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
  

    <!-- js placed at the end of the document so the pages load faster -->
    
    <script src="reg/assets2/js/bootstrap.min.js"></script>
   
 
    <script src="reg/assets2/js/jquery.sparkline.js"></script>

    <!--common script for all pages-->
    <script src="reg/assets2/js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="reg/assets2/js/sparkline-chart.js"></script>    
    
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>
