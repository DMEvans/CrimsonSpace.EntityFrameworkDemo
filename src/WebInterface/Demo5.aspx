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
        <h2>Inserting New Records</h2>


        <table class="centre-element" style="width: 400px; text-align: left;">
            <tr>
                <td>Title:
                </td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>First Name:
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Last Name:
                </td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Date Of Birth:
                </td>
                <td>
                    <asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="datepicker"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Gender:
                </td>
                <td>
                    <asp:DropDownList ID="ddlGender" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <Ktr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
            </Ktr>
        </table>

        
    </div>
</asp:Content>
