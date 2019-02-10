// Decompiled by DJ v3.12.12.101 Copyright 2016 Atanas Neshkov  Date: 2/23/2017 10:35:28 PM
// Home Page:  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Mess.java

package com;


public class Mess
{

    public Mess(int id, String me, String f, String t)
    {
        mid = id;
        mes = me;
        flag = f;
        mtime = t;
    }

    public static Mess[] sort(Mess m[])
    {
        for(int i = 0; i < m.length; i++)
        {
            for(int j = i + 1; j < m.length; j++)
                if(m[i].mid > m[j].mid)
                {
                    Mess temp = m[i];
                    m[i] = m[j];
                    m[j] = temp;
                }

        }

        return m;
    }

    public static void main(String args1[])
    {
    }

    public int mid;
    public String mes;
    public String flag;
    public String mtime;
}
