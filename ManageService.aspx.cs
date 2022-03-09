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
        print();
        //DeleteCommand="DELETE FROM [services] WHERE [id] = @id" 
        //InsertCommand="INSERT INTO [services] ([title], [description], [status]) VALUES (@title, @description, @status)"  
        //SelectCommand="SELECT [id], [title], [description], [status] FROM [services]" 
        //UpdateCommand="UPDATE [services] SET [title] = @title, [description] = @description, [status] = @status WHERE [id] = @id">
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Button2.Text == "Submit")
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [services] ([title], [description], [status]) VALUES (@title, @description, @status)", con);
            cmd.Parameters.AddWithValue("@title", TextBox1.Text);
            cmd.Parameters.AddWithValue("@description", TextBox2.Text);
            cmd.Parameters.AddWithValue("@status", RadioButtonList1.SelectedValue);
            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();
            if (s == 1)
            {
                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                print();
                Literal1.Text = "Services inserted successfully";
            }
            else
            {
                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                print();
                Literal1.Text = "Error!!";
            }
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [services] SET [title] = @title, [description] = @description, [status] = @status WHERE [id] = @id", con);
            cmd.Parameters.AddWithValue("@title", TextBox1.Text);
            cmd.Parameters.AddWithValue("@description", TextBox2.Text);
            cmd.Parameters.AddWithValue("@status", RadioButtonList1.SelectedValue);
            cmd.Parameters.AddWithValue("@id", ViewState["id"]);
            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();
            if (s == 1)
            {
                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                print();
                Literal1.Text = "Services updated successfully";
            }
            else
            {
                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                print();
                Literal1.Text = "Error!!";
            }
        }
    }
    public void print()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [title], [description], [status] FROM [services]", con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlCommand cmd = new SqlCommand("DELETE FROM [services] WHERE [id] = @id", con);
        cmd.Parameters.AddWithValue("@id", btn.CommandArgument);
        con.Open();
        int s = cmd.ExecuteNonQuery();
        con.Close();
        if (s == 1)
        {
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            RadioButtonList1.ClearSelection();
            print();
            Literal1.Text = "Services deleted successfully";
        }
        else
        {
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            RadioButtonList1.ClearSelection();
            print();
            Literal1.Text = "Error!!";
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [title], [description], [status] FROM [services] WHERE [id] = " + btn.CommandArgument, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        TextBox1.Text = dt.Rows[0][1].ToString();
        TextBox2.Text = dt.Rows[0][2].ToString();
        RadioButtonList1.SelectedValue = dt.Rows[0][3].ToString();
        ViewState["id"] = btn.CommandArgument;
        Button2.Text = "Update";
    }
}