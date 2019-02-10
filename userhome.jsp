<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%@ include file="connection.jsp"%>
    <%@ page import="com.Friend,java.util.*,com.User" %>
    <%@ page session="true" %>
    
    <%
String user_name=(String)session.getAttribute("user_name");
    Integer user_id=(Integer)session.getAttribute("user_id");
   
    if(user_id==null)
    {
    	session.setAttribute("Error","Session Expired Please login again");
    	response.sendRedirect("login.html");
    }
    
    String fname="",lname="",pic="";
    String sql = "select fname,lname,pic from user_profile where user_id="+user_id;
	Statement stmt = con.createStatement();
	
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next())
	{
		fname=rs.getString(1);
		lname=rs.getString(2);
		pic=rs.getString(3);
		}
	
		fname+=" "+lname;
		String curpage=(String)session.getAttribute("currentpage");
		curpage=curpage==null?"":curpage;
 %>

<!DOCTYPE html>
<html>
  <head>
    <title>Friends Cloud</title>
    <script src="ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link href="reg/assets2/css/bootstrap.css" rel="stylesheet">
    <link href="reg/assets2/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="reg/assets2/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="reg/assets2/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="reg/assets2/lineicons/style.css">    
    <link href="reg/assets2/css/style.css" rel="stylesheet">
    <link href="reg/assets2/css/style-responsive.css" rel="stylesheet">
    <script src="reg/assets2/js/chart-master/Chart.js"></script>
    <script src="reg/assets2/js/userhome.js"></script>
    
     
    
    
    <style>	 
			iframe{
border:none;
height:250px;
width:600px;

overflow:hidden;

}
  </style>
    
  </head>

  <body onload="<%=curpage %>">
  <form name="use" >
  <input type="hidden" name="man" value="<%= user_id %>>" id="man1">

  <section id="container" >
      <header class="header black-bg"> 
			<div class="sidebar-toggle-box">
                 <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
            </div>
			<a href="index.html" class="logo"><b>Friends Cloud</b></a>

			<div class="nav notify-row" id="top_menu">
                <ul class="nav top-menu">
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
						  
                            <i class="fa fa-tasks"></i>
                            <span class="badge bg-theme">4</span>
                        </a>
                        <ul class="dropdown-menu extended tasks-bar">
                            <div class="notify-arrow notify-arrow-green"></div>
                            <li>
                                <p class="green">You have 4 pending tasks</p>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <div class="task-info">
                                        <div class="desc">DashGum Admin Panel</div>
                                        <div class="percent">40%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <div class="task-info">
                                        <div class="desc">Database Update</div>
                                        <div class="percent">60%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <div class="task-info">
                                        <div class="desc">Product Development</div>
                                        <div class="percent">10%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 10%">
                                            <span class="sr-only">10% Complete</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <div class="task-info">
                                        <div class="desc">Payments Sent</div>
                                        <div class="percent">70%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                                            <span class="sr-only">70% Complete (Important)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="external">
                                <a href="#">See All Tasks</a>
                            </li>
                        </ul>
                    </li>
                    <!-- settings end -->
                    <!-- inbox dropdown start-->
                    <li id="header_inbox_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                            <i class="fa fa-envelope-o"></i>
                            <span class="badge bg-theme">5</span>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <div class="notify-arrow notify-arrow-green"></div>
                            <li>
                                <p class="green">You have 5 new messages</p>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="reg/assets2/img/ui-zac.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Zac Snider</span>
                                    <span class="time">Just now</span>
                                    </span>
                                    <span class="message">
                                        Hi mate, how is everything?
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="reg/assets2/img/ui-divya.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Divya Manian</span>
                                    <span class="time">40 mins.</span>
                                    </span>
                                    <span class="message">
                                     Hi, I need your help with this.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="reg/assets2/img/ui-danro.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Dan Rogers</span>
                                    <span class="time">2 hrs.</span>
                                    </span>
                                    <span class="message">
                                        Love your new Home.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="reg/assets2/img/ui-sherman.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Dj Sherman</span>
                                    <span class="time">4 hrs.</span>
                                    </span>
                                    <span class="message">
                                        Please, answer asap.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">See all messages</a>
                            </li>
                        </ul>
                    </li>
                    <!-- inbox dropdown end -->
                </ul>
                <!--  notification end -->
            </div>
			<div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    
					<li><a class="logout"  data-toggle="modal" href="indexfinal.html#myModal123" onclick="upload()">Upload</a></li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li><a class="logout" href="logout.jsp">Logout</a></li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
            	</ul>
            </div>
        </header>

     <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered" id="pic" onclick="update()"><a data-toggle="modal" href="indexfinal.html#myModal12"><img src="<%= pic %>" class="img-circle" width="90px" height="90px" id="pic1"></a></p>
              	  <h5 class="centered"><%= fname %></h5>
              	  	
                  <li class="mt">
                      <a class="active" href="#" onclick="home()" id="home">
                          <i class="fa fa-dashboard"></i>
                          <span>Home</span>
                      </a>
                  </li>
					                  <li class="mt">
                      <a href="#" onclick="profile()" id="profile">
                          <i class="fa fa-tasks"></i>
                          <span >Profile</span>
                      </a>
                                           
                  </li>
                  				  
				  <li class="sub-menu">
                      <a href="#" id="friends" onclick="friends()">
                          <i class="fa fa-desktop"></i>
                          <span>Friends</span>
                      </a>
					</li>
					<li class="sub-menu">
                      <a data-toggle="modal" href="indexfinal.html#myModal1">
                          <i class="fa fa-desktop"></i>
                          <span>Send File</span>
                      </a>
					</li>
                  <li class="sub-menu">
                      <a href="#"   id="message" onclick="message('message1.jsp?')"> 
                          <i class="fa fa-cogs"></i>
                          <span>messages</span>
                      </a>
                      
                  </li>
                 <!-- <li class="sub-menu">
                      <a href="gallery.html" target="ma">
                          <i class="fa fa-book"></i>
                          <span>Galary</span>
                      </a>
                      
                      
                  </li>
