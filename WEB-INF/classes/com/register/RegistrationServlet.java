// Decompiled by DJ v3.12.12.101 Copyright 2016 Atanas Neshkov  Date: 2/23/2017 10:37:48 PM
// Home Page:  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   RegistrationServlet.java

package com.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

// Referenced classes of package com.register:
//            Fil

@WebServlet(value={"/reg/RegistrationServlet"})
public class RegistrationServlet extends HttpServlet
{

    public RegistrationServlet()
    {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        HttpSession hs = request.getSession(true);
        try
        {
            String DRIVER = "org.postgresql.Driver";
            String URL = "jdbc:postgresql://localhost:5432/friendscloud?user=manoj&password=manoj";
            Class.forName(DRIVER);
            Connection con = DriverManager.getConnection(URL);
            hs.setAttribute("user_name", name);
            String sql = (new StringBuilder("insert into user_login(user_name,cur_pswd,old_pswd,pswd_ch_date,user_email) values('")).append(name).append("','").append(pass).append("','password','2016-2-19','").append(email).append("')").toString();
            Statement stmt = con.createStatement();
            int n = stmt.executeUpdate(sql);
            String ss = (new StringBuilder("Select user_id from user_login where user_name='")).append(name).append("'").toString();
            ResultSet rs = stmt.executeQuery(ss);
            Integer use = new Integer(1);
            if(rs.next())
            {
                int uid = rs.getInt(1);
                use = new Integer(uid);
                hs.setAttribute("user_id", use);
            }
            if(n == 1)
            {
                out.println("<script>alert('Registered Sucess fully')</script>");
                Fil f = new Fil();
                f.init(use.toString());
            } else
            {
                out.println("<script>alert('Registered Fail')</script>");
            }
            con.close();
            response.sendRedirect("profile.jsp");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        doGet(request, response);
    }

    private static final long serialVersionUID = 1L;
}
