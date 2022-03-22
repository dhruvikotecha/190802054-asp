<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- inner banner -->
    <section class="inner-banner py-5">
        <div class="w3l-breadcrumb py-lg-5">
            <div class="container pt-4 pb-sm-4">
                <h4 class="inner-text-title font-weight-bold pt-sm-5 pt-4">Contact Us</h4>
                <ul class="breadcrumbs-custom-path">
                    <li><a href="Home.aspx">Home</a></li>
                    <li class="active"><i class="fas fa-angle-right mx-2"></i>Contact</li>
                </ul>
            </div>
        </div>
    </section>
    <!-- //inner banner -->

    <!-- contact section -->
    <section class="w3l-contact-11 py-5" id="contact">
        <div class="container py-lg-5 py-md-4 py-2">
            <h3 class="title-style text-center mb-lg-5 mb-4">Contact <span>Us</span></h3>
            <div class="row text-center mb-5 pb-lg-5 pb-sm-4">
                <div class="col-lg-3 col-sm-6 contact-info">
                    <i class="fas fa-map-marked-alt"></i>
                    <h4>Location</h4>
                    <p>London, 235 Terry, 10001</p>
                </div>
                <div class="col-lg-3 col-sm-6 contact-info mt-md-0 mt-4">
                    <i class="fas fa-headset"></i>
                    <h4>Phone</h4>
                    <p><a href="tel:+44 987 654 321">+44 123 984 439</a></p>
                </div>
                <div class="col-lg-3 col-sm-6 contact-info mt-lg-0 mt-4">
                    <i class="fas fa-envelope-open-text"></i>
                    <h4>Email</h4>
                    <p><a href="mailto:mail@example.com" class="email">mail@example.com</a></p>
                </div>
                <div class="col-lg-3 col-sm-6 contact-info mt-lg-0 mt-4">
                    <i class="fas fa-user-clock"></i>
                    <h4>Working Hours</h4>
                    <p>Mon-Sat: 9hrs & Sun: Closed</p>
                </div>
            </div>
            <div class="form-inner-cont mx-auto" style="max-width:800px">
                    <div class="row align-form-map">
                        <div class="col-sm-6 form-input">
                            <asp:TextBox ID="TextBox1" runat="server" placeholder="Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="Please Enter Name" ControlToValidate="TextBox1" Display="Dynamic" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-6 form-input">
                            <asp:TextBox ID="TextBox2" runat="server" placeholder="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="Please Enter Email" ControlToValidate="TextBox2" 
                                Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-6 form-input">  
                            <asp:TextBox ID="TextBox3" runat="server" placeholder="Subject" class="contact-input"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ErrorMessage="Please Enter Subject" ControlToValidate="TextBox3" 
                                Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-6 form-input">
                            <asp:TextBox ID="TextBox4" runat="server" placeholder="Phone Number" class="contact-input"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage="Please Enter Phone Number" ControlToValidate="TextBox4" 
                                Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                runat="server" ErrorMessage="Please Enter 10 digits" 
                                ControlToValidate="TextBox4" Display="Dynamic" ForeColor="Red" 
                                ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-input">
                        <asp:TextBox ID="TextBox5" runat="server" placeholder="Message"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ErrorMessage="Please Enter Message" ControlToValidate="TextBox5" 
                            Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-input">  
                        <asp:Button ID="Button1" runat="server" Text="Submit Message" onclick="Button1_Click"></asp:Button>
                    </div>
            </div>
        </div>  
    </section>
    <!-- map -->
    <div class="map">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d317718.69319292053!2d-0.3817765050863085!3d51.528307984912544!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d8a00baf21de75%3A0x52963a5addd52a99!2sLondon%2C+UK!5e0!3m2!1sen!2spl!4v1562654563739!5m2!1sen!2spl"
            width="100%" height="400" frameborder="0" style="border: 0px;" allowfullscreen=""></iframe>
    </div>
    <!-- //contact section -->
</asp:Content>

