using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Retrieve ProductID from the query string
        string productId = Request.QueryString["ProductID"];
        // Retrieves product details
        if (productId != null)
        {
            CatalogAccess.ProductDetails pd = CatalogAccess.GetProductDetails(productId);
            // Does the product exist?
            if (pd.Name != null)
            {
                PopulateControls(pd);
            }
        }   
    }

    // Fill the control with data
    private void PopulateControls(CatalogAccess.ProductDetails pd)
    {
        // Display product details
        titleLabel.Text = "<div class=\"ptitle\">" + pd.Name + "</div>";
        descriptionLabel.Text = pd.Description;
        priceLabel.Text = String.Format("{0:c}", pd.Price);
        productImage.ImageUrl = "ProductImages/" + pd.Image;
        // Set the title of the page
        this.Title = ShoeShopConfiguration.SiteName + pd.Name;

        // obtain the attributes of the product0
        DataTable attrTable = CatalogAccess.GetProductAttributes(pd.ProductID.ToString());
        // temp variables
        string prevAttributeName = "";
        string attributeName, attributeValue, attributeValueId;
        // current DropDown for attribute values
        Label attributeNameLabel;
        DropDownList attributeValuesDropDown = new DropDownList();
        // read the list of attributes
        foreach (DataRow r in attrTable.Rows)
        {
            // get attribute data
            attributeName = r["AttributeName"].ToString();
            attributeValue = r["AttributeValue"].ToString();
            attributeValueId = r["AttributeValueID"].ToString();
            // if starting a new attribute (e.g. Color, Size)
            if (attributeName != prevAttributeName)
            {
                prevAttributeName = attributeName;
                attributeNameLabel = new Label();
                attributeNameLabel.Text = attributeName + ": ";
                attributeValuesDropDown = new DropDownList();
                attrPlaceHolder.Controls.Add(attributeNameLabel);
                attrPlaceHolder.Controls.Add(attributeValuesDropDown);
            }
            // add a new attribute value to the DropDownList
            attributeValuesDropDown.Items.Add(new ListItem(attributeValue,attributeValueId));
        }
    }

    protected void AddToCartButton_Click(object sender, EventArgs e)
    {
        // Retrieve ProductID from the query string
        string productId = Request.QueryString["ProductID"];

        // Retrieve the selected product options
        string options = "";
        foreach (Control cnt in attrPlaceHolder.Controls)
        {
            if (cnt is Label)
            {
                Label attrLabel = (Label)cnt;
                options += attrLabel.Text;
            }

            if (cnt is DropDownList)
            {
                DropDownList attrDropDown = (DropDownList)cnt;
                options += attrDropDown.Items[attrDropDown.SelectedIndex] + "; ";
            }
        }

        // Add the product to the shopping cart
        ShoppingCartAccess.AddItem(productId, options);

        // Retrieves product details
        CatalogAccess.ProductDetails pd = CatalogAccess.GetProductDetails(productId);
        // The Add to Cart link
        string productUrl = Link.ToProduct(pd.ProductID.ToString());
        string destination = Link.ToPayPalAddItem(productUrl, pd.Name, pd.Price,options);
        Response.Redirect(destination);
    }

}