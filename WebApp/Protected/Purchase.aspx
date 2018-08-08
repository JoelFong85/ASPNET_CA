<%@ Page Title="" Language="C#" MasterPageFile="~/Private.Master" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="WebApp.Protected.Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/Purchase.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container col-md-12">
        <div class="col-md-12 label-box" style="margin-bottom: 20px">
            <div class="col-md-4">
                <asp:Label ID="Label2" CssClass="myClass" runat="server" Text="Title"></asp:Label>
            </div>
            <div class="col-md-1 text-center">
                <asp:Label ID="Label3" CssClass="myClass" runat="server" Text="Quantity"></asp:Label>
            </div>
            <div class="col-md-1 col-md-offset-1 text-center">
                <asp:Label ID="Label4" CssClass="myClass" runat="server" Text="Price"></asp:Label>
            </div>
        </div>

        <div class="col-md-12" style="margin-bottom: 30px">
            <div class="col-md-4">
                <asp:GridView ID="GridView1" runat="server" ShowHeader="false" BorderStyle="None" BorderWidth="0px" GridLines="None"></asp:GridView>
            </div>
            <div class="col-md-1 text-center">
                <asp:GridView ID="GridView2" runat="server" ShowHeader="false" BorderStyle="None" BorderWidth="0px" HorizontalAlign="Center" GridLines="None"></asp:GridView>
            </div>
            <div class="col-md-1 text-center col-md-offset-1">
                <asp:GridView ID="GridView3" runat="server" ShowHeader="false" BorderStyle="None" BorderWidth="0px" HorizontalAlign="Center" GridLines="None">
                </asp:GridView>
            </div>
        </div>


        <div class="container col-md-12" style="padding-left: 30px">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <div style="margin-top: 30px">
                <asp:Button ID="Button1" runat="server" Text="Confirm" OnClick="Button1_Click" cssclass="btn btn-info"/>
                <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" cssclass="btn btn-info"/>
            </div>

        </div>


    </div>

</asp:Content>
