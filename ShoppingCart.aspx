<%@ Page Title="BalloonShop: Shopping Cart" Language="C#" MasterPageFile="~/ShoeShopMaster.master"
  AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="ptitle">Shopping Cart</div>
  <p>
    <asp:Label ID="titleLabel" runat="server" Text="Your Shopping Cart" CssClass="CatalogTitle" />
  </p>
  <p>
    <asp:Label ID="statusLabel" runat="server" />
  </p>
  <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ProductID" BackColor="White" BorderStyle="None" BorderWidth="1px"
    Width="100%" OnRowDeleting="grid_RowDeleting" CellPadding="4" 
        ForeColor="Black" GridLines="Horizontal" BorderColor="#CCCCCC">
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
      <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
      <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
      <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
      <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
      <SortedAscendingCellStyle BackColor="#F7F7F7" />
      <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
      <SortedDescendingCellStyle BackColor="#E5E5E5" />
      <SortedDescendingHeaderStyle BackColor="#242121" />
  </asp:GridView>
  <p class="amtTotal">
    <span>Total amount: </span>
    <asp:Label ID="totalAmountLabel" runat="server" Text="Label" />
  </p>
  <p align="right">
    <asp:Button ID="updateButton" runat="server" Text="Update Quantities"  CssClass="button"
      onclick="updateButton_Click" />
    <asp:Button ID="checkoutButton" runat="server" Text="Proceed to Checkout"  CssClass="button"
      OnClick="checkoutButtonClick" />
  </p>
</asp:Content>
