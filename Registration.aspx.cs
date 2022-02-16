using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Registration : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("INSERT INTO [users] ([name], [email], [password]) VALUES (@name, @email, @password)", con);
        cmd.Parameters.AddWithValue("@name", TextBox1.Text);
        cmd.Parameters.AddWithValue("@email", TextBox2.Text);
        cmd.Parameters.AddWithValue("@password", TextBox3.Text);
        con.Open();
        int s = (int)cmd.ExecuteNonQuery();
        con.Close();
        if (s==1)
        {
            TextBox1.Text = String.Empty;
            TextBox2.Text = String.Empty;
            TextBox3.Text = String.Empty;
            Literal1.Text = "Registration Successful";
        }
        else
        {
            TextBox1.Text = String.Empty;
            TextBox2.Text = String.Empty;
            TextBox3.Text = String.Empty;
            Literal1.Text = "Registration Unsuccessful";
        }
    }
}