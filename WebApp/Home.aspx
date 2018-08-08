<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApp.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Home.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-5" style="margin-bottom: 30px">
        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control col-md-4" Width="300px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" CssClass="btn btn-info col-ms-1" />
    </div>

    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover text-center" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <img src="images/<%# Eval("ISBN") %>.jpg" width="150"></img>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Title" HeaderText="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" />
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
            <asp:BoundField DataField="Price" HeaderText="Price" />

        </Columns>
        <HeaderStyle CssClass="GridHeader" />

    </asp:GridView>
</asp:Content>
