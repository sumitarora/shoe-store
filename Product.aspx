<%@ Page Language="C#" MasterPageFile="~/ShoeShopMaster.master" AutoEventWireup="true"
  CodeFile="Product.aspx.cs" Inherits="Product" Title="BalloonShop: Product Details Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p><asp:Label ID="titleLabel" runat="server" Text="Label"></asp:Label></p>
    <table>
<tr>
<td style="width:400px">

  <p>
    <asp:Image ID="productImage" Height="350px" runat="server" />
  </p>
</td>
<td style="width:300px; text-align:justify;">
<p>
    <asp:Label ID="descriptionLabel" runat="server" Text="Label"></asp:Label>
  </p>
    <p>
    <b>Price:</b>
        <asp:Label CssClass="ProductPrice" ID="priceLabel" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        <asp:PlaceHolder ID="attrPlaceHolder" runat="server"></asp:PlaceHolder>
    </p>
      
    <p>
        <asp:Button ID="AddtoCartBtn" runat="server" onclick="AddToCartButton_Click" Text="Add to Cart" CssClass="button" />
  </p>
</td>
</tr>
</table>
   
  

</asp:Content>
