﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentConnect_Project
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                string query = string.Format("select StudentNumber,Firstname,Surname,Hometown,UniversityName,QualificationName,image from Student Where StudentNumber ='" + (string)Session["profilestudentnumber"] + "'");

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

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void Backbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }


        protected void Connectbtn_Click(object sender, EventArgs e)
        {
            // Get the student number from the session
            string studentNumber = (string)Session["studentnumber"];

            if (string.IsNullOrEmpty(studentNumber))
            {
                Response.Write("<script>alert('Session expired or invalid. Please log in again.');</script>");
                return;
            }

            // Get the recipient student number from FormView1
            string recipientNumber = ((System.Web.UI.WebControls.Label)FormView1.FindControl("StudentNumberLabel")).Text;

            if (string.IsNullOrEmpty(recipientNumber))
            {
                Response.Write("<script>alert('Recipient student number not found.');</script>");
                return;
            }

            // Check if a request already exists
            if (checkRequestExists(studentNumber, recipientNumber))
            {
                Response.Write("<script>alert('Request is already made');</script>");
            }
            else
            {
                // Make a new request
                if (RequestMade(studentNumber, recipientNumber))
                {
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Failed to make the request. Please try again later.');</script>");
                }
            }
        }

        bool checkRequestExists(string sender, string recipient)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM ConnectRequest WHERE Sender=@Sender AND Recipient=@Recipient", con);
                    cmd.Parameters.AddWithValue("@Sender", sender);
                    cmd.Parameters.AddWithValue("@Recipient", recipient);
                    int count = (int)cmd.ExecuteScalar();
                    return count >= 1;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        bool RequestMade(string sender, string recipient)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO ConnectRequest (Sender, Recipient) VALUES (@Sender, @Recipient)", con);
                    cmd.Parameters.AddWithValue("@Sender", sender);
                    cmd.Parameters.AddWithValue("@Recipient", recipient);
                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }



    }
}