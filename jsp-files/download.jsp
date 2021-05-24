<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import="com.register.Fil" %>
<%  


  String filename = ""+request.getParameter("dname") ; 
  String filepath = "D:\\ATYPROJECT\\eclipse-jee-mars-1-win32-x86_64\\apache-tomcat-7.0.65\\wtpwebapps\\friendscloud\\"+request.getParameter("dpath");; 
  response.setContentType("APPLICATION/OCTET-STREAM"); 
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\""); 

  java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath);
		  
  int i; 
  while ((i=fileInputStream.read()) != -1) {
    out.write(i); 
  } 
  fileInputStream.close(); 
%> 