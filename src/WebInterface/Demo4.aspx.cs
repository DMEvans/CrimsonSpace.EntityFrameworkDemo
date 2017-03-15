namespace WebInterface
{
    using DataLibrary;
    using System;
    using System.Data.Entity;
    using System.Drawing;
    using System.Linq;
    using System.Web.UI.WebControls;

    public partial class Demo4 : System.Web.UI.Page
    {
        #region Scaffolding Code

        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void Click_btnQueryWithInclude(object sender, EventArgs e)
        {
            placeholderMessage.Visible = false;

            ExecuteQueryWithInclude();

            gridViewCustomers.Visible = true;
        }

        protected void Click_btnRegularQuery(object sender, EventArgs e)
        {
            placeholderMessage.Visible = false;

            ExecuteRegularQuery();

            gridViewCustomers.Visible = true;
        }

        protected void Click_btnRegularQueryWithProxiesDisabled(object sender, EventArgs e)
        {
            placeholderMessage.Visible = false;

            ExecuteRegularQueryWithProxiesDisabled();

            gridViewCustomers.Visible = true;
        }

        #endregion Scaffolding Code

        #region Demo Code

        private void ExecuteQueryWithInclude()
        {
            using (var entities = new DemoEntities())
            {
                entities.Configuration.ProxyCreationEnabled = false;

                var dataToBind = entities.Customers.Include(x => x.Gender).ToList();

                gridViewCustomers.DataSource = dataToBind;
                gridViewCustomers.DataBind();
            }
        }

        private void ExecuteRegularQueryWithProxiesDisabled()
        {
            try
            {
                using (var entities = new DemoEntities())
                {
                    entities.Configuration.ProxyCreationEnabled = false;

                    var dataToBind = entities.Customers.ToList();

                    gridViewCustomers.DataSource = dataToBind;
                    gridViewCustomers.DataBind();
                }
            }
            catch (Exception ex)
            {
                placeholderMessage.Visible = true;
                lblMessage.Text = ex.Message;
                lblMessage.ForeColor = Color.Red;
            }
        }

        private void ExecuteRegularQuery()
        {
            using (var entities = new DemoEntities())
            {
                var dataToBind = entities.Customers.ToList();

                gridViewCustomers.DataSource = dataToBind;
                gridViewCustomers.DataBind();
            }
        }

        #endregion Demo Code
    }
}