﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
namespace WebBazzer.Gateway
{
    public class BaseGateway
    {
        public SqlConnection Connection { get; set; }
        public string Query { get; set; }
        public SqlCommand Command { get; set; }
        public SqlDataReader Reader { get; set; }
        public BaseGateway()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["WebBazer"].ConnectionString;
            Connection = new SqlConnection(connectionString);
        }
    }
}