-->				  

                  
                  

              </ul>
          </div>
      </aside>
      
      <div id="login-page">
	  	<div class="container">  	
		      
		      <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal123" class="modal fade"><!-- upload image -->
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"  id="cls">&times;</button>
		                         <h2 class="form-login-heading">upload file</h2>
		                      </div>
		                      <div class="modal-body" id="imgupload">
		                      <%if(user_id!=null){ %>
								<iframe src="upload.jsp?op=2">
								</iframe>
		 						                     
		 						                     <%} %>
		                         
		                      </div>
		  
							  
		                     
		                  </div>
		              </div>
		          </div><!-- upload image end -->
		          </div>
		          </div>
      
      <div id="login-page">
	  	<div class="container">  	
		      
		      <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal12" class="modal fade"><!-- upload image -->
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="getpic()" id="cls">&times;</button>
		                         <h2 class="form-login-heading">upload Profile</h2>
		                      </div>
		                      <div class="modal-body" id="imgupload">
		                      
								<iframe src="upload.jsp?op=1">
								</iframe>
		 						                     
		                         
		                      </div>
		  
							  
		                     
		                  </div>
		              </div>
		          </div><!-- upload image end -->
		          </div>
		          </div>
      
      
      
      
      
		<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">	
			<div id="login-page">
				<div class="container">
					<form class="form-up" action="#">
							<h2 class="form-login-heading">Upload Box
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</h2>
		        <div class="login-wrap">
				 <label class="checkbox">
					<div align="center">
					<br>
		                <span>
							<span class="pull-right">
						<button class="btn btn-theme02" href="#">&nbsp; &nbsp;  Search &nbsp; &nbsp; </button>
						</span>
						   <input type="text" class="for-control" placeholder="Search" width="500px"autofocus>
						</span>
		            </label>
					<br> <br>
						<div class="btn-group">
						  <button type="button" class="btn btn-theme03">Privacy</button>
						  <button type="button" class="btn btn-theme03 dropdown-toggle" data-toggle="dropdown">
						    <span class="caret"></span>
						    <span class="sr-only">Toggle Dropdown</span>
						  </button>
						  <ul class="dropdown-menu" role="menu">
						    <li><a href="#" >Privete</a></li>
						    <li><a href="#">Friends</a></li>
						    <li><a href="#">Public</a></li>
						  </ul>
						</div>
						&nbsp; &nbsp; &nbsp; 
						<button type="button" class="btn btn-primary" align="center">&nbsp;  &nbsp;  Upload  &nbsp; &nbsp; </button>
						
						<br>
						<br>
						<br>
						<br>
					
						</div>
		            </div>
					</form>
				</div>
			</div>
		</div>
      
	  
	  <div id="login-page">
	  	<div class="container">  	
		      <form class="form-login">
		          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal1" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                         <h2 class="form-login-heading">Send File</h2>
		                      </div>
		                      <div class="modal-body">
		                          <label class="checkbox">
										<div align="center">
											<br>
											<span>
											
											
											<select name="friend" id="fna">
											<% 
											
											try{
												Friend f1=new Friend(user_id.intValue());
											
						                      ArrayList a=f1.allfid();
						                      Iterator ii=a.iterator();
						                      while(ii.hasNext())
						                      {
						                    	  int id1=new Integer((Integer)ii.next()).intValue();
						                    	  User u=new User(id1); %>
											<option value=<%=id1 %>><%=u.fullname %></option>
																<%} %>			
																	</select>			</span>
											</div>
									</label>
									<label class="checkbox">
										<div align="center">
											<br>
											<span>
											<select name=fname id="fn1">
											<% 
												ArrayList all=Fil.getFiles(user_id.toString());
											Iterator i1=all.iterator();
											 while(i1.hasNext())
			    	{
					File e=(File)i1.next();			    	
			    	
			    	%>
			<option value="<%=e.getPath()%>" ><%=e.getName()%></option>
			
			
			<%
			    	}
			out.print("</select>");
											}
											catch(Exception e)
											{
												
											}
			
			%> 
											
											
											</span>
											</div>
									</label>
									<br>
									
									<div align="center">
										<button class="btn btn-theme" type="button" onclick="share()" >&nbsp;&nbsp;&nbsp;&nbsp; Send &nbsp;&nbsp;&nbsp;&nbsp;</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                          <button data-dismiss="modal" class="btn btn-default" type="button">&nbsp;&nbsp; Cancel &nbsp;&nbsp;</button>
		                          
									</div>
									<br/>
		                      </div>
		  
							  
		                     
		                  </div>
		              </div>
		          </div>
		
		      </form>	  	
	  	</div>
	  	</div>
	  </div>
	  
	  <section id="main-content" >
	  <div id="main1">
	  <%@ include file="homeview.jsp" %>
	  </div>
          
      </section>

      <footer class="site-footer">
          <div class="text-center">
            Friends Creation
			
              <a href="index.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
	    

  </section>
  

    <script src="reg/assets2/js/jquery.js"></script>
    <script src="reg/assets2/js/jquery-1.8.3.min.js"></script>
    <script src="reg/assets2/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="reg/assets2/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="reg/assets2/js/jquery.scrollTo.min.js"></script>
    <script src="reg/assets2/js/jquery.sparkline.js"></script>
    <script src="reg/assets2/js/common-scripts.js"></script>
    <script type="text/javascript" src="reg/assets2/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="reg/assets2/js/gritter-conf.js"></script>
    <script src="reg/assets2/js/sparkline-chart.js"></script>    
	<script src="reg/assets2/js/zabuto_calendar.js"></script>	
	<script type="text/javascript">

        $(document).ready(function () {
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: 'Welcome to Friends Cloud!',
            // (string | mandatory) the text inside the notification
            text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo. Free version for <a href="http://blacktie.co" target="_blank" style="color:#ffd777">BlackTie.co</a>.',
            // (string | optional) the image to display on the left
            image: '<%=pic%>',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: true,
            // (int | optional) the time you want it to be alive for before fading out
            time: '',
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });

        return false;
        });
	</script>
	
	<script type="application/javascript">
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    </script>
  

  </body>
</html>
