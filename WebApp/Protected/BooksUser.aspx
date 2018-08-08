<%@ Page Title="" Language="C#" MasterPageFile="~/Private.Master" AutoEventWireup="true" CodeBehind="BooksUser.aspx.cs" Inherits="WebApp.Protected.BooksUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/BookUser.css" rel="stylesheet" />
    
    <script type="text/javascript">
        $(document).ready(function () {

        })
        function add_qty(id, stock) {
            var n = $('.add' + id).prev().val();
            var num = parseInt(n) + 1;
            if (num > stock) { return; }
            $('.add' + id).prev().val(num);
            $('.hdn' + id).val(num);
        };

        function minus_qty(id) {
            var n = $('.minus' + id).next().val();
            var num = parseInt(n) - 1;
            if (num < 0) { return; }
            $('.minus' + id).next().val(num);
            $('.hdn' + id).val(num);
        };

        function TrackOrder() {
            var n = $(this).prev().val();
            console.log($(this));
            return false;
        };

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="width:90%">
        <div class="col-md-12">
            <div class="col-md-12">
                <p id="lbl_Cart_Header"><strong>Shopping Cart</strong></p>
            </div>
            <div class="col-md-6 col-md-offset-1 cart-container">
                <asp:Label ID="lbl_Cart_Title" class="cart-label" runat="server"><b>Selected Title</b></asp:Label>
                <asp:ListBox ID="ListBox_Cart_Title" CssClass="listbox" runat="server" Style="height:100px"></asp:ListBox>
            </div>
            <div class="col-md-1 cart-container">
                <asp:Label ID="lbl_Cart_Quantity" class="cart-label" runat="server"><b>Quantity</b></asp:Label>
                <asp:ListBox ID="ListBox_Cart_Qty" CssClass="listbox" runat="server" Style="text-align: center; height:100px" ></asp:ListBox>
            </div>
        </div>
        <div class="col-md-12 cart-container">
            <asp:Button ID="btn_Checkout" CssClass="btn btn-info" runat="server" Text="Checkout" OnClick="btn_Checkout_Click" />
            <asp:Button ID="btn_Checkout_Remove" CssClass="btn btn-info" runat="server" Text="Remove" OnClick="btn_Checkout_Remove_Click" />
            <asp:Button ID="btn_Checkout_Clear" CssClass="btn btn-info" runat="server" Text="Clear" OnClick="btn_Checkout_Clear_Click" />
        </div>
    </div><br /><br />
    <div class="col-md-5" style="margin-bottom: 30px">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control col-md-4" Width="300px"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" CssClass="btn btn-info col-ms-1" />
            </div>
        
        <br />
        <br />
    <br /><br />
    <asp:GridView ID="GridView_Purchase_BookList" CssClass="table table-hover text-center" runat="server"
        AutoGenerateColumns="False" OnRowCommand="GridView_Purchase_BookList_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Book Cover">
                <ItemTemplate>
                    <image src="../images/<%# Eval("ISBN") %>.jpg" width="150"></image>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="BookID" HeaderText="BookID" Visible="False" ReadOnly="True" SortExpression="BookID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="CategoryID" HeaderText="Category" SortExpression="CategoryID" />
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />

            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <div style="width: 110px">
                        <div class="gw_num">
                            <em class="minus<%#Eval("BookID") %>" onclick="minus_qty(<%#Eval("BookID") %>)">-</em>
                            <input type="text" value="0" class="num" name="num" />
                            <em class="add<%#Eval("BookID") %>" id="em-add" onclick="add_qty(<%#Eval("BookID") %>,<%#Eval("Stock") %>)">+</em>
                            <input type="hidden" value="0" class="hdn<%#Eval("BookID") %>" name="buyvalue" />
                        </div>
                        <asp:LinkButton runat="server" CssClass="btn btn-info addcart" Text="Add To Cart" CommandName="AddToCart" CommandArgument='<%# Eval("BookID") %>'></asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <HeaderStyle CssClass="GridHeader" />
    </asp:GridView>

</asp:Content>
