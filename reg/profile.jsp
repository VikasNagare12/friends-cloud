<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>
<%
String user_name=(String)session.getAttribute("user_name");
String error=(String)session.getAttribute("perror");
if(error!=null)
out.print("<p style='color:red;'>"+error+"</p>");
out.print("Hello "+user_name);
 %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Genaral Information</title>
    <link href="assets2/css/bootstrap.css" rel="stylesheet">
    <link href="assets2/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets2/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets2/js/bootstrap-daterangepicker/daterangepicker.css" />
    <link href="assets2/css/style.css" rel="stylesheet">
    <link href="assets2/css/style-responsive.css" rel="stylesheet">
     <link href="assets/css/bootstrap-fileupload.min.css" rel="stylesheet" />
     <link rel="stylesheet" type="text/css" href="css/ws-calendar.default.min.css" />
<script src="ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script type="text/javascript" src="js/ws-calendar-min.js"></script>
        <script type="text/javascript">
		
$(document).ready(function(){
$("#name").blur(function(){ 
	var name=$("#name").val();
	if(name.length<2)
	{
		$("#name").css({"color":"red"});
           $("#names").text("Enter Valid Name");
	}
    else{
			$("#name").css({"color":"green"});
			$("#names").text("");
    }
});

$("#mname").blur(function(){ 
	var name=$("#mname").val();
	if(name.length<2)
	{
		$("#mname").css({"color":"red"});
           $("#mnames").text("Enter Valid Name");
	}
    else{
			$("#mname").css({"color":"green"});
			$("#mnames").text("");
    }
});

$("#lname").blur(function(){ 
	var name=$("#lname").val();
	if(name.length<2)
	{
		$("#lname").css({"color":"red"});
           $("#lnames").text("Enter Valid Name");
	}
    else{
			$("#lname").css({"color":"green"});
			$("#lnames").text("");
    }
});


$("#nname").blur(function(){ 
	var name=$("#nname").val();
	if(name.lengtn()!=0)
	if(name.length<2)
	{
		$("#nname").css({"color":"red"});
           $("#snnames").text("Enter Valid Name");
	}
    else{
			$("#nname").css({"color":"green"});
			$("#snnames").text("");
    }
});

$("#lang").blur(function(){ 
	var name=$("#lang").val();
	if(name.length<2)
	{
		$("#lang").css({"color":"red"});
           $("#slang").text("Enter Valid Language");
	}
    else{
			$("#lang").css({"color":"green"});
			$("#slang").text("");
    }
});

$("#reg").blur(function(){ 
	var name=$("#reg").val();
	if(name.length<2)
	{
		$("#reg").css({"color":"red"});
           $("#sreg").text("Enter Valid Religiance");
	}
    else{
			$("#reg").css({"color":"green"});
			$("#sreg").text("");
    }
});
$("#cplace").blur(function(){ 
	var name=$("#cplace").val();
	if(name.length<2)
	{
		$("#cplace").css({"color":"red"});
           $("#scplace").text("Enter Valid Place");
	}
    else{
			$("#cplace").css({"color":"green"});
			$("#scplace").text("");
    }
});
$("#htown").blur(function(){ 
	var name=$("#htown").val();
	if(name.length<2)
	{
		$("#htown").css({"color":"red"});
           $("#shtown").text("Enter Valid Home Town");
	}
    else{
			$("#htown").css({"color":"green"});
			$("#shtown").text("");
    }
});
$("#school").blur(function(){ 
	var name=$("#school").val();
	if(name.length<2)
	{
		$("#school").css({"color":"red"});
           $("#sschool").text("Enter Valid School name");
	}
    else{
			$("#school").css({"color":"green"});
			$("#sschool").text("");
    }
});
$("#collage").blur(function(){ 
	var name=$("#collage").val();
	if(name.length<2)
	{
		$("#collage").css({"color":"red"});
           $("#sclloage").text("Enter Valid Collage name");
	}
    else{
			$("#collage").css({"color":"green"});
			$("#sclloage").text("");
    }
});
$("#edu").blur(function(){ 
	var name=$("#edu").val();
	if(name.length<2)
	{
		$("#edu").css({"color":"red"});
           $("#sedu").text("Enter Valid Education");
	}
    else{
			$("#edu").css({"color":"green"});
			$("#sedu").text("");
    }
});





$("#email").blur(function(){
					var emil=$("#email").val();
					if(emil.length<2)
					{
						$("#email").css({"color":"red"});
						$("#semail").text("Enter Valid Email ID");
					}
					else{
							$("#email").css({"color":"green"});
							$("#semail").text("");
						}
                $("#email").filter(function(){
                   
				   	
              var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            if( !emailReg.test( emil ) ) {
                $("#email").css({"color":"red"});
           $("#semail").text("Enter Valid Email ID");
                } else {
						$("#email").css({"color":"green"});
						$("#semail").text("");
                }
                })
            });





$("#mob").blur(function(e) {
	var a = $("#mob").val();
	var filter = /^[0-9-+]+$/;

    
   if (filter.test(a)&&a.length>=10&&a.length<=10) {
       $("#mob").css({"color":"green"});
	$("#smob").text("");
   }
   else {
      $("#mob").css({"color":"red"});
      $("#smob").text("Enter Valid mobail number");
   }
});

$("#web").blur(function(){
	var emil=$("#web").val();
$("#web").filter(function(){
var emailReg = /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/|www\.)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/;
if( !emailReg.test( emil ) ) {
$("#web").css({"color":"red"});
$("#sweb").text("Enter Webside");
} else {
		$("#web").css({"color":"green"});
		$("#sweb").text("");
}
})
});




 $( function() {
                $( ".myOwnClass" ).wsCalendar();
            });
});

