﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentConnect_Project
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = string.Format("select StudentNumber,Firstname,Surname,Hometown,UniversityName,QualificationName,image,Description from Student Where StudentNumber ='" + (string)Session["profilestudentnumber"] + "'");

                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand(query, con);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                FormView1.DataSource = reader;
                FormView1.DataBind();
                con.Close();
            }
            string query2 = string.Format("select StudentNumber,image from Student Where StudentNumber ='" + (string)Session["profilestudentnumber"] + "'");

            SqlConnection con2 = new SqlConnection(strcon);
            SqlCommand cmd2 = new SqlCommand(query2, con2);

            con2.Open();
            SqlDataReader reader2 = cmd2.ExecuteReader();

            FormView2.DataSource = reader2;
            FormView2.DataBind();
            con2.Close();


        }

        protected void Unblockbtn_Click(object sender, EventArgs e)
        {
            string studentNumber = ((System.Web.UI.WebControls.Label)FormView1.FindControl("StudentNumberLabel")).Text;

            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                  

                    // Delete the blocked
                    SqlCommand deleteRequestCmd = new SqlCommand("DELETE FROM Blocked WHERE Sender=@Sender AND Recipient=@Recipient;", con);
                    deleteRequestCmd.Parameters.AddWithValue("@Recipient", (string)Session["studentnumber"]);
                    deleteRequestCmd.Parameters.AddWithValue("@Sender", studentNumber);
                    deleteRequestCmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Unblocked');</script>");

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                
            }
        }

        protected void Backbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Blocked.aspx");
        }
    }
}