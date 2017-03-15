<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebInterface._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <ul>
        <asp:Repeater ID="repeaterLinks" runat="server" ItemType="ObjectLibrary.PageLink">
            <ItemTemplate>
                <li>
                    <asp:HyperLink runat="server" NavigateUrl="<%# Item.Url %>" ><%# Item.Title %></asp:HyperLink>
                    <span> - <%# Item.Description %></span>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</asp:Content>
