// Decompiled by DJ v3.12.12.101 Copyright 2016 Atanas Neshkov  Date: 2/23/2017 10:36:01 PM
// Home Page:  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   User.java

package com;

import java.io.PrintStream;
import java.sql.*;

public class User
{

    public User(int id)
    {
        try
        {
            String DRIVER = "org.postgresql.Driver";
            String URL = "jdbc:postgresql://localhost:5432/friendscloud?user=manoj&password=manoj";
            Class.forName(DRIVER);
            Connection con = DriverManager.getConnection(URL);
            user_id = id;
            String sql = (new StringBuilder("select fname,lname,pic,user_email from user_profile,user_login where user_profile.user_id=user_login.user_id and user_profile.user_id=")).append(user_id).toString();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                fname = rs.getString(1);
                lname = rs.getString(2);
                pic = rs.getString(3);
                email = rs.getString(4);
            }
            fullname = (new StringBuilder(String.valueOf(fname))).append(" ").append(lname).toString();
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }

    public static String getfname(int id)
    {
        User u = new User(id);
        return u.fullname;
    }

    public static boolean hasprofile(int id)
    {
        User u = new User(id);
        return u.fname != null;
    }

    public static void main(String args[])
    {
        System.out.println(hasprofile(2));
    }

    public String fname;
    public String lname;
    public String pic;
    public String email;
    public String fullname;
    int user_id;
}
