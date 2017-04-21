﻿using DatabaseHandler.Helpers;
using Models;

namespace DatabaseHandler.StoreProcedures
{
    public class SimSettingsCreate : StoredProcedureBase
    {
        public SimSettingsCreate(SimulationSettings model) : base(StoredProcedures.SimSettingsCreate, model)
        {
        }
    }
}
