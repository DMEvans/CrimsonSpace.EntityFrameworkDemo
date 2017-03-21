namespace WebInterface
{
    using DataLibrary;
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Linq;
    using System.Web.UI.WebControls;

    public partial class Demo5 : System.Web.UI.Page
    {
        #region Scaffolding Code

        #region Properties

        private List<Customer> Customers
        {
            get { return SessionListInitializer<Customer>("Customers"); }
            set { Session["Customers"] = value; }
        }

        private List<Gender> Genders
        {
            get { return SessionListInitializer<Gender>("Genders"); }
            set { Session["Genders"] = value; }
        }

        private List<string> ValidationMessages
        {
            get { return SessionListInitializer<string>("ValidationMessages"); }
            set { Session["ValidationMessages"] = value; }
        }

        #endregion Properties

        #region Form Methods

        protected void gridViewCustomers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridViewCustomers.EditIndex = -1;
            PopulateCustomers();
        }

        protected void gridViewCustomers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                var row = gridViewCustomers.FooterRow;
                ProcessGridViewAction(row, InsertNewCustomer);
            }
        }

        protected void gridViewCustomers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowState.HasFlag(DataControlRowState.Edit))
            {
                PopulateGenderDropDownList(e.Row);

                var dataItem = e.Row.DataItem as Customer;
                var ddlGender = e.Row.FindControl("ddlGender") as DropDownList;

                if (ddlGender != null)
                {
                    ddlGender.SelectedValue = dataItem.GenderId.ToString();
                }
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                PopulateGenderDropDownList(e.Row);
            }
        }

        protected void gridViewCustomers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DeleteCustomer(e.RowIndex);

            Customers = null;
            PopulateCustomers();
        }

        protected void gridViewCustomers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridViewCustomers.EditIndex = e.NewEditIndex;
            PopulateCustomers();
        }

        protected void gridViewCustomers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var row = gridViewCustomers.Rows[e.RowIndex];

            ProcessGridViewAction(row, UpdateCustomer);

            if (ValidationMessages.Any())
            {
                e.Cancel = true;
            }
            else
            {
                gridViewCustomers.EditIndex = -1;
                PopulateCustomers();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateCustomers();
            }
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                DisplayValidationMessages();
            }
        }
        #endregion Form Methods

        #region Private Methods
        private void DisplayValidationMessages()
        {
            if (ValidationMessages.Any())
            {
                rptValidationMessages.DataSource = ValidationMessages;
                rptValidationMessages.DataBind();
                rptValidationMessages.Visible = true;
            }
            else
            {
                rptValidationMessages.Visible = false;
            }
        }


        private void LoadGenderList()
        {
            using (var entities = new DemoEntities())
            {
                Genders = entities.Genders.ToList();
            }
        }

        private void PopulateCustomers()
        {
            using (var entities = new DemoEntities())
            {
                Customers = entities.Customers.Include(x => x.Gender).ToList();
            }

            gridViewCustomers.DataSource = Customers;
            gridViewCustomers.DataBind();
        }

        private void PopulateGenderDropDownList(GridViewRow row)
        {
            var ddlGender = row.FindControl("ddlGender") as DropDownList;

            if (ddlGender == null)
            {
                return;
            }

            if (!Genders.Any())
            {
                LoadGenderList();
            }

            ddlGender.DataSource = Genders;
            ddlGender.DataValueField = "Id";
            ddlGender.DataTextField = "Name";
            ddlGender.DataBind();
            ddlGender.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        private void ProcessGridViewAction(GridViewRow row, Action<GridViewRow> action)
        {
            ValidateInputs(row);

            if (ValidationMessages.Any())
            {
                return;
            }

            action(row);

            Customers = null;
            PopulateCustomers();
        }

        protected List<T> SessionListInitializer<T>(string variableName) where T : class
        {
            var value = Session[variableName] as List<T>;

            if (value == null)
            {
                var defaultValue = new List<T>();
                Session[variableName] = defaultValue;
                return defaultValue;
            }
            else
            {
                return value;
            }
        }

        private void ShowValidationErrors()
        {
            placeholderMessage.Visible = true;
        }

        private void ValidateInputs(GridViewRow row)
        {
            var txtTitle = row.FindControl("txtTitle") as TextBox;
            var txtFirstName = row.FindControl("txtFirstName") as TextBox;
            var txtLastName = row.FindControl("txtLastName") as TextBox;
            var txtDateOfBirth = row.FindControl("txtDateOfBirth") as TextBox;
            var ddlGender = row.FindControl("ddlGender") as DropDownList;

            ValidationMessages.Clear();

            if (string.IsNullOrWhiteSpace(txtTitle.Text))
            {
                ValidationMessages.Add("'Title' is a required field");
            }

            if (string.IsNullOrWhiteSpace(txtLastName.Text))
            {
                ValidationMessages.Add("'Last Name' is a required field");
            }

            DateTime result;

            if (string.IsNullOrWhiteSpace(txtDateOfBirth.Text))
            {
                ValidationMessages.Add("'Date Of Birth' is a required field");
            }
            else if (!DateTime.TryParse(txtDateOfBirth.Text, out result))
            {
                ValidationMessages.Add("'Date Of Birth' is not a valid date");
            }

            int selectedGenderId;

            if (!int.TryParse(ddlGender.SelectedValue, out selectedGenderId))
            {
                ValidationMessages.Add("'Gender' is a required field");
            };

            if (!Genders.Any(x => x.Id == selectedGenderId))
            {
                ValidationMessages.Add("'Gender' is a required field");
            }
        }

        #endregion Private Methods

        #endregion Scaffolding Code

        #region Demo Code

        private void InsertNewCustomer(GridViewRow row)
        {
            var txtTitle = row.FindControl("txtTitle") as TextBox;
            var txtFirstName = row.FindControl("txtFirstName") as TextBox;
            var txtLastName = row.FindControl("txtLastName") as TextBox;
            var txtDateOfBirth = row.FindControl("txtDateOfBirth") as TextBox;
            var ddlGender = row.FindControl("ddlGender") as DropDownList;

            var newCustomer = new Customer()
            {
                Title = txtTitle.Text,
                FirstName = txtFirstName.Text,
                LastName = txtLastName.Text,
                DateOfBirth = DateTime.Parse(txtDateOfBirth.Text),
                GenderId = int.Parse(ddlGender.SelectedValue)
            };

            using (var entities = new DemoEntities())
            {
                entities.Customers.Add(newCustomer);
                entities.SaveChanges();
            }
        }

        private void UpdateCustomer(GridViewRow row)
        {
            var txtTitle = row.FindControl("txtTitle") as TextBox;
            var txtFirstName = row.FindControl("txtFirstName") as TextBox;
            var txtLastName = row.FindControl("txtLastName") as TextBox;
            var txtDateOfBirth = row.FindControl("txtDateOfBirth") as TextBox;
            var ddlGender = row.FindControl("ddlGender") as DropDownList;

            var id = int.Parse(gridViewCustomers.DataKeys[row.RowIndex].Value.ToString());
            var customer = Customers.FirstOrDefault(x => x.Id == id);

            if (customer == null)
            {
                ValidationMessages.Add("Unable to locate customer record to update");
                return;
            }

            using (var entities = new DemoEntities())
            {
                entities.Customers.Attach(customer);
                customer.Title = txtTitle.Text;
                customer.FirstName = txtFirstName.Text;
                customer.LastName = txtLastName.Text;
                customer.DateOfBirth = DateTime.Parse(txtDateOfBirth.Text);
                customer.GenderId = int.Parse(ddlGender.SelectedValue);
                entities.SaveChanges();
            }
        }

        private void DeleteCustomer(int rowIndex)
        {
            var id = int.Parse(gridViewCustomers.DataKeys[rowIndex].Value.ToString());

            var customer = Customers.FirstOrDefault(x => x.Id == id);

            if (customer == null)
            {
                ValidationMessages.Add("Unable to locate customer record to delete");
                return;
            }

            using (var entities = new DemoEntities())
            {
                entities.Customers.Attach(customer);
                entities.Customers.Remove(customer);
                entities.SaveChanges();
            }
        }

        #endregion Demo Code
    }
}