namespace WebInterface
{
    using DataLibrary;
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;

    public partial class Demo3 : System.Web.UI.Page
    {
        #region Scaffolding Code

        protected void Click_btnNoExternalData(object sender, EventArgs e)
        {
            placeholderMessage.Visible = false;
            gridViewCustomers2.Visible = false;

            ExecuteQuery(gridViewCustomers1);

            gridViewCustomers1.Visible = true;
        }

        protected void Click_btnWithExternalData(object sender, EventArgs e)
        {
            placeholderMessage.Visible = false;
            gridViewCustomers1.Visible = false;

            ExecuteQuery(gridViewCustomers2);

            gridViewCustomers2.Visible = true;
        }

        protected void Click_btnWithExternalFilteredData(object sender, EventArgs e)
        {
            placeholderMessage.Visible = false;
            gridViewCustomers1.Visible = false;

            ExecuteFilteredQuery(gridViewCustomers2);

            gridViewCustomers2.Visible = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private void ExecuteQuery(GridView gridView)
        {
            using (var entities = new DemoEntities())
            {
                var dataToBind = entities.Customers;

                gridView.DataSource = dataToBind.ToList();
                gridView.DataBind();
            }
        }

        #endregion Scaffolding Code

        #region Demo Code

        private void ExecuteFilteredQuery(GridView gridView)
        {
            using (var entities = new DemoEntities())
            {
                var initialData = entities.Customers;
                var dataToBind = initialData.Where(x => x.Gender.Name == "Male");

                gridView.DataSource = dataToBind.ToList();
                gridView.DataBind();
            }
        }

        #endregion Demo Code
    }
}