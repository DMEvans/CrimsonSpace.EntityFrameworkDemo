<%@ Page Title="Demo 1" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Demo1.aspx.cs" Inherits="WebInterface.Demo1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center;">
        <h1>Demo 1</h1>
        <h2>Selecting Basic Data</h2>

        <asp:GridView CssClass="centre-element cell-spacer" ID="gridViewCustomers" ItemType="DataLibrary.Customer" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <%# Item.Id %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <%# string.Format("{0} {1} {2}", Item.Title, Item.FirstName, Item.LastName) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date of Birth">
                    <ItemTemplate>
                        <%# Item.DateOfBirth.ToShortDateString() %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>