//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebBazzer.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Wishlist
    {
        public int ID { get; set; }
        public int CustomerID { get; set; }
        public int ProductID { get; set; }
        public Nullable<bool> isActive { get; set; }
        public Nullable<int> OrderId { get; set; }
    
        public virtual Coustomer Coustomer { get; set; }
        public virtual Order Order { get; set; }
        public virtual Product Product { get; set; }
    }
}
