﻿using System;

namespace Models.Interfaces
{
    public interface IProduction : ISimObject
    {
        int NodeId { get; set; }
        int ProductId { get; set; }
        int Quantity { get; set; }
        int Quality { get; set; }
        double Price { get; set; }
    }
}
