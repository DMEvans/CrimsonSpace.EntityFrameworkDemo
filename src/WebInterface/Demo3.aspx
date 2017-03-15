<%@ Page Title="Demo 2" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Demo3.aspx.cs" Inherits="WebInterface.Demo3" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div style="text-align: center;">
        <h1>Demo 3</h1>
        <h2>Understanding Deferred Execution</h2>

        <asp:Button ID="btnNoExternalData" runat="server" Text="Regular Query" OnClick="Click_btnNoExternalData" />
        <asp:Button ID="btnWithExternalData" runat="server" Text="Query with External Property" OnClick="Click_btnWithExternalData" />
        <asp:Button ID="btnWithExternalFilteredData" runat="server" Text="Query with External Filtered Property" OnClick="Click_btnWithExternalFilteredData" />

        <div ID="placeholderMessage" runat="server" style="padding: 20px;">
            Choose a query type
        </div>

        <asp:GridView CssClass="table-top-spacer centre-element cell-spacer" ID="gridViewCustomers1" ItemType="DataLibrary.Customer" runat="server" AutoGenerateColumns="false" Visible="false">
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
                <asp:TemplateField HeaderText="Gender ID">
                    <ItemTemplate>
                        <%# Item.GenderId %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:GridView CssClass="table-top-spacer centre-element cell-spacer" ID="gridViewCustomers2" ItemType="DataLibrary.Customer" runat="server" AutoGenerateColumns="false" Visible="false">
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
                <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                        <%# Item.Gender.Name %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>    
</asp:Content>
