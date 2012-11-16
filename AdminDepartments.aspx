<%@ Page Title="" Language="C#" MasterPageFile="~/ShoeShopMaster.master" AutoEventWireup="true"
  CodeFile="AdminDepartments.aspx.cs" Inherits="AdminDepartments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<p><div class="ptitle">List of available Departments</div></p>
  <p>
    <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label>
  </p>
  <asp:GridView ID="grid" runat="server" DataKeyNames="DepartmentID" Width="100%" 
    AutoGenerateColumns="False" onrowcancelingedit="grid_RowCancelingEdit" 
    onrowdeleting="grid_RowDeleting" onrowediting="grid_RowEditing" 
    onrowupdating="grid_RowUpdating" BackColor="White" BorderColor="#CCCCCC" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
        GridLines="Horizontal">
    <Columns>
      <asp:BoundField DataField="Name" HeaderText="Department Name" 
        SortExpression="Name" />
      <asp:TemplateField HeaderText="Department Description" 
        SortExpression="Description">
        <EditItemTemplate>
          <asp:TextBox ID="descriptionTextBox" runat="server" 
            Text='<%# Bind("Description") %>' Height="70px" TextMode="MultiLine" 
            Width="400px"></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:HyperLinkField DataNavigateUrlFields="DepartmentID" 
        DataNavigateUrlFormatString="AdminCategories.aspx?DepartmentID={0}" 
        HeaderText="View Categories" Text="View Categories" />
      <asp:CommandField ShowEditButton="True" ButtonType="Image" 
            CancelImageUrl="~/Images/remove.gif" EditImageUrl="~/Images/edit.png" 
            UpdateImageUrl="~/Images/update.png" />
      <asp:ButtonField CommandName="Delete" Text="Delete" ButtonType="Image" 
            ImageUrl="~/Images/remove.gif" />
    </Columns>
      <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
      <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
      <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
      <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
      <SortedAscendingCellStyle BackColor="#F7F7F7" />
      <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
      <SortedDescendingCellStyle BackColor="#E5E5E5" />
      <SortedDescendingHeaderStyle BackColor="#242121" />
  </asp:GridView><br /><br />
  <h3>Create a new department:</h3><hr />
  <p>Name:</p>
  <asp:TextBox ID="newName" runat="server" Width="400px" CssClass="loginTBox" />
  <p>Description:</p>
  <asp:TextBox ID="newDescription" runat="server" Width="400px" Height="70px" TextMode="MultiLine" CssClass="loginTBox" />
  <p><asp:Button ID="createDepartment" Text="Create Department" runat="server" CssClass="button" 
      onclick="createDepartment_Click" /></p>
</asp:Content>
