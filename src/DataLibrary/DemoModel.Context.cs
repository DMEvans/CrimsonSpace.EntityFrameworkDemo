﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLibrary
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class DemoEntities : DbContext
    {
        public DemoEntities()
            : base("name=DemoEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Address> Addresses { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Gender> Genders { get; set; }
        public virtual DbSet<OrderItem> OrderItems { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Product> Products { get; set; }
    
        public virtual ObjectResult<DemographicRevenue_Result> DemographicRevenue(Nullable<System.DateTime> startDateTime, Nullable<System.DateTime> endDateTime)
        {
            var startDateTimeParameter = startDateTime.HasValue ?
                new ObjectParameter("StartDateTime", startDateTime) :
                new ObjectParameter("StartDateTime", typeof(System.DateTime));
    
            var endDateTimeParameter = endDateTime.HasValue ?
                new ObjectParameter("EndDateTime", endDateTime) :
                new ObjectParameter("EndDateTime", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<DemographicRevenue_Result>("DemographicRevenue", startDateTimeParameter, endDateTimeParameter);
        }
    }
}
