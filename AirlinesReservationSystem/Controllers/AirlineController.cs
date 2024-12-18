﻿using BusinessObjects.RequestModels.Airlines;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Service.Services.AirlineServices;

namespace AirlinesReservationSystem.Controllers
{

    [Route("api/airline")]
    [ApiController]
    public class AirlineController : ControllerBase
    {
        private readonly IAirlineService _airlineService;

        public AirlineController(IAirlineService airlineService)
        {
            _airlineService = airlineService;
        }

        [HttpGet("Get_AllAirline")]
        public async Task<IActionResult> GetAllAirlines()
        {
            var response = await _airlineService.GetAllAirlines();
            return Ok(response);
        }

        [HttpGet]
        [Route("{id}")]
        [Authorize(Roles = "Staff")]
        public async Task<IActionResult> GetAirlinesInfo(string id)
        {
            var response = await _airlineService.GetDetailsAirlineInfo(id);
            return Ok(response);
        }

        [HttpPut]
        [Route("{id}")]
        [Authorize(Roles = "Staff")]
        public async Task<IActionResult> UpdateAirlines(string id, AirlinesUpdateModel model)
        {
            await _airlineService.UpdateAirlines(id, model);
            return Ok("Update airline successfully");
        }

        [HttpPut]
        [Route("{id}/status")]
        [Authorize(Roles = "Staff")]
        public async Task<IActionResult> ChangeAirlinesStatus(string id)
        {
            await _airlineService.ChangeAirlinesStatus(id);
            return Ok("Update airlines's status successfully");
        }

        [HttpPost]
        [Authorize(Roles = "Staff")]
        public async Task<IActionResult> AddNewAirlines(AirlinesCreateModel model)
        {
            await _airlineService.AddAirlines(model);
            return Ok("Add airline successfully");
        }
    }
}
