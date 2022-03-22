<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true"
    CodeFile="ManageUser.aspx.cs" Inherits="_Default" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="wrapper">
	<div class="form-w3layouts">
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            Manage Users
                        </header>
                        <div class="panel-body">
                            <div class="position-center">
                                <form role="form">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Name</label>
                                    <asp:TextBox ID="TextBox1" class="form-control" placeholder="Enter name" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <asp:TextBox ID="TextBox2" class="form-control" placeholder="Enter email" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <asp:TextBox ID="TextBox3" class="form-control" placeholder="Password" runat="server"></asp:TextBox>
                                </div>
                                <!--<div class="form-group">
                                    <label for="exampleInputFile">File input</label>
                                    <input type="file" id="exampleInputFile">
                                    <p class="help-block">Example block-level help text here.</p>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Check me out
                                    </label>
                                </div>-->
                                <asp:Button ID="Button2" class="btn btn-info" runat="server" Text="Update" 
                                    onclick="Button2_Click"></asp:Button>
                                <div class="checkbox">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
        CellPadding="4" Width="100%">
        <Columns>
            <asp:TemplateField HeaderText="id">
                <ItemTemplate>
                    <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="name">
                <ItemTemplate>
                    <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("name") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="email">
                <ItemTemplate>
                    <asp:Literal ID="Literal4" runat="server" Text='<%# Eval("email") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="password">
                <ItemTemplate>
                    <asp:Literal ID="Literal5" runat="server" Text='<%# Eval("password") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="delete">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Delete" 
                        CommandArgument='<%# Eval("id") %>' />
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
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" 
                                        VerticalAlign="Middle" />
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
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    </div>
                            </form>
                            </div>
                        </div>
                    </section>
            </div>
        </div>
    </div>
</asp:Content>
