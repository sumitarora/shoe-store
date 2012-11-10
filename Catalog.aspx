﻿<%@ Page Title="ShoeShop: Catalog" Language="C#" MasterPageFile="~/ShoeShopMaster.master" AutoEventWireup="true" CodeFile="Catalog.aspx.cs" Inherits="Catalog" %>

<%@ Register src="UserControls/ProductsList.ascx" tagname="ProductsList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <asp:Label ID="catalogTitleLabel" runat="server" />
    
    
       <p><asp:Label ID="catalogDescriptionLabel" CssClass="CatalogDescription" runat="server" /></p> 
   
    <uc1:ProductsList ID="ProductsList1" runat="server" />
</asp:Content>
