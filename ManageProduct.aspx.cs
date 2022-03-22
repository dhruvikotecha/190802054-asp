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
        if (!IsPostBack)
        {
            print();
            binddropdown();
        }
        //DeleteCommand="DELETE FROM [products] WHERE [id] = @id" 
        //InsertCommand="INSERT INTO [products] ([product_name], [product_description], [product_category_id], [product_status], [image]) VALUES (@product_name, @product_description, @product_category_id, @product_status, @image)"  
        //SelectCommand="SELECT [id], [product_name], [product_description], [product_category_id], [product_status], [image] FROM [products]" 
        //UpdateCommand="UPDATE [products] SET [product_name] = @product_name, [product_description] = @product_description, [product_category_id] = @product_category_id, [product_status] = @product_status, [image] = @image WHERE [id] = @id">
    }
    public void binddropdown()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [category_id], [category] FROM [categories]", con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        DropDownList1.DataSource = dt;
        DropDownList1.DataTextField = "category";
        DropDownList1.DataValueField = "category_id";
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, new ListItem("Please select category", ""));
        DropDownList1.Items[0].Selected = true;
        DropDownList1.Items[0].Attributes["disabled"] = "disabled";
    }
    public void print()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [product_name], [product_description], [product_category_id], [product_status], [image], [category_id], [category] FROM [products], [categories] WHERE [product_category_id] = [category_id]", con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    public void clear()
    {
        TextBox1.Text = string.Empty;
        TextBox2.Text = string.Empty;
        DropDownList1.SelectedIndex = -1;
        RadioButtonList1.ClearSelection();
        FileUpload1.Attributes.Clear();
        Image3.ImageUrl = string.Empty;
        Literal1.Text = string.Empty;
        Literal8.Text = string.Empty;
        Literal9.Text = string.Empty;
        Literal10.Text = string.Empty;
        Literal11.Text = string.Empty;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Button1.Text == "Submit")
        {
            if (TextBox1.Text == "" || TextBox2.Text == "" || DropDownList1.SelectedIndex == -1 || RadioButtonList1.SelectedItem == null || !FileUpload1.HasFile)
            {
                if (TextBox1.Text == "")
                {
                    Literal1.Text = "<span style='color:red'>Please Enter Product Name</span>";
                }
                if (TextBox2.Text == "")
                {
                    Literal8.Text = "<span style='color:red'>Please Enter Product Description</span>";
                }
                if (DropDownList1.SelectedIndex == -1)
                {
                    Literal9.Text = "<span style='color:red'>Please Select Category</span>";
                }
                if (RadioButtonList1.SelectedItem == null)
                {
                    Literal10.Text = "<span style='color:red'>Please Select Status</span>";
                }
                if (!FileUpload1.HasFile)
                {
                    Literal11.Text = "<span style='color:red'>Please Select Image or file</span>";
                }
            }
            else
            {
                FileUpload1.SaveAs(Server.MapPath("~/uploads/" + FileUpload1.FileName));
                SqlCommand cmd = new SqlCommand("INSERT INTO [products] ([product_name], [product_description], [product_category_id], [product_status], [image]) VALUES (@product_name, @product_description, @product_category_id, @product_status, @image)", con);
                cmd.Parameters.AddWithValue("@product_name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@product_description", TextBox2.Text);
                cmd.Parameters.AddWithValue("@product_category_id", Convert.ToInt32(DropDownList1.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@product_status", RadioButtonList1.SelectedValue);
                cmd.Parameters.AddWithValue("@image", FileUpload1.FileName);
                con.Open();
                int s = cmd.ExecuteNonQuery();
                con.Close();
                if (s == 1)
                {
                    print();
                    clear();
                    Literal2.Text = "Data Inserted Successfully";
                }
                else
                {
                    print();
                    clear();
                    Literal2.Text = "Error!!";
                }
            }
        }
        else
        {
            if (FileUpload1.HasFile)
            {
                SqlCommand cmd = new SqlCommand("UPDATE [products] SET [product_name] = @product_name, [product_description] = @product_description, [product_category_id] = @product_category_id, [product_status] = @product_status, [image] = @image WHERE [id] = @id", con);
                cmd.Parameters.AddWithValue("@product_name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@product_description", TextBox2.Text);
                cmd.Parameters.AddWithValue("@product_category_id", Convert.ToInt32(DropDownList1.SelectedValue));
                cmd.Parameters.AddWithValue("@product_status", RadioButtonList1.SelectedValue);
                cmd.Parameters.AddWithValue("@image", FileUpload1.FileName);
                cmd.Parameters.AddWithValue("@id", ViewState["product_id"]);
                con.Open();
                int s = cmd.ExecuteNonQuery();
                con.Close();
                if (s == 1)
                {
                    print();
                    clear();
                    Literal2.Text = "Data Updated Successfully";
                    Button1.Text = "Submit";
                }
                else
                {
                    print();
                    clear();
                    Literal2.Text = "Error!!";
                }
            }
            else
            {
                Literal11.Text = "<span style='color:red'>Please Select Image or file</span>";
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlCommand cmd = new SqlCommand("DELETE FROM [products] WHERE [id] = @id", con);
        cmd.Parameters.AddWithValue("@id", btn.CommandArgument);
        con.Open();
        int s = cmd.ExecuteNonQuery();
        con.Close();
        if (s == 1)
        {
            print();
            Literal2.Text = "Data Deleted Successfully";
        }
        else
        {
            print();
            Literal2.Text = "Error!!";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [product_name], [product_description], [product_category_id], [product_status], [image] FROM [products] WHERE [id] = " + btn.CommandArgument, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        TextBox1.Text = dt.Rows[0][1].ToString();
        TextBox2.Text = dt.Rows[0][2].ToString();
        DropDownList1.Text = dt.Rows[0][3].ToString();
        RadioButtonList1.SelectedValue = dt.Rows[0][4].ToString();
        Image3.ImageUrl = "~/uploads/" + dt.Rows[0][5].ToString();
        ViewState["product_id"] = btn.CommandArgument;
        Button1.Text = "Update";
        DropDownList1.Items[0].Attributes["disabled"] = "disabled";
    }
}