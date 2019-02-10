// Decompiled by DJ v3.12.12.101 Copyright 2016 Atanas Neshkov  Date: 2/23/2017 10:36:57 PM
// Home Page:  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Fil.java

package com.register;

import com.User;
import java.io.*;
import java.nio.file.*;
import java.sql.*;
import java.util.ArrayList;

public class Fil
{

    public static String getp(String p)
    {
        File f = new File(p);
        String parent = "";
        String cur = "";
        String path = "";
        for(int i = 1; !cur.equals("fusers"); i++)
        {
            cur = f.getName();
            if(i == 1)
                path = cur;
            else
                path = (new StringBuilder(String.valueOf(cur))).append("\\").append(path).toString();
            f = f.getParentFile();
        }

        path = path.replace('\\', '/');
        return path;
    }

    Fil()
    {
    }

    Fil(String pat)
    {
        path = pat;
    }

    void init(String id)
        throws Exception
    {
        File f1 = new File(f, id);
        if(!f1.exists())
        {
            f1.mkdir();
            File f2 = new File((new StringBuilder(String.valueOf(f1.getPath()))).append("\\shared").toString());
            f2.mkdir();
        }
    }

    public static ArrayList getFiles(String id)
    {
        ArrayList folders = new ArrayList();
        File f1 = new File(f, id);
        File f[] = f1.listFiles();
        for(int i = 0; i < f.length; i++)
            if(f[i].isFile())
                folders.add(f[i]);

        return folders;
    }

    public static ArrayList getFolders(String id)
    {
        ArrayList folders = new ArrayList();
        File f1 = new File(f, id);
        File f[] = f1.listFiles();
        for(int i = 0; i < f.length; i++)
            if(f[i].isDirectory())
                folders.add(f[i]);

        return folders;
    }

    public static String type(File f)
    {
        String n = f.getName();
        if(f.isDirectory())
            return "Folder";
        if(f.isFile())
        {
            n = n.toLowerCase();
            if(n.endsWith(".png") || n.endsWith(".jpg") || n.endsWith(".jfif") || n.endsWith(".bmp"))
                return "image";
            if(n.endsWith(".avi") || n.endsWith(".mp4") || n.endsWith(".flv") || n.endsWith(".wmv") || n.endsWith(".3gp") || n.endsWith(".flv") || n.endsWith(".mkv"))
                return "video";
            else
                return "File";
        } else
        {
            return "File";
        }
    }

    public static boolean delete(String name)
    {
        File f1 = new File(f1, name);
        return f1.delete();
    }

    public static String geto(String n, String id)
    {
        int m = 0;
        try
        {
            String DRIVER = "org.postgresql.Driver";
            String URL = "jdbc:postgresql://localhost:5432/friendscloud?user=manoj&password=manoj";
            Class.forName(DRIVER);
            Connection con = DriverManager.getConnection(URL);
            Statement stmt = con.createStatement();
            String sql = (new StringBuilder("select frm from shared where too=")).append(id).append("and url='").append(n).append("'").toString();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
                m = rs.getInt(1);
            con.close();
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return (new User(m)).fullname;
    }

    public static void share(File f, String fid, String id)
        throws IOException
    {
        File f1 = new File(f, fid);
        File f2 = new File((new StringBuilder(String.valueOf(f1.getPath()))).append("\\shared").toString());
        Files.copy((new File(f.getPath())).toPath(), (new File((new StringBuilder(String.valueOf(f2.getPath()))).append("\\").append(f.getName()).toString())).toPath(), new CopyOption[] {
            StandardCopyOption.REPLACE_EXISTING
        });
        File ff = new File((new StringBuilder(String.valueOf(f2.getPath()))).append("\\").append(f.getName()).toString());
        try
        {
            String DRIVER = "org.postgresql.Driver";
            String URL = "jdbc:postgresql://localhost:5432/friendscloud?user=manoj&password=manoj";
            Class.forName(DRIVER);
            Connection con = DriverManager.getConnection(URL);
            Statement stmt = con.createStatement();
            String sql = (new StringBuilder("insert into shared values(")).append(id).append(",").append(fid).append(",'").append(ff.getName()).append("')").toString();
            stmt.executeUpdate(sql);
            con.close();
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }

    public static void newfolder(String id, String name)
    {
        File f1 = new File(f, id);
        File f2 = new File((new StringBuilder(String.valueOf(f1.getPath()))).append("\\").append(name).toString());
        f2.mkdir();
    }

    public static void main(String args1[])
        throws Exception
    {
    }

    String path;
    String name;
    public static final String root1 = "D:\\ATYPROJECT\\eclipse-jee-mars-1-win32-x86_64\\apache-tomcat-7.0.65\\wtpwebapps\\friendscloud";
    public static final String root = "D:\\ATYPROJECT\\eclipse-jee-mars-1-win32-x86_64\\apache-tomcat-7.0.65\\wtpwebapps\\friendscloud\\fusers";
    public static final File f = new File("D:\\ATYPROJECT\\eclipse-jee-mars-1-win32-x86_64\\apache-tomcat-7.0.65\\wtpwebapps\\friendscloud\\fusers\\");
    public static final File f1 = new File("D:\\ATYPROJECT\\eclipse-jee-mars-1-win32-x86_64\\apache-tomcat-7.0.65\\wtpwebapps\\friendscloud\\");

}
