<%@ Page Title="Demo 6" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Demo6.aspx.cs" Inherits="WebInterface.Demo6" %>
<asp:Content ID="ScriptContent" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center;">
        <h1>Demo 6</h1>
        <h2>Advanced Data Selection</h2>

        <div id="placeholderMessage" runat="server" style="padding: 20px;" visible="false">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Black"></asp:Label>
        </div>

        <table class="filter-table centre-element cell-spacer">
            <tr>
                <td>
                    Name: 
                </td>
                <td>
                    <asp:TextBox ID="txtNameSearch" runat="server" MaxLength="200"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Category: 
                </td>
                <td>
                    <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Order Status: 
                </td>
                <td>
                    <asp:DropDownList ID="ddlOrderStatus" runat="server">
                        <asp:ListItem Value="0" Text="--Select--" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="1" Text="No Orders"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Has Orders"></asp:ListItem>
                        <asp:ListItem Value="3" Text="Has Dispatched Orders"></asp:ListItem>
                        <asp:ListItem Value="4" Text="Has Pending Orders"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
             <tr>
                <td>
                    Price Range: 
                </td>
                <td>
                    <asp:TextBox ID="txtPriceFrom" runat="server" MaxLength="10" Width="100px"></asp:TextBox>
                    to
                    <asp:TextBox ID="txtPriceTo" runat="server" MaxLength="10" Width="100px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Sales Exceed:
                </td>
                <td>
                    <asp:TextBox ID="txtSalesExceed" runat="server" MaxLength="20"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                     <asp:Button ID="btnSearch" runat="server" OnClick="Click_btnSearch" Text="Search" />
                </td>
            </tr>
        </table>

        <div class="gallery centre-element">
            <div class="centre-element">
                <asp:Repeater ID="rptPager" runat="server" ItemType="ListItem">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkPage" runat="server" Text='<%# Item.Text %>' CommandArgument='<%# Item.Value %>'
                            CssClass='<%# "pager-item " + (Item.Enabled ? "" : "pager-item-selected") %>'
                            OnClick="lnkPage_Click" OnClientClick='<%# !Item.Enabled ? "return false;" : "" %>'></asp:LinkButton>
                   </ItemTemplate>
                </asp:Repeater>
            </div>

            <asp:Repeater ID="rptProducts" runat="server" ItemType="DataLibrary.Product">
                <ItemTemplate>
                    <div class="product">
                        <asp:Image ImageUrl="<%# Item.ImageUrl %>" runat="server" CssClass="product-image"/>
                        <h5><%# Item.Name %></h5>
                        <p><%# Item.Category.Name %> - £<%# Item.Price.ToString("0.00") %></p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div style="clear: both;">&nbsp;</div>
        </div>

        
    </div>
</asp:Content>
