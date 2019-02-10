
function oo()
{
//alert("oo");
$(function(){
$('#myModal1').modal('hide');

})
}
function share()
{
	 var n1=$('#fna').val();
	 var n2=$('#fn1').val();
	 var n="ajaxfrnd.jsp?op=share&fid="+n1+"&fname="+n2;  	    	
	    $.get(n, function(data, status){
	    	data=data.trim();
	    	friends();
	   //alert("clicked");
	    	
	    	alert("add+"+data+n2);
	    });
}


function home()
{
	$(document).ready(function(){
        
        	   	var n="homeview.jsp";  	    	
            $.get(n, function(data, status){
            	data=data.trim();
           
            	document.getElementById("main1").innerHTML=data;
            	   	
        });
    });

	
}


function message(n)
{
	
	$(document).ready(function(){
		
			 //alert("message");
        	 	    	
            $.get(n, function(data, status){
            	data=data.trim();
           
            	document.getElementById("main1").innerHTML=data;
            	   	
        });
		 });
   

	
}


function changepic()
{
	$(document).ready(function(){
        $("").click(function(){  
        	   	var n="upload.jsp?op=1";  	    	
            $.get(n, function(data, status){
            	data=data.trim();
          //alert("clicked  change pic");
            	document.getElementById("main1").innerHTML=data;
            	   	
        });
    });

	});
}

function del(name)
{
	
	        	   	var n="AjaxReq.jsp?op=del&fname1="+name;  	
	        	   //	alert("delete : "+name);
	            $.get(n, function(data, status){ 	            	         		  
	            	alert("File deleted sucessfully"+status+data);
	            	data=data.trim();
	            	alert("File deleted sucessfully"+data);
	            	home();
	        }); 
	
	   
	
}

function upload()
{
	$(document).ready(function(){
          //alert("update");
        	   	var n="AjaxReq.jsp?op=2";  	    	
            $.get(n, function(data, status){
            	data=data.trim();
        
            	//alert("update "+status);
            	   	
        });
    });
}


function update()
{
	$(document).ready(function(){
          //alert("update");
        	   	var n="AjaxReq.jsp?op=1";  	    	
            $.get(n, function(data, status){
            	data=data.trim();
        
            	//alert("update "+status);
            	   	
        });
    });
}


function getpic()
{
	$(document).ready(function(){
          
        	   	var n="AjaxReq.jsp?op=pic";  	    	
            $.get(n, function(data, status){
            	data=data.trim();
         
            document.getElementById("pic").innerHTML=data;
            	   	
        });
    });
}
function profile()
{
	$(document).ready(function(){
       
        	   	var n="showprofile.jsp";  	    	
            $.get(n, function(data, status){
            	data=data.trim();
          // alert("clicked");
            	document.getElementById("main1").innerHTML=data;
            	//$("#myModal12").show();
            	   	
       
    });

	});
}
function mess()
{
	$(document).ready(function(){
        $("#profile").click(function(){  
        	   	var n="message1.jsp?muser";  	    	
            $.get(n, function(data, status){
            	data=data.trim();
          // alert("clicked");
            	document.getElementById("main1").innerHTML=data;
            	//$("#myModal12").show();
            	   	
        });
    });

	});
}
function ractivity()
{
	
}

function friends()                                 //                 friends Functions
{
	$(document).ready(function(){
         
        	   	var n="showfriend.jsp";  	    	
            $.get(n, function(data, status){
            	data=data.trim();
           //alert("clicked");
            	document.getElementById("main1").innerHTML=data;
            	   	
       
    });

	});	
}
function addf(fid)
{
		

        
	   	var n="ajaxfrnd.jsp?op=add&fid="+fid;  	    	
    $.get(n, function(data, status){
    	data=data.trim();
    	friends();
   //alert("clicked");
    	
    	alert("add+"+data);
    	
    	   	



});	
}

function accept(fid)
{
		

        
	   	var n="ajaxfrnd.jsp?op=accept&fid="+fid;  	    	
    $.get(n, function(data, status){
    	data=data.trim();
    	friends();
   //alert("clicked");
    	
    	alert("add+"+data);
    	
    	   	



});	
}