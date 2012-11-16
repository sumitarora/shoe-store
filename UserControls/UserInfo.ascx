<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserInfo.ascx.cs" Inherits="UserControls_UserInfo" %>
<table cellspacing="0" border="0" width="200px" >
  <asp:LoginView ID="LoginView1" runat="server">
    <AnonymousTemplate>
      <tr>
        <td class="UserInfoHead">Welcome!</td>
      </tr>    
      <tr>
        <td class="UserInfoContent">
          You are not logged in.
          <asp:LoginStatus ID="LoginStatus1" runat="server" />
        </td>
      </tr>
    </AnonymousTemplate>
    <RoleGroups>
      <asp:RoleGroup Roles="Administrators">      
        <ContentTemplate>
          <tr>
            <td class="UserInfoHead">
           
              <h3><asp:LoginName ID="LoginName2" runat="server" FormatString="Hello, <b>{0}</b>!" /></h3>
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
