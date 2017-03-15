using DataLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebInterface
{
    public partial class Demo5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGenderDropDownList();
            }
        }

        private void PopulateGenderDropDownList()
        {
            using (var entities = new DemoEntities())
            {
                var dataToBind = entities.Genders.ToList();

                ddlGender.DataSource = dataToBind;
                ddlGender.DataValueField = "Id";
                ddlGender.DataTextField = "Name";
                ddlGender.DataBind();

                ddlGender.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ValidateDataEntry();
        }
        
    }
}