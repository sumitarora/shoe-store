<%@ Page Title="" Language="C#" MasterPageFile="~/ShoeShopMaster.master" AutoEventWireup="true" CodeFile="Compare.aspx.cs" Inherits="Compare" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="ptitle">Product Comparison</div>
    <p><asp:Label ID="compareStatus" runat="server"></asp:Label></p>
    <p>
        <asp:GridView ID="gv_productCompare" runat="server" BackColor="White"
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
            ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="Gray" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </p>
    <p>
        <asp:Button ID="remove" runat="server" Text="Remove All" CssClass="button" 
            onclick="remove_Click"  />
    </p>
    </asp:Content>

