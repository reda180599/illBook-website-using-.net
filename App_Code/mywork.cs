using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Data;
using System.Text;



/// <summary>
/// Summary description for mywork
/// </summary>
public class mywork
{
    public SqlConnection conn = new SqlConnection();
    public SqlCommand cmd = new SqlCommand();
    public DataTable tb = new DataTable();

    public string strmsg;
    public string totalg;

	public mywork()
	{
        //conn.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=C:\\Users\\ahmed\\Documents\\Visual Studio 2015\\WebSites\\illbook\\App_Data\\illbookdb.mdf;Integrated Security=True;User Instance=True";
        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\ahmed\\Documents\\Visual Studio 2015\\WebSites\\illbook\\App_Data\\illbookdb.mdf;Integrated Security=True";
    }
    public string rundml(string state)
    {
        try
        {
            cmd.Connection = conn;
            cmd.CommandText = state;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            return strmsg = "ok";
        }
        catch (SqlException ex)
        {
            strmsg = ex.Message;
            conn.Close();
            return ex.Message;

        }

    }
    public string runq(string state)
    {
        tb = new DataTable();
        try
        {
            cmd.Connection = conn;
            cmd.CommandText = state;
            conn.Open();
            tb.Load(cmd.ExecuteReader());

            // return tb;
        }
        catch (SqlException ex)
        {
            strmsg = ex.Message;
            conn.Close();
        }
        finally { conn.Close(); }
        return strmsg;

    }
    public string en(string word)
    {
        byte[] pass = Encoding.Unicode.GetBytes(word);
        string passs = Convert.ToBase64String(pass);
        return passs;
    }
    public string de(string word)
    {
        byte[] pass = Convert.FromBase64String(word);
        string passs = Encoding.Unicode.GetString(pass);
        return passs;
    }
}