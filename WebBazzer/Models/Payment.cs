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
    
    public partial class Payment
    {
        public int Id { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public int PaymentTypeId { get; set; }
        public Nullable<System.DateTime> PaymentDate { get; set; }
        public Nullable<int> CusomerId { get; set; }
        public Nullable<bool> OrderComplete { get; set; }
    
        public virtual Coustomer Coustomer { get; set; }
        public virtual PaymentType PaymentType { get; set; }
    }
}
