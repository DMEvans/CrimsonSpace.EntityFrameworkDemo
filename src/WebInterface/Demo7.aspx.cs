using DataLibrary;

namespace WebInterface
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.UI.WebControls;

    public partial class Demo7 : System.Web.UI.Page
    {
        #region Scaffolding Code

        protected void Click_btnGenerate(object sender, EventArgs e)
        {
            GenerateDemographicRevenueReport();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private void GenerateDemographicRevenueReport()
        {
            var fromDate = DateTime.Parse(txtFrom.Text);
            var toDate = DateTime.Parse(txtTo.Text);

            GenerateReport(fromDate, toDate);
        }

        #endregion Scaffolding Code

        #region Demo Code

        protected void rptResults_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var dataItem = e.Item.DataItem as IGrouping<string, DemographicRevenue_Result>;

            var lblDemographicType = e.Item.FindControl("lblDemographicType") as Label;
            var gridViewResults = e.Item.FindControl("gridViewResults") as GridView;

            lblDemographicType.Text = dataItem.Key;
            gridViewResults.DataSource = dataItem.ToList();
            gridViewResults.DataBind();
        }

        private void DisplayReportData(List<DemographicRevenue_Result> reportData)
        {
            var demographicGroups = reportData.GroupBy(x => x.DemographicType).ToList();

            rptResults.DataSource = demographicGroups;
            rptResults.DataBind();
        }

        private void GenerateReport(DateTime fromDate, DateTime toDate)
        {
            var reportData = new List<DemographicRevenue_Result>();

            using (var entities = new DemoEntities())
            {
                var results = entities.DemographicRevenue(fromDate, toDate);

                var enumerator = results.GetEnumerator();

                while (enumerator.MoveNext())
                {
                    reportData.Add(enumerator.Current);
                }
            }

            DisplayReportData(reportData);
        }

        #endregion Demo Code
    }
}