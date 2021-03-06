﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Catalog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateControls();
    }
    private void PopulateControls()
    {
        // Retrieve DepartmentID from the query string
        string departmentId = Request.QueryString["DepartmentID"];
        // Retrieve CategoryID from the query string
        string categoryId = Request.QueryString["CategoryID"];
        // If browsing a category...
        if (categoryId != null)
        {
            // Retrieve category and department details and display them
            CatalogAccess.CategoryDetails cd = CatalogAccess.GetCategoryDetails(categoryId);
            catalogTitleLabel.Text = "<div class=\"ptitle\">" + cd.Name + "</div>";
            CatalogAccess.DepartmentDetails dd = CatalogAccess.GetDepartmentDetails(departmentId);
            catalogDescriptionLabel.Text = HttpUtility.HtmlEncode(cd.Description);
            // Set the title of the page
            this.Title = HttpUtility.HtmlEncode(ShoeShopConfiguration.SiteName + ": " + dd.Name + ": " + cd.Name);
        }
        // If browsing a department...
        else if (departmentId != null)
        {
            // Retrieve department details and display them
            CatalogAccess.DepartmentDetails dd = CatalogAccess.GetDepartmentDetails(departmentId);
            catalogTitleLabel.Text = "<div class=\"ptitle\">" + HttpUtility.HtmlEncode(dd.Name) + "</div>";
            catalogDescriptionLabel.Text = 
            HttpUtility.HtmlEncode(dd.Description);
            // Set the title of the page
            this.Title = HttpUtility.HtmlEncode(ShoeShopConfiguration.SiteName + ": " + dd.Name);
        }

        
    }
}
