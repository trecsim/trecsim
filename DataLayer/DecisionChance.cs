//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class DecisionChance
    {
        public int Id { get; set; }
        public int SimulationId { get; set; }
        public int DecisionId { get; set; }
        public double Chance { get; set; }
        public bool Enabled { get; set; }
    }
}
