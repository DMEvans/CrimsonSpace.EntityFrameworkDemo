namespace WebInterface
{
    using DataLibrary;
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Linq;
    using System.Web.UI.WebControls;

    public partial class Demo6 : System.Web.UI.Page
    {
        #region Scaffolding Code

        private enum OrderStatuses
        {
            None = 0,
            NoOrders = 1,
            HasOrders = 2,
            HasDispatchedOrders = 3,
            HasPendingOrders = 4
        }

        private List<Category> Categories
        {
            get { return SessionListInitializer<Category>("Categories"); }
            set { Session["Categories"] = value; }
        }

        private int PageIndex
        {
            get { return Session["PageIndex"] != null ? (int)Session["PageIndex"] : 0; }
            set { Session["PageIndex"] = value; }
        }

        private int PageSize
        {
            get { return Session["PageSize"] != null ? (int)Session["PageSize"] : 8; }
            set { Session["PageSize"] = value; }
        }

        protected void Click_btnSearch(object sender, EventArgs e)
        {
            PageIndex = 0;

            ExecuteAdvancedSearch();
        }

        protected void lnkPage_Click(object sender, EventArgs e)
        {
            var pageLink = sender as LinkButton;

            int newPageIndex;

            if (!int.TryParse(pageLink.CommandArgument, out newPageIndex))
            {
                lblMessage.Text = "Page transition failed";
                placeholderMessage.Visible = true;
                return;
            }

            PageIndex = newPageIndex;
            ExecuteAdvancedSearch();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            placeholderMessage.Visible = false;

            if (!IsPostBack)
            {
                PopulateCategoryDropDownList();
            }
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

        private void LoadCategoryList()
        {
            using (var entities = new DemoEntities())
            {
                Categories = entities.Categories.ToList();
            }
        }

        private void PopulateCategoryDropDownList()
        {
            if (!Categories.Any())
            {
                LoadCategoryList();
            }

            ddlCategory.DataSource = Categories;
            ddlCategory.DataValueField = "Id";
            ddlCategory.DataTextField = "Name";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        private void PopulatePager(int itemCount)
        {
            var pageCount = (int)Math.Ceiling(Convert.ToDecimal(itemCount) / Convert.ToDecimal(PageSize));

            var pages = new List<ListItem>();

            for (int i = 0; i < pageCount; i++)
            {
                pages.Add(new ListItem((i + 1).ToString(), i.ToString(),  i != PageIndex));
            }

            rptPager.DataSource = pages;
            rptPager.DataBind();
        }

        #endregion Scaffolding Code

        #region Demo Code

        private IQueryable<Product> ApplyCategoryFilter(IQueryable<Product> query)
        {
            var selectedCategoryId = int.Parse(ddlCategory.SelectedValue);

            if (selectedCategoryId == 0)
            {
                return query;
            }

            return query.Where(x => x.CategoryId == selectedCategoryId);
        }

        private IQueryable<Product> ApplyNameFilter(IQueryable<Product> query)
        {
            if (string.IsNullOrWhiteSpace(txtNameSearch.Text))
            {
                return query;
            }

            return from product in query
                   where product.Name.Contains(txtNameSearch.Text)
                   select product;
        }

        private IQueryable<Product> ApplyOrderStatusFilter(IQueryable<Product> query)
        {
            var orderStatus = (OrderStatuses)int.Parse(ddlOrderStatus.SelectedValue);

            switch (orderStatus)
            {
                case OrderStatuses.NoOrders:
                    return query.Where(x => !x.OrderItems.Any());

                case OrderStatuses.HasOrders:
                    return query.Where(x => x.OrderItems.Any());

                case OrderStatuses.HasDispatchedOrders:
                    return query.Where(x => x.OrderItems.Where(y => y.Order.IsSent).Any());

                case OrderStatuses.HasPendingOrders:
                    return query.Where(x => x.OrderItems.Where(y => !y.Order.IsSent).Any());

                default:
                    return query;
            }
        }

        private IQueryable<Product> ApplyPriceRangeFilter(IQueryable<Product> query)
        {
            if (string.IsNullOrWhiteSpace(txtPriceFrom.Text) && string.IsNullOrWhiteSpace(txtPriceTo.Text))
            {
                return query;
            }

            decimal fromPrice;
            decimal toPrice;

            decimal.TryParse(txtPriceFrom.Text, out fromPrice);
            decimal.TryParse(txtPriceTo.Text, out toPrice);

            if (fromPrice == 0 && toPrice == 0)
            {
                return query;
            }

            return query.Where(x => x.Price >= fromPrice && x.Price <= toPrice);
        }

        private IQueryable<Product> ApplySalesExceedFilter(IQueryable<Product> query)
        {
            if (string.IsNullOrEmpty(txtSalesExceed.Text))
            {
                return query;
            }

            int value;

            if (!int.TryParse(txtSalesExceed.Text, out value))
            {
                return query;
            }

            return from product in query
                   where product.OrderItems.Sum(x => x.Quantity) >= value
                   select product;
        }

        private void BindQueryResults(IQueryable<Product> query)
        {
            var totalItems = query.Count();

            PopulatePager(totalItems);

            query = query.Include(x => x.Category);
            query = query.OrderBy(x => x.Name);
            query = query.Skip(PageIndex * PageSize);
            query = query.Take(PageSize);

            rptProducts.DataSource = query.ToList();
            rptProducts.DataBind();
        }

        private void ExecuteAdvancedSearch()
        {
            using (var entities = new DemoEntities())
            {
                var query = entities.Products.AsQueryable();

                query = ApplyNameFilter(query);
                query = ApplyCategoryFilter(query);
                query = ApplyOrderStatusFilter(query);
                query = ApplyPriceRangeFilter(query);
                query = ApplySalesExceedFilter(query);

                BindQueryResults(query);
            }
        }

        #endregion Demo Code
    }
}