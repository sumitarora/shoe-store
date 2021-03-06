﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductsList.ascx.cs" Inherits="UserControls_ProductsList" %>
<%@ Register src="Pager.ascx" tagname="Pager" tagprefix="uc1" %>
<uc1:Pager ID="topPager" runat="server" Visible="False" />
<asp:DataList ID="list" runat="server" RepeatColumns="3"
    BorderWidth="5px" CellPadding="15" Font-Bold="False" Font-Italic="False" Width="100%" 
    Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
    GridLines="Both" HorizontalAlign="Left" RepeatDirection="Horizontal">
  <ItemTemplate>
  <div style="width:210px">
    <h3>
      <a 
      href="<%# Link.ToProduct(Eval("ProductID").ToString()) %>"
      >
        <%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>
      </a>
    </h3>
    <a href="<%# Link.ToProduct(Eval("ProductID").ToString()) %>">
      <img width="100" height="100" border="0" 
src="<%# Link.ToProductImage(Eval("Thumbnail").ToString()) %>" 
alt='<%# HttpUtility.HtmlEncode(Eval("Name").ToString())%>' />
    </a><br />
    <%# HttpUtility.HtmlEncode(Eval("Description").ToString()) %>
    <p>
      Price:
      <%# Eval("Price", "{0:c}") %>
    </p>
    <p><a 
      href="<%# Link.ToProduct(Eval("ProductID").ToString()) %>"
      >
      <input type="button" class="button" value="View Product" /></a></p>
    <asp:PlaceHolder ID="attrPlaceHolder" runat="server"></asp:PlaceHolder>
</div>
  </ItemTemplate>
</asp:DataList>
<p>
    &nbsp;<uc1:Pager ID="bottomPager" runat="server" Visible="False" />