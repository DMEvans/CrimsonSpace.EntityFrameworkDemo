<%@ Page Title="Demo 5" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Demo5.aspx.cs" Inherits="WebInterface.Demo5" %>

<asp:Content ID="ScriptContent" ContentPlaceHolderID="HeaderContent" runat="server">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $(".datepicker").datepicker();
        });
    </script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center;">
        <h1>Demo 5</h1>
        <h2>Inserting, Updating & Deleting Items</h2>

        <div id="placeholderMessage" runat="server" style="padding: 20px;" visible="false">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Black"></asp:Label>
        </div>

        <asp:Repeater ID="rptValidationMessages" ItemType="System.String" runat="server" Visible="false">
            <ItemTemplate>
                <p><%# Item %></p>
            </ItemTemplate>
        </asp:Repeater>

        <asp:GridView
            CssClass="table-top-spacer centre-element cell-spacer"
            ID="gridViewCustomers"
            ItemType="DataLibrary.Customer"
            runat="server"
            AutoGenerateColumns="false"
            OnRowCommand="gridViewCustomers_RowCommand"
            OnRowEditing="gridViewCustomers_RowEditing"
            OnRowCancelingEdit="gridViewCustomers_RowCancelingEdit"
            OnRowUpdating="gridViewCustomers_RowUpdating"
            OnRowDeleting="gridViewCustomers_RowDeleting"
            OnRowDataBound="gridViewCustomers_RowDataBound"
            DataKeyNames="Id"
            Visible="true"
            ShowFooter="true">
            <Columns>
                <asp:TemplateField HeaderText="Title">
                    <ItemTemplate>
                        <%# Item.Title %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTitle" runat="server" Text="<%# Item.Title %>" Width="60px"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtTitle" runat="server" Width="60px"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name">
                    <ItemTemplate>
                        <%# Item.FirstName %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFirstName" runat="server" Text="<%# Item.FirstName %>" Width="120px"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtFirstName" runat="server" Width="120px"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name">
                    <ItemTemplate>
                        <%# Item.LastName %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLastName" runat="server" Text="<%# Item.LastName %>" Width="120px"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtLastName" runat="server" Width="120px"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date of Birth">
                    <ItemTemplate>
                        <%# Item.DateOfBirth.ToShortDateString() %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDateOfBirth" runat="server" Text="<%# Item.DateOfBirth.ToShortDateString() %>" Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtDateOfBirth" runat="server" Width="100px"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                        <%# Item.Gender.Name %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlGender" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlGender" runat="server"></asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit"><i class="fa fa-pencil fa-2" aria-hidden="true"></i></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update"><i class="fa fa-check fa-2" aria-hidden="true"></i></asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="btnInsert" runat="server" CommandName="Insert"><i class="fa fa-check fa-2" aria-hidden="true"></i></asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete"><i class="fa fa-trash-o fa-2" aria-hidden="true"></i></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel"><i class="fa fa-times fa-2" aria-hidden="true"></i></asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="btnClear" runat="server" CommandName="Clear"><i class="fa fa-times fa-2" aria-hidden="true"></i></asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
