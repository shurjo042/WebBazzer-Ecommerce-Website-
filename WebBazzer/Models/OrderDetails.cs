﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBazzer.Models
{
    public partial class OrderDetails
    {
        public partial class OrderDetail
        {
            public int OrderDetailsID { get; set; }
            public int OrderID { get; set; }
            public int ProductID { get; set; }
            public Nullable<decimal> UnitPrice { get; set; }
            public Nullable<int> Quantity { get; set; }
            public Nullable<decimal> Discount { get; set; }
            public Nullable<decimal> TotalAmount { get; set; }
            public Nullable<System.DateTime> OrderDate { get; set; }

            public virtual Order Order { get; set; }
            public virtual Product Product { get; set; }
        }
    }
}