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
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        print();
    }
    public void print()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [name], [email], [password] FROM [users]", con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlCommand cmd = new SqlCommand("DELETE FROM [users] WHERE [id] = @id", con);
        cmd.Parameters.AddWithValue("@id", btn.CommandArgument);
        con.Open();
        int s = cmd.ExecuteNonQuery();
        con.Close();
        if (s == 1)
        {
            Literal1.Text = "Data Deleted Successfully!!";
            print();
        }
        else
        {
            Literal1.Text = "Error!!";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [name], [email], [password] FROM [users] WHERE [id] = " + btn.CommandArgument, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        TextBox1.Text = dt.Rows[0][1].ToString();
        TextBox2.Text = dt.Rows[0][2].ToString();
        TextBox3.Text = dt.Rows[0][3].ToString();
        ViewState["id"] = btn.CommandArgument;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("UPDATE [users] SET [name] = @name, [email] = @email, [password] = @password WHERE [id] = " + ViewState["id"], con);
        cmd.Parameters.AddWithValue("@name", TextBox1.Text);
        cmd.Parameters.AddWithValue("@email", TextBox2.Text);
        cmd.Parameters.AddWithValue("@password", TextBox3.Text);
        con.Open();
        int s = cmd.ExecuteNonQuery();
        con.Close();
        if (s == 1)
        {
            Literal1.Text = "Data Updated Successfully!!";
            TextBox1.Text = String.Empty;
            TextBox2.Text = String.Empty;
            TextBox3.Text = String.Empty;
            print();
        }
        else
        {
            Literal1.Text = "Error!!";
        }
    }
}