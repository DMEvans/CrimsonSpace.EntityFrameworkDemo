<%@ Page Title="Demo 7" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Demo7.aspx.cs" Inherits="WebInterface.Demo7" %>

<asp:Content ID="ScriptContent" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center;">
        <h1>Demo 7</h1>
        <h2>Getting Your Money's Worth From The DBA</h2>

        <div id="placeholderMessage" runat="server" style="padding: 20px;">
            <asp:Label ID="lblInformation" runat="server" ForeColor="Black">
                This report will display a breakdown of revenue totals broken down by a variety of demographic cross-sections.
            </asp:Label>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Black" />
        </div>

        <div>
            From:
            <asp:TextBox ID="txtFrom" runat="server" MaxLength="20">01/01/2017</asp:TextBox>
            To:
            <asp:TextBox ID="txtTo" runat="server" MaxLength="20">01/01/2018</asp:TextBox>
            <asp:Button ID="btnIdSearch" runat="server" OnClick="Click_btnGenerate" Text="Generate" />
        </div>

        <asp:Repeater 
            ID="rptResults" 
            runat="server"
            OnItemDataBound="rptResults_ItemDataBound">
            <ItemTemplate>
                <h2>
                    <asp:Label ID="lblDemographicType" runat="server" />
                </h2>
                <asp:GridView
                    CssClass="table-top-spacer centre-element cell-spacer"
                    ID="gridViewResults"
                    runat="server"
                    ItemType="DataLibrary.DemographicRevenue_Result"
                    AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="Group">
                            <ItemTemplate>
                                <%# Item.DemographicValue %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Sales">
                            <ItemTemplate>
                                £<%# ((decimal)Item.TotalSales).ToString("0.00") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
