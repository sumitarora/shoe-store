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
  <a href="https://www.facebook.com/dialog/feed?
  app_id=458358780877780&
  link=https://developers.facebook.com/docs/reference/dialogs/&
  picture=http://fbrell.com/f8.jpg&
  name=Facebook%20Dialogs&
  caption=Reference%20Documentation&
  description=Using%20Dialogs%20to%20interact%20with%20users.&
  redirect_uri=https://mighty-lowlands-6381.herokuapp.com/" target="_blank"><image src="Images\facebook_button.png" /></a>

<!-- Facebook share button End -->

<a href="http://twitter.com/share?url=http://www.shoeshop.com&text=This shoes is awesome buy it..." target="_blank">
<image src="Images\twitter_button.png" /></a>
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
