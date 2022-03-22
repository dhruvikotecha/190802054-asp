using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    { 
        //DeleteCommand="DELETE FROM [contacts] WHERE [id] = @id" 
        //InsertCommand="INSERT INTO [contacts] ([name], [email], [subject], [phone], [message]) VALUES (@name, @email, @subject, @phone, @message)"  
        //SelectCommand="SELECT [id], [name], [email], [subject], [phone], [message] FROM [contacts]" 
        //UpdateCommand="UPDATE [contacts] SET [name] = @name, [email] = @email, [subject] = @subject, [phone] = @phone, [message] = @message WHERE [id] = @id">
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("INSERT INTO [contacts] ([name], [email], [subject], [phone], [message]) VALUES (@name, @email, @subject, @phone, @message)", con);
        cmd.Parameters.AddWithValue("@name", TextBox1.Text);
        cmd.Parameters.AddWithValue("@email", TextBox2.Text);
        cmd.Parameters.AddWithValue("@subject", TextBox3.Text);
        cmd.Parameters.AddWithValue("@phone", TextBox4.Text);
        cmd.Parameters.AddWithValue("@message", TextBox5.Text);
        con.Open();
        int s = cmd.ExecuteNonQuery();
        con.Close();
        if (s == 1)
        {
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            TextBox4.Text = string.Empty;
            TextBox5.Text = string.Empty;
        }
    }
}