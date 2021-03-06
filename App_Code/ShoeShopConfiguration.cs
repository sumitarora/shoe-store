﻿using System.Configuration;

public static class ShoeShopConfiguration
{
    // Caches the connection string
    private static string dbConnectionString;
    // Caches the data provider name 
    private static string dbProviderName;
    // Store the number of products per page
    private readonly static int productsPerPage;
    // Store the product description length for product lists
    private readonly static int productDescriptionLength;
    // Store the name of your shop
    private readonly static string siteName;

    static ShoeShopConfiguration()
    {
        dbConnectionString = ConfigurationManager.ConnectionStrings["ShoeShopConnection"].ConnectionString;
        dbProviderName = ConfigurationManager.ConnectionStrings["ShoeShopConnection"].ProviderName;

        productsPerPage = System.Int32.Parse(ConfigurationManager.AppSettings["ProductsPerPage"]);
        productDescriptionLength = System.Int32.Parse(ConfigurationManager.AppSettings["ProductDescriptionLength"]);
        siteName = ConfigurationManager.AppSettings["SiteName"];
    }

    // Returns the number of days for shopping cart expiration
    public static int CartPersistDays
    {
        get
        {
            return int.Parse(ConfigurationManager.AppSettings["CartPersistDays"]);
        }
    }

    public static int ProductsPerPage
    {
        get
        {
            return productsPerPage;
        }
    }

    public static int ProductDescriptionLength
    {
        get
        {
            return productDescriptionLength;
        }
    }

    public static string SiteName
    {
        get
        {
            return siteName;
        }
    }

    public static string DbConnectionString
    {
        get
        {
            return dbConnectionString;
        }
    }

    public static string DbProviderName
    {
        get
        {
            return dbProviderName;
        }
    }

    // The PayPal shopping cart URL
    public static string PaypalUrl
    {
        get
        {
            return ConfigurationManager.AppSettings["PaypalUrl"];
        }
    }
    // The PayPal email account
    public static string PaypalEmail
    {
        get
        {
            return ConfigurationManager.AppSettings["PaypalEmail"];
        }
    }

    // Currency code (such as USD)
    public static string PaypalCurrency
    {
        get
        {
            return ConfigurationManager.AppSettings["PaypalCurrency"];
        }
    }
    // Return URL after a successful transaction
    public static string PaypalReturnUrl
    {
        get
        {
            return ConfigurationManager.AppSettings["PaypalReturnUrl"];
        }
    }
    // Return URL after a canceled transaction
    public static string PaypalCancelUrl
    {
        get
        {
            return ConfigurationManager.AppSettings["PaypalCancelUrl"];
        }
    }
}

