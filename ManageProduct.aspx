<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ManageProduct.aspx.cs" Inherits="_Default" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section class="wrapper">
	<div class="form-w3layouts">
        <!-- page start-->
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            Manage Products
                        </header>
                        <div class="panel-body">
                            <div class="position-center">
                                <form role="form">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Product Name</label>
                                    <asp:TextBox ID="TextBox1" class="form-control" placeholder="Enter name" runat="server"></asp:TextBox>
                                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Description</label>
                                    <asp:TextBox ID="TextBox2" class="form-control" placeholder="Description" runat="server"></asp:TextBox>
                                    <asp:Literal ID="Literal8" runat="server"></asp:Literal>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Product Category</label>
                                    <asp:DropDownList ID="DropDownList1" class="form-control" runat="server"></asp:DropDownList>
                                    <asp:Literal ID="Literal9" runat="server"></asp:Literal>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Status</label>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                        RepeatDirection="Horizontal" Width="216px">
                                        <asp:ListItem Value="1">Avtive</asp:ListItem>
                                        <asp:ListItem Value="0">Deactive</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:Literal ID="Literal10" runat="server"></asp:Literal>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputFile">Select Image</label>
                                    <asp:FileUpload ID="FileUpload1" class="form-control" runat="server"></asp:FileUpload>
                                    <asp:Literal ID="Literal11" runat="server"></asp:Literal>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputFile">Product Image</label>
                                </div>
                                <div class="form-group">
                                    <asp:Image ID="Image3" runat="server" Height="100px" Width="100px"></asp:Image>
                                </div>
                                <div class="checkbox">
                                    <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click"></asp:Button>
                                </div>
                                <div class="checkbox">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                                        CellPadding="10" CellSpacing="3">
                                        <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="id">
                                                <ItemTemplate>
                                                    <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="product_name">
                                                <ItemTemplate>
                                                    <asp:Literal ID="Literal4" runat="server" Text='<%# Eval("product_name") %>'></asp:Literal>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="product_description">
                                                <ItemTemplate>
                                                    <asp:Literal ID="Literal5" runat="server" 
                                                        Text='<%# Eval("product_description") %>'></asp:Literal>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="product_category_id">
                                                <ItemTemplate>
                                                    <asp:Literal ID="Literal6" runat="server" 
                                                        Text='<%# Eval("category") %>'></asp:Literal>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="status">
                                                <ItemTemplate>
                                                    <asp:Literal ID="Literal7" runat="server" Text='<%# Eval("product_status") %>'></asp:Literal>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="image">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image2" runat="server" Height="100px" Width="100px" 
                                                        ImageUrl='<%# Eval("image", "~/uploads/{0}") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="delete">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("id") %>' 
                                                        onclick="Button2_Click" Text="Delete" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="edit">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button3" runat="server" CommandArgument='<%# Eval("id") %>' 
                                                        onclick="Button3_Click" Text="Edit" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <FooterStyle BackColor="White" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" 
                                            HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Center" 
                                            VerticalAlign="Middle" />
                                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                        <SortedAscendingHeaderStyle BackColor="#487575" />
                                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                        <SortedDescendingHeaderStyle BackColor="#275353" />
                                    </asp:GridView>
                                </div>
                                <div class="checkbox">
                                    <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                                </div>
                            </form>
                            </div>
                        </div>
                    </section>

            </div>
        </div>
    </div>
</section>
</asp:Content>

