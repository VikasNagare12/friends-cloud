
import com.register.Fil;
import java.io.*;
import java.sql.*;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(value={"/UploadFile"})
public class UploadFile extends HttpServlet
{

    public UploadFile()
    {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        HttpSession hs = request.getSession(true);
        int user_id = ((Integer)hs.getAttribute("user_id")).intValue();
        PrintWriter out = response.getWriter();
        String op = (String)hs.getAttribute("op");
        System.out.println((new StringBuilder("op in upload file=")).append(op).toString());
        try
        {
            String name = "";
            String DRIVER = "org.postgresql.Driver";
            String URL = "jdbc:postgresql://localhost:5432/friendscloud?user=manoj&password=manoj";
            Class.forName(DRIVER);
            Connection con = DriverManager.getConnection(URL);
            String UPLOAD_DIRECTORY = (new StringBuilder("D:\\ATYPROJECT\\eclipse-jee-mars-1-win32-x86_64\\apache-tomcat-7.0.65\\wtpwebapps\\friendscloud\\fusers/")).append((new Integer(user_id)).toString()).toString();
            if(op.equals("2"))
            {
                String nam = (String)hs.getAttribute("dir");
                System.out.print((new StringBuilder("in 2 name=")).append(nam).toString());
                if(nam != null)
                    UPLOAD_DIRECTORY = (new StringBuilder("D:\\ATYPROJECT\\eclipse-jee-mars-1-win32-x86_64\\apache-tomcat-7.0.65\\wtpwebapps\\friendscloud\\fusers/")).append((new Integer(user_id)).toString()).append("/").append(nam).toString();
            }
            if(op.equals("1"))
                UPLOAD_DIRECTORY = (new StringBuilder("D:\\ATYPROJECT\\eclipse-jee-mars-1-win32-x86_64\\apache-tomcat-7.0.65\\wtpwebapps\\friendscloud\\fusers/")).append((new Integer(user_id)).toString()).toString();
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            response.setContentType("text/html");
            if(isMultipart)
            {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List multiparts = upload.parseRequest(request);
                for(Iterator iterator = multiparts.iterator(); iterator.hasNext();)
                {
                    FileItem item = (FileItem)iterator.next();
                    if(!item.isFormField())
                    {
                        name = (new File(item.getName())).getName();
                        item.write(new File((new StringBuilder(String.valueOf(UPLOAD_DIRECTORY))).append("\\").append(name).toString()));
                    }
                }

            }
            if(op.equals("1"))
            {
                Statement stmt = con.createStatement();
                String dir = (new StringBuilder(String.valueOf(UPLOAD_DIRECTORY))).append("/").append(name).toString();
                String sql = (new StringBuilder("update user_profile set pic='")).append(Fil.getp(dir)).append("' where user_id=").append(user_id).toString();
                stmt.execute(sql);
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
            e.printStackTrace();
        }
    }

    private static final long serialVersionUID = 1L;
}
