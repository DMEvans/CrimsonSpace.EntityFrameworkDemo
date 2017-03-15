<%@ Page Title="Demo 4" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Demo4.aspx.cs" Inherits="WebInterface.Demo4" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div style="text-align: center;">
        <h1>Demo 4</h1>
        <h2>Lazy Loading vs Eager Loading</h2>

        <asp:Button ID="btnRegularQuery" runat="server" Text="Regular Query" OnClick="Click_btnRegularQuery" />
         <asp:Button ID="btnRegularQueryWithProxiesDisabled" runat="server" Text="Regular Query" OnClick="Click_btnRegularQueryWithProxiesDisabled" />
        <asp:Button ID="btnQueryWithInclude" runat="server" Text="Query with Include" OnClick="Click_btnQueryWithInclude" />

        <div ID="placeholderMessage" runat="server" style="padding: 20px;">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Black" Text="Choose a query type"></asp:Label>
        </div>

        <asp:GridView CssClass="table-top-spacer centre-element cell-spacer" ID="gridViewCustomers" ItemType="DataLibrary.Customer" runat="server" AutoGenerateColumns="false" Visible="false">
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
