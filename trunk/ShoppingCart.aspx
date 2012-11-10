<%@ Page Title="BalloonShop: Shopping Cart" Language="C#" MasterPageFile="~/ShoeShopMaster.master"
  AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<h2>Shopping Cart</h2>
  <p>
    <asp:Label ID="titleLabel" runat="server" Text="Your Shopping Cart" CssClass="CatalogTitle" />
  </p>
  <p>
    <asp:Label ID="statusLabel" runat="server" />
  </p>
  <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" BackColor="Gray" BorderStyle="Inset" BorderWidth="1px"
    Width="100%" OnRowDeleting="grid_RowDeleting" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
      <AlternatingRowStyle BackColor="White" />
    <Columns>
      <asp:BoundField DataField="Name" HeaderText="Product Name" ReadOnly="True" SortExpression="Name">
        <ControlStyle Width="100%" />
      </asp:BoundField>
      <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Price" ReadOnly="True"
        SortExpression="Price" />
      <asp:BoundField DataField="Attributes" HeaderText="Options" ReadOnly="True" />
      <asp:TemplateField HeaderText="Quantity">
        <ItemTemplate>
          <asp:TextBox ID="editQuantity" runat="server" CssClass="GridEditingRow" Width="24px"
            MaxLength="2" Text='<%#Eval("Quantity")%>' />
        </ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="Subtotal" DataFormatString="{0:c}" HeaderText="Subtotal"
        ReadOnly="True" SortExpression="Subtotal" />
      <asp:ButtonField ButtonType="Image" CommandName="Delete" Text="Delete" 
            ImageUrl="~/Images/remove.gif"></asp:ButtonField>
    </Columns>
      <EditRowStyle BackColor="#2461BF" />
      <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
      <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
      <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
      <RowStyle BackColor="#EFF3FB" />
      <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
      <SortedAscendingCellStyle BackColor="#F5F7FB" />
      <SortedAscendingHeaderStyle BackColor="#6D95E1" />
      <SortedDescendingCellStyle BackColor="#E9EBEF" />
      <SortedDescendingHeaderStyle BackColor="#4870BE" />
  </asp:GridView>
  <p class="amtTotal">
    <span>Total amount: </span>
    <asp:Label ID="totalAmountLabel" runat="server" Text="Label" />
  </p>
  <p align="right">
    <asp:Button ID="updateButton" runat="server" Text="Update Quantities"  CssClass="button"
      onclick="updateButton_Click" />
  </p>
</asp:Content>
