<%@ page import="java.sql.*" %><%@ page import="java.util.*" %><%
      String DRIVER = "org.postgresql.Driver";
      String URL ="jdbc:postgresql://localhost:5432/friendscloud?user=manoj&password=manoj";
      Class.forName(DRIVER);
      Connection con = DriverManager.getConnection(URL);
%>
