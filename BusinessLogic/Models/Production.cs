﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessLogic.Interfaces;

namespace BusinessLogic.Models
{
    public class Production : ISinglePkModel
    {
        public int Id { get; set; }
        public int NodeId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public int Quality { get; set; }
        public double Price { get; set; }
    }
}
