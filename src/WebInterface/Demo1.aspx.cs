using DataLibrary;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace WebInterface
{
    public partial class Demo1 : System.Web.UI.Page
    {
        #region Scaffolding Code

        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayAllCustomers();
        }

        #endregion Scaffolding Code

        #region Demo Code

        private void DisplayAllCustomers()
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