<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
  
    <%@ page import="java.io.*,com.register.Fil,java.util.Date" %>
   
    <%@ page session="true" %>
    
    <%
    

    Integer user_id1=(Integer)session.getAttribute("user_id");
   
    
   try{
    
    String id=user_id1.toString();
    
    
   long fsize;
    String fname1="",ftype="",fdate="",privacy="";
   
    File cur=(File)session.getAttribute("curf");
    if(cur==null)
    {
    	
    	cur=new File(Fil.f,id);
    	session.setAttribute("curf",cur);
    }
		File[] f=cur.listFiles();
	
		 %>



   
    

    
 
  
         
          	<h3><i class="fa fa-angle-right"></i> All Documents</h3>
              <div class="row mt">
                  <div class="col-md-12">
                      <div class="content-panel">
                          <table class="table table-striped table-advance table-hover">
	                  	  	  <h4><i class="fa fa-angle-right"></i> My Files</h4>
	                  	  	  <hr>
                              <thead>
                              <tr>
									<th>Image</th>
                                  <th>Name</th>
                                  <th class="hidden-phone"> Type</th>
                                  <th><i class="fa fa-bookmark"></i> Date Added</th>
                                  <th><i class=" fa fa-edit"></i> Size</th>	
								
                              </tr>
                              </thead>
								<tbody>
								<%
								for(int i=0;i<f.length;i++)
								{
									if(f[i].isFile())
									{
									fname1=f[i].getName();
									ftype=Fil.type(f[i]);
									fsize=f[i].length();
									fdate=(new Date(f[i].lastModified())).toString();
									
								%>
                              <tr>
								<td><img src="<%=ftype.equals("image")?Fil.getp(f[i].getPath()):"reg/assets2/img/ui-zac.jpg" %>" height="35" width="35"></td>
                                  <td class="hidden-phone"><%= fname1%></td>
                                  <td><%= ftype%></td>
								  <td><%= fdate%></td>
								  <td><%= (fsize/1000)+" kb"%></td>
                                  
                                  <td>
                                      <button class="btn btn-success btn-xs" ><i class="fa fa-check"></i></button>
                                     <% if(f[i].isFile()){%> <a href="download.jsp?dpath=<%=Fil.getp(f[i].getPath()) %>&dname=<%=fname1 %>" onclick="window.open(this.href);return false;"><button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button></a><%} %>
                                      <button class="btn btn-danger btn-xs" onclick="del('<%=Fil.getp(f[i].getPath()) %>')"><i class="fa fa-trash-o "></i></button>
                                  </td>
                              </tr>
                              <%}}
   
  %>
                              </tbody>
                          </table>						  						 
                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->

 <div class="content-panel">
                          <table class="table table-striped table-advance table-hover">
	                  	  	  <h4><i class="fa fa-angle-right"></i>Sahred  Files</h4>
	                  	  	  <hr>
                              <thead>
                              <tr>
									<th>Image</th>
                                  <th>Name</th>
                                  <th class="hidden-phone">Send By</th>
                                  <th><i class="fa fa-bookmark"></i> Date Added</th>
                                  <th><i class=" fa fa-edit"></i> Size</th>	
								
                              </tr>
                              </thead>
								<tbody>
								<%
								File cur1=new File(cur.getPath()+"\\"+"shared");
								 f=cur1.listFiles();
								for(int i=0;i<f.length;i++)
								{
									if(f[i].isFile())
									{
									fname1=f[i].getName();
									ftype=Fil.geto(f[i].getName(), id);
									fsize=f[i].length();
									fdate=(new Date(f[i].lastModified())).toString();
									
								%>
                              <tr>
								<td><img src="<%=ftype.equals("image")?Fil.getp(f[i].getPath()):"reg/assets2/img/ui-zac.jpg" %>" height="35" width="35"></td>
                                  <td class="hidden-phone"><%= fname1%></td>
                                  <td><%= ftype%></td>
								  <td><%= fdate%></td>
								  <td><%= (fsize/1000)+" kb"%></td>
                                  
                                  <td>
                                      <button class="btn btn-success btn-xs" ><i class="fa fa-check"></i></button>
                                     <% if(f[i].isFile()){%> <a href="download.jsp?dpath=<%=Fil.getp(f[i].getPath()) %>&dname=<%=fname1 %>" onclick="window.open(this.href);return false;"><button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button></a><%} %>
                                      <button class="btn btn-danger btn-xs" onclick="del('<%=Fil.getp(f[i].getPath()) %>')"><i class="fa fa-trash-o "></i></button>
                                  </td>
                              </tr>
                              <%}}}
   
   catch(Exception e)
   {
   
   }%>
                              </tbody>
                          </table>						  						 
                      </div><!-- /content-panel -->
		
    <!-- js placed at the end of the document so the pages load faster -->
    
    
 

    <!--common script for all pages-->
    

    <!--script for this page-->
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>

