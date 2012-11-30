<%@ Page Language="C#" MasterPageFile="~/ShoeShopMaster.master" AutoEventWireup="true"
  CodeFile="Product.aspx.cs" Inherits="Product" Title="BalloonShop: Product Details Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="titleLabel" runat="server" Text="Label"></asp:Label>
    
    <table>
<tr>
<td style="width:500px">

  <p>
    <asp:Image ID="productImage" Width="350px" runat="server" />      
  </p>
  <center>
  <asp:HyperLink ID="lkFacebook" runat="server" target="_blank">
    <image src="Images\facebook_button.png" />
  </asp:HyperLink>

<!-- Facebook share button End -->

<asp:HyperLink runat="server" ID="lkTwitter" target="_blank">
    <image src="Images\twitter_button.png" /></asp:HyperLink>
</center>

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
        <asp:Button ID="Add2Compare" runat="server" Text="Add To Compare" CssClass="button" onclick="Add2Compare_Click" />
  </p>
       <asp:Label ID="status" runat="server"></asp:Label>
</td>
</tr>
</table>

  

</asp:Content>
