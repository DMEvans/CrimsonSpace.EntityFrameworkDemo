namespace WebInterface
{
    using DataLibrary;
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;

    public partial class Demo2 : System.Web.UI.Page
    {
        #region Scaffolding Code

        protected void Click_btnIdSearch(object sender, EventArgs e)
        {
            int searchId;

            var success = int.TryParse(txtIdSearch.Text, out searchId);

            if (success)
            {
                SearchById(searchId);
            }
        }

        protected void Click_btnNameSearch1(object sender, EventArgs e)
        {
            string searchName = txtNameSearch.Text;

            if (!string.IsNullOrWhiteSpace(searchName))
            {
                SearchByName1(searchName);
            }
        }

        protected void Click_btnNameSearch2(object sender, EventArgs e)
        {
            string searchName = txtNameSearch.Text;

            if (!string.IsNullOrWhiteSpace(searchName))
            {
                SearchByName2(searchName);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Visible = false;

            if (!IsPostBack)
            {
                DisplayAllCustomers();
            }
        }

        private void DisplayAllCustomers()
        {
            using (var entities = new DemoEntities())
            {
                var dataToBind = entities.Customers.ToList();

                gridViewCustomers.DataSource = dataToBind;
                gridViewCustomers.DataBind();
            }
        }

        #endregion Scaffolding Code

        #region Demo Code

        private void SearchById(int id)
        {
            using (var entities = new DemoEntities())
            {
                var dataToBind = entities.Customers.Where(x => x.Id == id).ToList();

                gridViewCustomers.DataSource = dataToBind;
                gridViewCustomers.DataBind();
            }
        }

        private void SearchByName1(string name)
        {
            try
            {
                using (var entities = new DemoEntities())
                {
                    var dataToBind = from x in entities.Customers
                                     where string.Format("{0} {1} {2}", x.Title, x.FirstName, x.LastName).Contains(name)
                                     select x;

                    gridViewCustomers.DataSource = dataToBind.ToList();
                    gridViewCustomers.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Visible = true;
                lblMessage.Text = ex.Message;
                // Gotcha!!! :)
            }
        }

        private void SearchByName2(string name)
        {
            using (var entities = new DemoEntities())
            {
                var dataToBind = from customer in entities.Customers
                                 where (customer.Title + " " + customer.FirstName + " " + customer.LastName).Contains(name)
                                 select customer;

                gridViewCustomers.DataSource = dataToBind.ToList();
                gridViewCustomers.DataBind();
            }
        }

        #endregion Demo Code
    }
}