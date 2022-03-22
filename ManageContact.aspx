<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ManageContact.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="wrapper">
	<div class="form-w3layouts">
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                <section class="panel">
                    <header class="panel-heading">
                        Manage Contacts
                    </header>
                        <div class="panel-body">
                            <div class="position-center">
                                <form role="form">
                                <div class="checkbox">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                                        CellPadding="4" Width="488px">
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
                                            <asp:TemplateField HeaderText="subject">
                                                <ItemTemplate>
                                                    <asp:Literal ID="Literal5" runat="server" Text='<%# Eval("subject") %>'></asp:Literal>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="phone">
                                                <ItemTemplate>
                                                    <asp:Literal ID="Literal6" runat="server" Text='<%# Eval("phone") %>'></asp:Literal>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="message">
                                                <ItemTemplate>
                                                    <asp:Literal ID="Literal7" runat="server" Text='<%# Eval("message") %>'></asp:Literal>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="White" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="White" ForeColor="#333333" />
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
    </section>
</asp:Content>

