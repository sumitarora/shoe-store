using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class Compare : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Fill controls with data
            String removeId = Request.QueryString["rem"];
            if (removeId != null)
            {
                deleteComparison(removeId);
            }
            PopulateControls();
            
        }
        
    }

    public void PopulateControls()
    { 
            DataTable old_table = new DataTable();
        
            try
            {
                String user_ip = Session["user_ip_add"].ToString();

                old_table = CatalogAccess.GetProductComparison(user_ip);

                if (old_table.Rows.Count > 0)
                {
                    DataTable newTable = getTranspose(old_table);
                    DataRow newRow = newTable.NewRow();
                    DataRow newPicRow = newTable.NewRow();
                    String id = "", picFile = "";
                    for (int a = 1; a < newTable.Columns.Count; a++)
                    {
                        picFile = newTable.Rows[0][a].ToString();
                        id = newTable.Rows[1][a].ToString();
                        newRow[a] = "<a href=\"Compare.aspx?rem=" + id + "\">Remove</a>";
                        newPicRow[a] = "<img src=\"ProductImages/" + picFile + "\" width=\"100px\" />";
                    }
                    newTable.Rows.Add(newRow);
                    newTable.Rows.InsertAt(newPicRow, 0);

                    GenerateGridColumns(newTable);
                    newTable.Rows[1].Delete();
                    gv_productCompare.DataSource = newTable;
                    for (int k = 1; k < newTable.Columns.Count; k++)
                    {
                        gv_productCompare.Columns[k].ItemStyle.Width = 170;
                    }
                    gv_productCompare.RowStyle.Height = 40;

                    gv_productCompare.DataBind();
                }
                else
                {
                    compareStatus.Text = "<div class=\"fail\">No items to compare</div>";
                }
            }
            catch (Exception e1)
            {
                compareStatus.Text = "<div class=\"fail\">No items to compare</div>";
            }
        
    }

    public ArrayList ConvertDT(DataTable dt)
    {
        ArrayList converted = new ArrayList(dt.Rows.Count);
        foreach (DataRow dr in dt.Rows)
        {
            converted.Add(dr);
        }
        return converted;
    }


    private DataTable getTranspose(DataTable old_table)
    {
        DataTable new_table = new DataTable();
        new_table.Columns.Add(new DataColumn("0", typeof(string)));
       
        for (int i = 0; i < old_table.Columns.Count; i++)
        {
            DataRow newRow = new_table.NewRow();
            newRow[0] = "<b>" + old_table.Columns[i].ColumnName + "</b>";

            for (int j = 1; j <= old_table.Rows.Count; j++)
            {
                if (new_table.Columns.Count < old_table.Rows.Count + 1)
                {
                    new_table.Columns.Add(new DataColumn(j.ToString(), typeof(string)));
                }

                newRow[j] = old_table.Rows[j - 1][i];
            }

            new_table.Rows.Add(newRow);
          
        }

        
        return new_table;
    }

    private void GenerateGridColumns(DataTable dt)
    {
        gv_productCompare.AutoGenerateColumns = false;

        for (int i = 0; i < dt.Columns.Count; i++)
        {
            BoundField field = new BoundField();
            field.DataField = dt.Columns[i].ColumnName;
            field.HtmlEncode = false;
            gv_productCompare.Columns.Add(field);
        }
    }
    protected void remove_Click(object sender, EventArgs e)
    {
        String user_ip = Session["user_ip_add"].ToString();
        bool result = CatalogAccess.RemoveAllComparison(user_ip);
        if (result == true)
        {
            compareStatus.Text = "<div class=\"success\">All items removed</div>";
            gv_productCompare.DataSource = null;
        }
        else
        {
            compareStatus.Text = "Please try later";
        }

    }

    private void deleteComparison(String remove_id)
    {
        String user_ip = Session["user_ip_add"].ToString();
        bool result = CatalogAccess.RemoveComparison(user_ip, remove_id);
        if (result == true)
        {
            compareStatus.Text = "<div class=\"success\">Selected Item Removed</div>";
        }
        else
        {
            compareStatus.Text = "Please try later";
        }
    }
}