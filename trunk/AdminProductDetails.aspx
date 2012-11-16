<%@ Page Title="" Language="C#" MasterPageFile="~/ShoeShopMaster.master" AutoEventWireup="true" CodeFile="AdminProductDetails.aspx.cs" Inherits="AdminProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

  <span class="AdminTitle">
    ShoeStore Admin<br />
    Products in <asp:HyperLink ID="catLink" runat="server" />
  </span>
  <br />
  <p><div class="ptitle"><asp:Label ID="productNameLabel" runat="server" /></div> </p> 
  <p>
    <asp:Label ID="statusLabel" CssClass="AdminError" runat="server" />
  </p>
  <table>
    <tr>
        <td><b>Product belongs to these categories:</b></td>
        <td><asp:Label ID="categoriesLabel" runat="server" /></td>
        <td></td>
    </tr>
    <tr>
        <td><b>Remove product from this category:</b></td>
        <td> <asp:DropDownList ID="categoriesListRemove" runat="server" />  <br />
            <asp:Button ID="removeButton" runat="server" Text="Remove" OnClick="removeButton_Click" CssClass="button" /><br />
            <asp:Button ID="deleteButton" runat="server" Text="DELETE FROM CATALOG" OnClick="deleteButton_Click" CssClass="button" />
        </td>
        <td></td>
    </tr>
     <tr>
        <td><b>Assign product to this category:</b></td>
        <td> <asp:DropDownList ID="categoriesListAssign" runat="server" />  
             <asp:Button ID="assignButton" runat="server" Text="Assign" OnClick="assignButton_Click" />
        </td>
        <td></td>
    </tr>
     <tr>
        <td><b>Move product to this category:</b></td>
        <td><asp:DropDownList ID="categoriesListMove" runat="server" />
            <asp:Button ID="moveButton" runat="server" Text="Move" OnClick="moveButton_Click" />
        </td>
        <td></td>
    </tr>
     <tr>
        <td><b>Image1 file name:</b></td>
        <td><asp:Label ID="Image1Label" runat="server" />
            <br />
            <asp:Image ID="image1" runat="server" Width="150px" />
        </td>
        <td>
            <asp:FileUpload ID="image1FileUpload" runat="server" /><br />
            <asp:Button ID="upload1Button" runat="server" Text="Upload" CssClass="button"  onclick="upload1Button_Click" />
        </td>
    </tr>
     <tr>
        <td><b>Image2 file name:</b></td>
        <td><asp:Label ID="Image2Label" runat="server" />
            <br />
            <asp:Image ID="image2" runat="server" Width="150px" />
       </td>
       <td><asp:FileUpload ID="image2FileUpload" runat="server" /><br />
            <asp:Button ID="upload2Button" runat="server" Text="Upload" CssClass="button" onclick="upload2Button_Click" /></td>
    </tr>
  </table>
</asp:Content>