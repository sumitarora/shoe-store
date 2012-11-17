<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserInfo.ascx.cs" Inherits="UserControls_UserInfo" %>
<table cellspacing="0" style="border:1px solid Black; width:200px;" >
  <asp:LoginView ID="LoginView1" runat="server">
    <AnonymousTemplate>
      <tr>
        <td class="sideBarTitle">Welcome!</td>
      </tr>    
      <tr>
        <td style="padding:5px">
          You are not logged in.
          <asp:LoginStatus ID="LoginStatus1" runat="server" />
        </td>
      </tr>
    </AnonymousTemplate>
    <RoleGroups>
      <asp:RoleGroup Roles="Administrators">      
        <ContentTemplate>
          <tr>
            <td class="sideBarTitle">
           
             <asp:LoginName ID="LoginName2" runat="server" FormatString="Hello, <b>{0}</b>!" />
            </td>
          </tr>            
          <tr>
            <td class="UserInfoContent"> 
             <ol>
             <li><asp:LoginStatus ID="LoginStatus2" runat="server" /></li>                 
              <li><a href="Default.aspx">ShoeShop</a></li>
              <li><a href="AdminDepartments.aspx" class="<% %>">Catalog Admin</a></li>
              </ol>             
            </td>   
          </tr>          
        </ContentTemplate>
      </asp:RoleGroup>
    </RoleGroups>
  </asp:LoginView>
</table>
