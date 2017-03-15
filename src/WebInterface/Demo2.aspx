<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Demo2.aspx.cs" Inherits="WebInterface.Demo2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center;">
        <h1>Demo 2</h1>
        <h2>Filtering Data</h2>

        <div>
            Search By Id: 
            <asp:TextBox ID="txtIdSearch" runat="server" MaxLength="200"></asp:TextBox>
            <asp:Button ID="btnIdSearch" runat="server" OnClick="Click_btnIdSearch" Text="Search" />
        </div>
        <div>
            Search By Name: 
            <asp:TextBox ID="txtNameSearch" runat="server" MaxLength="200"></asp:TextBox>
            <asp:Button ID="btnNameSearch1" runat="server" OnClick="Click_btnNameSearch1" Text="Search 1" />
            <asp:Button ID="btnNameSearch2" runat="server" OnClick="Click_btnNameSearch2" Text="Search 2" />
        </div>

        <div style="text-align: center;">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
        </div>

        <asp:GridView CssClass="table-top-spacer centre-element cell-spacer" ID="gridViewCustomers" ItemType="DataLibrary.Customer" runat="server" AutoGenerateColumns="false">
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
