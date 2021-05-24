<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%@ include file="connection.jsp"%>
    
    <%@ page session="true" %>
    
    <%
String user_name=(String)session.getAttribute("user_name");
    Integer user_id=(Integer)session.getAttribute("user_id");
   
    if(user_id==null)
    {
    	session.setAttribute("Error","Session Expired Please login again");
    	response.sendRedirect("http://localhost:8080/friendscloud/login.html");
    }
    String fname="",lname="",nname="",dob="",gen="",lang="",rel="",cplace="",htown="",mob="",web="",school="",about="",edu="",clg="",email="";
    String sql = "select fname,lname,nname,clg,gen,lang,rel,cplace,htown,mob,web,school,about,edu,dob from user_profile where user_id="+user_id;
	Statement stmt = con.createStatement();
	
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next())
	{
		fname=rs.getString(1);
		lname=rs.getString(2);
		nname=rs.getString(3);
		clg=rs.getString(4);
		gen=rs.getString(5);
		lang=rs.getString(6);
		rel=rs.getString(7);
		cplace=rs.getString(8);
		htown=rs.getString(9);
		mob=rs.getString(10);
		web=rs.getString(11);
		school=rs.getString(12);
	    about=rs.getString(13);
		edu=rs.getString(14);
		dob=rs.getString(15);
		}
	sql="select user_email from user_login where user_id="+user_id;
	rs=stmt.executeQuery(sql);
	if(rs.next()){
		email=rs.getString(1);
	}
	session.setAttribute("currentpage","profile()");
 %>
  
          	<h3><i class="fa fa-angle-right"></i> Genaral Information</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          		
          		 <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Name</h4>
                      <form class="form-horizontal style-form" method="get">
                         </form>
                          </div>
                  <div class="form-panel">
                  	  
                      <form class="form-horizontal style-form" method="get">
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Frist Name</label>
                              <div class="col-sm-10">
                                  <p class="form-control-static"><%= fname%></p>
                              </div>
                          </div>
						
                                  
                         
						  
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Last Name</label>
                              <div class="col-sm-10">
                                  <p class="form-control-static"><%= lname%></p>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Nick Name</label>
                              <div class="col-sm-10">
                                 <p class="form-control-static"><%= nname%></p>
                              </div>
                          </div>
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
			
			<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Basic Information</h4>
                      <form class="form-horizontal style-form" method="get">
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Date Of Birth</label>
                              <div class="col-sm-10">
                                  <p class="form-control-static"><%= dob%></p>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Gender</label>
                              <div class="col-sm-10">
                                  <p class="form-control-static"><%= gen%></p>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Language</label>
                              <div class="col-sm-10">
                                  <p class="form-control-static"><%= lang%></p>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Religious</label>
                              <div class="col-sm-10">
                                  <p class="form-control-static"><%= rel%></p>
                              </div>
                          </div>
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
			
			<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Places You are lived</h4>
                      <form class="form-horizontal style-form" method="get">
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Current Place </label>
                              <div class="col-sm-10">
                                  <p class="form-control-static"><%= cplace%></p>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">HomeTown</label>
                              <div class="col-sm-10">
                                  <p class="form-control-static"><%= htown%></p>
                              </div>
                          </div>
						 </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->  
						  
			<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Contact info</h4>
                      <form class="form-horizontal style-form" method="get">
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Mobile </label>
                              <div class="col-sm-10">
                                  <p class="form-control-static"><%= mob%></p>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Website</label>
                              <div class="col-sm-10">
                                  <p class="form-control-static"><%= web%></p>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Email</label>
                              <div class="col-sm-10">
                                 <p class="form-control-static"><%= email%></p>
                              </div>
                          </div>
						 </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->		
			<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Education</h4>
                      <form class="form-horizontal style-form" method="get">
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">School </label>
                              <div class="col-sm-10">
                                  <p class="form-control-static"><%= school%></p>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">College</label>
                              <div class="col-sm-10">
                                  <p class="form-control-static"><%= clg%></p>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Education</label>
                              <div class="col-sm-10">
                                  <p class="form-control-static"><%= edu%></p>
                              </div>
                          </div>
						 </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->	
			<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> About You</h4>
                      
                          <div class="form-group">
                             
                                  <p class="form-control-static"><%= about%></p>
                              
                          </div>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->	
			<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel" >
				  <div align="center">
                  	 <button type="button" class="btn btn-theme03">Submit</button>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
		  	
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

  </section>

  
    
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>
<%con.close(); %>
 
