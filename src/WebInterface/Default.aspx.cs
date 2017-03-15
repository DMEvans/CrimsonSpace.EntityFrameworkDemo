using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ObjectLibrary;

namespace WebInterface
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var links = GetLinks();
            repeaterLinks.DataSource = links;
            repeaterLinks.DataBind();
        }

        private List<PageLink> GetLinks()
        {
            var links = new List<PageLink>()
            {
                new PageLink() { Title = "Demo 1", Url = "~/Demo1.aspx", Description = "Selecting basic data" },
                new PageLink() { Title = "Demo 2", Url = "~/Demo2.aspx", Description = "Filtering data" },
                new PageLink() { Title = "Demo 3", Url = "~/Demo3.aspx", Description = "Understanding Deferred Execution" },
                new PageLink() { Title = "Demo 4", Url = "~/Demo4.aspx", Description = "Lazy Loading vs Eager Loading" },
                new PageLink() { Title = "Demo 5", Url = "~/Demo5.aspx", Description = "Inserting New Items" }
            };

            return links;
        }
    }
}