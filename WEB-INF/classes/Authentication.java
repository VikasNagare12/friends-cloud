
import com.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@WebServlet(value={"/Authentication"})
public class Authentication extends HttpServlet
{

    public Authentication()
    {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String name = request.getParameter("user_name");
        String pass = request.getParameter("pass");
        HttpSession hs = request.getSession(true);
        try
        {
            String DRIVER = "org.postgresql.Driver";
            String URL = "jdbc:postgresql://localhost:5432/friendscloud?user=manoj&password=manoj";
            Class.forName(DRIVER);
            Connection con = DriverManager.getConnection(URL);
            hs.setAttribute("user_name", name);
            String sql = (new StringBuilder("select user_id from user_login where user_name='")).append(name).append("'and cur_pswd='").append(pass).append("'").toString();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                int uid = rs.getInt(1);
                Integer use = new Integer(uid);
                hs.setAttribute("user_id", use);
                if(!User.hasprofile(use.intValue()))
                {
                    response.sendRedirect("reg/profile.jsp");
                    hs.setAttribute("perror", "Firstly fill profile details then log in .. ");
                } else
                {
                    response.sendRedirect("userhome.jsp");
                }
            } else
            {
                out.print("Invalid user");
            }
            con.close();
        }
        catch(Exception exception) { }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        doGet(request, response);
    }

    private static final long serialVersionUID = 1L;
}
