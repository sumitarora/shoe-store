using System;
using System.Web;

/// <summary>
/// Link factory class
/// </summary>
public class Link
{
    public static string ToPayPalCheckout(string orderName, decimal orderAmount)
    {
        return HttpUtility.UrlPathEncode(
        String.Format("{0}/business={1}&item name={2}&amount={3:0.00}&currency ={4}&return={5}&cancel return={6}",
        ShoeShopConfiguration.PaypalUrl,
        ShoeShopConfiguration.PaypalEmail,
        orderName,
        orderAmount,
        ShoeShopConfiguration.PaypalCurrency,
        ShoeShopConfiguration.PaypalReturnUrl,
        ShoeShopConfiguration.PaypalCancelUrl));
    }

    public static string ToPayPalViewCart()
    {
        return HttpUtility.UrlPathEncode(
        String.Format("{0}&business={1}&return={2}&cancel return={3}&display=1",
        ShoeShopConfiguration.PaypalUrl,
        ShoeShopConfiguration.PaypalEmail,
        ShoeShopConfiguration.PaypalReturnUrl,
        ShoeShopConfiguration.PaypalCancelUrl));
    }

    public static string ToPayPalAddItem(string productUrl, string productName, decimal productPrice, string productOptions)
    {
        return HttpUtility.UrlPathEncode(
        String.Format("{0}&business={1}&return={2}&cancel return={3}&shopping url={4}&item name={5}&amount={6:0.00}&currency={7}&on0=Options&os0={8}&add=1",
        ShoeShopConfiguration.PaypalUrl,
        ShoeShopConfiguration.PaypalEmail,
        ShoeShopConfiguration.PaypalReturnUrl,
        ShoeShopConfiguration.PaypalCancelUrl,
        productUrl,
        productName,
        productPrice,
        ShoeShopConfiguration.PaypalCurrency,
        productOptions));
    }

    // Builds an absolute URL
    private static string BuildAbsolute(string relativeUri)
    {
        // get current uri
        Uri uri = HttpContext.Current.Request.Url;
        // build absolute path
        string app = HttpContext.Current.Request.ApplicationPath;
        if (!app.EndsWith("/")) app += "/";
        relativeUri = relativeUri.TrimStart('/');
        // return the absolute path
        return HttpUtility.UrlPathEncode(
          String.Format("http://{0}:{1}{2}{3}",
          uri.Host, uri.Port, app, relativeUri));
    }

    // Generate a department URL
    public static string ToDepartment(string departmentId, string page)
    {
        if (page == "1")
            return BuildAbsolute(String.Format("Catalog.aspx?DepartmentID={0}", departmentId));
        else
            return BuildAbsolute(String.Format("Catalog.aspx?DepartmentID={0}&Page={1}", departmentId, page));
    }

    // Generate a department URL for the first page
    public static string ToDepartment(string departmentId)
    {
        return ToDepartment(departmentId, "1");
    }

    public static string ToCategory(string departmentId, string categoryId, string page)
    {
        if (page == "1")
            return BuildAbsolute(String.Format("Catalog.aspx?DepartmentID={0}&CategoryID={1}", departmentId, categoryId));
        else
            return BuildAbsolute(String.Format("Catalog.aspx?DepartmentID={0}&CategoryID={1}&Page={2}", departmentId, categoryId, page));
    }

    public static string ToCategory(string departmentId, string categoryId)
    {
        return ToCategory(departmentId, categoryId, "1");
    }

    public static string ToProduct(string productId)
    {
        return BuildAbsolute(String.Format("Product.aspx?ProductID={0}", productId));
    }

    public static string ToProductImage(string fileName)
    {
        // build product URL
        return BuildAbsolute("/ProductImages/" + fileName);
    }

}
