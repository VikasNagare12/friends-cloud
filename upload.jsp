
<%@ page  session="true"%>
<%@ page import="com.register.Fil,java.util.*,java.io.*" %>



<!-- Include jQuery form & jQuery script file. -->
<script src="ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="js/jquery.js" ></script>
<script src="js/jquery.form.js" ></script>
<script src="js/fileUploadScript.js" ></script>
<!-- Include css styles here -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script>
$(document).ready(function(){
    $("select").change(function(){
          //alert("update");
          var n1=$(this).val();
        	   	var n="AjaxReq.jsp?op=3&dir="+n1;  	    	
            $.get(n, function(data, status){
            	data=data.trim();
        
            	//alert("update "+n1);
            	   	
        });
    });
});
</script>

	<h3>FIle Upload</h3>
	<form id="UploadForm" action="UploadFile" method="post"
		enctype="multipart/form-data">
		<input type="file" size="60" id="myfile" name="myfile"><br>
		<%
		int id=((Integer)session.getAttribute("user_id")).intValue();
		String op=request.getParameter("op");
		session.setAttribute("op",op);
		ArrayList f=Fil.getFolders(new Integer(id).toString());
		Iterator i=f.iterator();
		if(op.equals("2"))
		{
			
			%>
			
			
			<% 
			  /*  while(i.hasNext())
			    	{
					File e=(File)i.next();			    	
			    	
			    	%>
			<option value="<%=e.getName()%>" ><%=e.getName()%></option>
			
			
			<%
			    	}
			out.print("</select>");*/
		}
		%>
		
		 <input
			type="submit" value="upload">

		<div id="progressbox">
			<div id="progressbar"></div>
			<div id="percent">0%</div>
		</div>
		<br />

		<div id="message"></div>
		
	</form>

