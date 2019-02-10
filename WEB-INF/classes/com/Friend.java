// Decompiled by DJ v3.12.12.101 Copyright 2016 Atanas Neshkov  Date: 2/23/2017 10:34:22 PM
// Home Page:  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Friend.java

package com;

import java.io.PrintStream;
import java.sql.*;
import java.util.ArrayList;

public class Friend
{

    public Friend(int id)
    {
        this.id = id;
    }

    public boolean send(int fid)
    {
        try
        {
            String DRIVER = "org.postgresql.Driver";
            String URL = "jdbc:postgresql://localhost:5432/friendscloud?user=manoj&password=manoj";
            Class.forName(DRIVER);
            Connection con = DriverManager.getConnection(URL);
            Statement stmt = con.createStatement();
            String sql = (new StringBuilder("insert into friends(user1,user2,status) values(")).append(id).append(",").append(fid).append(",0)").toString();
            stmt.executeUpdate(sql);
            con.close();
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return true;
    }

    public boolean accept(int i)
    {
        try
        {
            String DRIVER = "org.postgresql.Driver";
            String URL = "jdbc:postgresql://localhost:5432/friendscloud?user=manoj&password=manoj";
            Class.forName(DRIVER);
            Connection con = DriverManager.getConnection(URL);
            Statement stmt = con.createStatement();
            String sql = (new StringBuilder("update friends set status=1,action=")).append(id).append(" where user2=").append(id).append("and user1=").append(i).toString();
            stmt.executeUpdate(sql);
            con.close();
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return true;
    }

    public int[] allfc(int fid)
    {
        int i[] = new int[2];
        int p = 0;
        int f = 0;
        try
        {
            String DRIVER = "org.postgresql.Driver";
            String URL = "jdbc:postgresql://localhost:5432/friendscloud?user=manoj&password=manoj";
            Class.forName(DRIVER);
            Connection con = DriverManager.getConnection(URL);
            Statement stmt = con.createStatement();
            String sql = (new StringBuilder("select count(*) from friends where status=1 and user1=")).append(id).append(" or user2=").append(id).append("  and action<>0").toString();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
                f = rs.getInt(1);
            sql = (new StringBuilder("select count(*) from friends where status=0  and user2=")).append(id).toString();
            rs = stmt.executeQuery(sql);
            if(rs.next())
                p = rs.getInt(1);
            con.close();
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        i[0] = p;
        i[1] = f;
        return i;
    }

    public ArrayList allfid()
    {
        ArrayList i = new ArrayList();
        try
        {
            String DRIVER = "org.postgresql.Driver";
            String URL = "jdbc:postgresql://localhost:5432/friendscloud?user=manoj&password=manoj";
            Class.forName(DRIVER);
            Connection con = DriverManager.getConnection(URL);
            Statement stmt = con.createStatement();
            String sql = (new StringBuilder("select user1,user2 from friends where status=1 and user1=")).append(id).append(" or user2=").append(id).append("  and action<>0").toString();
            for(ResultSet rs = stmt.executeQuery(sql); rs.next();)
            {
                int k = rs.getInt(1);
                int j = rs.getInt(2);
                if(k != id && !i.contains(new Integer(k)))
                    i.add(new Integer(k));
                if(j != id && !i.contains(new Integer(j)))
                    i.add(new Integer(j));
            }

            con.close();
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return i;
    }

    public String getStatus(int fid)
    {
        String i = "";
        try
        {
            String DRIVER = "org.postgresql.Driver";
            String URL = "jdbc:postgresql://localhost:5432/friendscloud?user=manoj&password=manoj";
            Class.forName(DRIVER);
            Connection con = DriverManager.getConnection(URL);
            Statement stmt = con.createStatement();
            String sql = (new StringBuilder("select status from friends where user2=")).append(id).append("and user1=").append(fid).toString();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                if(rs.getInt(1) == 0)
                    i = (new StringBuilder("<p onclick='accept(")).append(fid).append(")'>Accept</p>").toString();
                else
                if(rs.getInt(1) == 1)
                    i = "<p onclick='unfriend()'>Un Friend</p>";
            } else
            {
                sql = (new StringBuilder("select status from friends where user2=")).append(fid).append("and user1=").append(id).toString();
                rs = stmt.executeQuery(sql);
                if(rs.next())
                {
                    if(rs.getInt(1) == 0)
                        i = "<p>Pendind </p>";
                    else
                    if(rs.getInt(1) == 1)
                        i = "<p onclick='unfriend()'>Un Friend</p>";
                } else
                {
                    i = (new StringBuilder("<p onclick='addf(")).append(fid).append(")'>Add Friend</p>").toString();
                }
            }
            con.close();
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return i;
    }

    public static void main(String args[])
    {
        Friend f = new Friend(1);
        System.out.println(f.allfid());
    }

    public int id;
}