</script>

  </head>
  
  <body onload="alert('Congragulation you have been registered sucessfully...')">
  <section id="container" > 
  <form class="form-horizontal style-form" method="get" action="/friendscloud/ProfileServlet">
          <section class="wrapper">
          <div class="form-group">
         
                    </div>
          	<h3><i class="fa fa-angle-right"></i> Genaral Information</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Name</h4>
                  	  
                           <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label" >Frist Name</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="fname" id="name">
                                  <font color="red">
								   <span  id="names"></span>         
									</font>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label" >last Name</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="lname" id="mname">
                                  <font color="red">
								   <span  id="mnames"></span>         
									</font>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label" id="nmane">Nick Name</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="nname">
                                  <font color="red">
								   <span  id="nnames"></span>         
									</font>
                              </div>
                          </div>
                      
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
			
			<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Basic Information</h4>
                      
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label" >Date Of Birth</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="dob">
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label" >Gender</label>
                              <div class="col-sm-10">
                                  <input type="radio"  name="gen" value="M" checked>  Male &nbsp;&nbsp;
                                  <input type="radio" name="gen" value="F" >  Female
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label" >Language</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="lang" id="lang">
                              <font color="red">
								   <span  id="slang"></span>         
									</font>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Religion</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control"name="rel" id="reg">
                                  <font color="red">
								   <span  id="sreg"></span>         
									</font>
                              </div>
                          </div>
                     
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
			
			<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Places You are lived</h4>
                      
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label" >Current Place </label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="cplace" id="cplace">
                                  <font color="red">
								   <span  id="scplace"></span>         
									</font>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">HomeTown</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="htown" id="htown">
                                  <font color="red">
								   <span  id="shtown"></span>         
									</font>
                              </div>
                          </div>
						 
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->  
						  
			<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Contact info</h4>
                      
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label" >Mobile </label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="mob" id="mob">
                                  <font color="red">
								   <span  id="smob"></span>         
									</font>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label" id="web">Website</label>
                              <font color="red">
								   <span  id="sweb"></span>         
									</font>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="web">
                              </div>
                          </div>
						 
                          </div>
						
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->		
			<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Education</h4>
                     
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">School </label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="school" id="school">
                                  <font color="red">
								   <span  id="sschool"></span>         
									</font>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label" >College</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="clg" id="college">
                                  <font color="red">
								   <span  id="scollege"></span>         
									</font>
                              </div>
                          </div>
						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label" >Education</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="edu" id="edu">
                                  <font color="red">
								   <span  id="sedu"></span>         
									</font>
                              </div>
                          </div>
						 
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->	
			<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> About You</h4>
                      
                          <div class="form-group">
                             
                                  <textarea  value="vikas" class="form-control" name="about">   </textarea>
                              
                          </div>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->	
			<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel" >
				  <div align="center">
                  	 <input type="submit" value="Create Profile"class="btn btn-theme03">
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
		  	
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

  </section>
</form>
  
    <script src="assets2/js/jquery.js"></script>
    <script src="assets2/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets2/js/jquery.dcjqaccordion.2.7.js"></script>
       <script src="assets2/js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="assets2/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!--custom switch-->
	<script src="assets2/js/bootstrap-switch.js"></script>
	
	<!--custom tagsinput-->
	<script src="assets2/js/jquery.tagsinput.js"></script>
	
	<!--custom checkbox & radio-->
	
	<script type="text/javascript" src="assets2/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="assets2/js/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript" src="assets2/js/bootstrap-daterangepicker/daterangepicker.js"></script>
	
	<script type="text/javascript" src="assets2/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	
	
	<script src="assets2/js/form-component.js"></script>    
    
    
  <script>
      //custom select box
      
      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>
