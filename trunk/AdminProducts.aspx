<%@ Page Title="" Language="C#" MasterPageFile="~/ShoeShopMaster.master" AutoEventWireup="true" CodeFile="AdminProducts.aspx.cs" Inherits="AdminProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
  <asp:Label ID="catTitle" runat="server" ></asp:Label>
  <br />
  <span class="AdminTitle">
    Products in <asp:HyperLink ID="catLink" runat="server" />
  </span>
    <p><asp:Label ID="statusLabel" runat="server" ></asp:Label></p>
  <asp:GridView ID="grid" runat="server" DataKeyNames="ProductID" 
    AutoGenerateColumns="False" Width="100%" 
    onrowcancelingedit="grid_RowCancelingEdit" onrowediting="grid_RowEditing" 
    onrowupdating="grid_RowUpdating" BackColor="White" BorderColor="#CCCCCC" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
        GridLines="Horizontal">
    <Columns>
      <asp:ImageField DataImageUrlField="Thumbnail"  ControlStyle-Width="100px"
        DataImageUrlFormatString="ProductImages/{0}" HeaderText="Product Image" 
        ReadOnly="True">
<ControlStyle Width="100px"></ControlStyle>
      </asp:ImageField>
      <asp:TemplateField HeaderText="Product Name" SortExpression="Name">
        <EditItemTemplate>
          <asp:TextBox ID="nameTextBox" runat="server" Width="97%" 
                       CssClass="GridEditingRow" Text='<%# Bind("Name") %>'>
          </asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Product Description" 
        SortExpression="Description">
        <EditItemTemplate>
          <asp:TextBox ID="descriptionTextBox" runat="server" 
             Text='<%# Bind("Description") %>' Height="100px" Width="97%"
             CssClass="GridEditingRow" TextMode="MultiLine" />
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Price" SortExpression="Price">
        <ItemTemplate>
          <asp:Label ID="Label2" runat="server" 
               Text='<%# String.Format("{0:0.00}", Eval("Price")) %>'>
          </asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
          <asp:TextBox ID="priceTextBox" runat="server" Width="45px" 
                 Text='<%# String.Format("{0:0.00}", Eval("Price")) %>'>
          </asp:TextBox>
        </EditItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Thumb File" SortExpression="Thumbnail">
        <EditItemTemplate>
          <asp:TextBox ID="thumbTextBox" Width="80px" runat="server" 
                   Text='<%# Bind("Thumbnail") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label3" runat="server" Text='<%# Bind("Thumbnail") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Image File" SortExpression="Image">
        <EditItemTemplate>
          <asp:TextBox ID="imageTextBox" Width="80px" runat="server" 
                   Text='<%# Bind("Image") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label4" runat="server" Text='<%# Bind("Image") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:CheckboxField DataField="PromoDept" HeaderText="Dept. prom." 
        SortExpression="PromoDept" />
      <asp:CheckboxField DataField="PromoFront" HeaderText="Cat. prom." 
        SortExpression="PromoFront" />
      <asp:TemplateField>
        <ItemTemplate>
          <asp:HyperLink 
            Runat="server" Text="Select" 
            NavigateUrl='<%# "AdminProductDetails.aspx?DepartmentID=" + 
            Request.QueryString["DepartmentID"] + "&amp;CategoryID=" + 
            Request.QueryString["CategoryID"] + "&amp;ProductID=" + 
            Eval("ProductID") %>'
            ID="HyperLink1">
          </asp:HyperLink>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:CommandField ShowEditButton="True" />
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
  <br /><br />
  <h3>Create a new product and assign it to this category:<hr /></h3>
     <table>
        <tr>
            <td><span class="WideLabel">Name:</span></td>
            <td><asp:TextBox ID="newName" runat="server" CssClass="loginTBox" /></td>
        </tr>
        <tr>
            <td><span class="WideLabel">Description:</span></td>
            <td><asp:TextBox ID="newDescription" runat="server"  CssClass="loginTBox" TextMode="MultiLine" /></td>
        </tr>
        <tr>
            <td><span class="WideLabel">Price:</span></td>
            <td> <asp:TextBox ID="newPrice" runat="server"  CssClass="loginTBox">0.00</asp:TextBox></td>
        </tr>
         <tr>
            <td><span class="WideLabel">Thumbnail file:</span> </td>
            <td><asp:TextBox ID="newThumbnail" runat="server"  CssClass="loginTBox">Generic1.png</asp:TextBox></td>
        </tr>
         <tr>
            <td><span class="WideLabel">Image file:</span></td>
            <td><asp:TextBox ID="newImage" runat="server"  CssClass="loginTBox">Generic2.png</asp:TextBox></td>
        </tr>
         <tr>
            <td><span class="widelabel">Dept. promo:</span></td>
            <td><asp:CheckBox ID="newPromoDept" runat="server" /></td>
        </tr>  
        <tr>
            <td><span class="widelabel">Front promo:</span></td>
            <td><asp:CheckBox ID="newPromoFront" runat="server" /></td>
        </tr>  
        <tr>
            <td></td>
            <td>  <asp:Button ID="createProduct" runat="server" Text="Create Product" CssClass="button" onclick="createProduct_Click" /></td>
        </tr>
    </table>
</asp:Content>

