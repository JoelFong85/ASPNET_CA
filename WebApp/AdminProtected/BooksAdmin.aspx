<%@ Page Title="" Language="C#" MasterPageFile="~/Private.Master" AutoEventWireup="true" CodeBehind="BooksAdmin.aspx.cs" Inherits="WebApp.AdminProtected.BooksAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <br />
        <div>
            <div class="col-md-5" style="margin-bottom: 30px">
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control col-md-4" Width="300px"></asp:TextBox>
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Search" CssClass="btn btn-info col-ms-1" />
            </div>
        </div>
        <br />
        <br />
        <div class="container">
            <asp:GridView ID="GridView1" runat="server" Style="width: 100%" CssClass="table table-hover text-center" AutoGenerateColumns="False" Width="676px" DataKeyNames="BookID" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing">
                <Columns>
                    
                    <asp:TemplateField HeaderText="BookID" InsertVisible="False" SortExpression="BookID">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("BookID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("BookID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <image src="../images/<%# Eval("ISBN") %>.jpg" width="90" height="120"></image>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Title" SortExpression="Title">
                        <EditItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CategoryID" SortExpression="CategoryID">
                        <EditItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("CategoryID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("CategoryID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                        <EditItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("ISBN") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("ISBN") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Author" SortExpression="Author">
                        <EditItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Author") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Author") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Stock" SortExpression="Stock">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Stock") %>'></asp:TextBox>

                            <asp:RegularExpressionValidator ID="StockValidator" runat="server" ErrorMessage="Please enter valid amount"
                                ControlToValidate="TextBox1" ValidationExpression="\d+" Display="Static" ForeColor="Red"
                                EnableClientScript="true" Font-Bold="true" Font-Names="Verdana" Font-Size="XX-Small">
                        </asp:RegularExpressionValidator>
                            

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Stock") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Price" SortExpression="Price">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>

                            <asp:RegularExpressionValidator ID="PriceValidator" runat="server" ErrorMessage="Please enter valid price"
                                ControlToValidate="TextBox2" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$" Display="Static" ForeColor="Red"
                                EnableClientScript="true" Font-Bold="true" Font-Names="Verdana" Font-Size="XX-Small">
                        </asp:RegularExpressionValidator>
                                

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="250px" >
                        <EditItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-info" />
                                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-info" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-info" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"
                                OnClientClick="return confirm('Are you sure you want to delete?')" CssClass="btn btn-info" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
