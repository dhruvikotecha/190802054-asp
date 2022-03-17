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
        //DeleteCommand="DELETE FROM [categories] WHERE [id] = @id" 
        //InsertCommand="INSERT INTO [categories] ([category], [status]) VALUES (@category, @status)" 
        //SelectCommand="SELECT [id], [category], [status] FROM [categories]" 
        //UpdateCommand="UPDATE [categories] SET [category] = @category, [status] = @status WHERE [id] = @id">
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Button2.Text == "Submit")
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [categories] ([category], [status]) VALUES (@category, @status)", con);
            cmd.Parameters.AddWithValue("@category", TextBox1.Text);
            cmd.Parameters.AddWithValue("@status", RadioButtonList1.SelectedValue);
            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();
            if (s == 1)
            {
                print();
                TextBox1.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                Literal1.Text = "Category inserted successfully";
            }
            else
            {
                print();
                TextBox1.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                Literal1.Text = "Error!!";
            }
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [categories] SET [category] = @category, [status] = @status WHERE [category_id] = @category_id", con);
            cmd.Parameters.AddWithValue("@category", TextBox1.Text);
            cmd.Parameters.AddWithValue("@status", RadioButtonList1.SelectedValue);
            cmd.Parameters.AddWithValue("@category_id", ViewState["category_id"]);
            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();
            if (s == 1)
            {
                print();
                TextBox1.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                Literal1.Text = "Category updated successfully";
                Button2.Text = "Submit";
            }
            else
            {
                print();
                TextBox1.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                Literal1.Text = "Error!!";
            }
        }
    }
    public void print()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [category_id], [category], [status] FROM [categories]", con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlCommand cmd = new SqlCommand("DELETE FROM [categories] WHERE [category_id] = @category_id", con);
        cmd.Parameters.AddWithValue("@category_id", btn.CommandArgument);
        con.Open();
        int s = cmd.ExecuteNonQuery();
        con.Close();
        if (s == 1)
        {
            print();
            TextBox1.Text = string.Empty;
            RadioButtonList1.ClearSelection();
            Literal1.Text = "Category deleted successfully";
        }
        else
        {
            print();
            TextBox1.Text = string.Empty;
            RadioButtonList1.ClearSelection();
            Literal1.Text = "Error!!";
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [category_id], [category], [status] FROM [categories] WHERE [category_id] = " + btn.CommandArgument, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        TextBox1.Text = dt.Rows[0][1].ToString();
        RadioButtonList1.SelectedValue = dt.Rows[0][2].ToString();
        ViewState["category_id"] = btn.CommandArgument;
        Button2.Text = "Update";
    }
}