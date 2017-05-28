﻿using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;
using BusinessLogic;
using EcoSim.Models;

namespace EcoSim.Controllers
{
    public class OutputController : Controller
    {
        [HttpPost]
        public async Task<JsonResult> Simulate(int id, int numberOfIterations = 1)
        {
            var logPath = HttpContext.Server.MapPath(Constants.LogDumpLocation);
            for (var i = 0; i < numberOfIterations; i++)
            {
                var iterationSimulated = await Simulator.SimulateIteration(id, logPath).ConfigureAwait(false);
                if (!iterationSimulated)
                {
                    return Json(new ServerResponse(true, $"Iteration {i + 1} failed"));
                }
            }

            return Json(new ServerResponse(false, $"Simulation done. {numberOfIterations} iterations completed."));
        }
    }
}