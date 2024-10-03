﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using BusinessObjects.Models;
using DAO;

namespace ARS_FE.Pages.Staff.AirportManagement
{
    public class EditModel : PageModel
    {
        private readonly IHttpClientFactory _httpClientFactory;

        public EditModel(IHttpClientFactory httpClientFactory)
        {
            _httpClientFactory = httpClientFactory;
        }

        [BindProperty]
        //public UpdateAirportRequest updateAirportRequest { get; set; } = default!;
        public Airport airport { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(string id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var client = _httpClientFactory.CreateClient("ApiClient");

            var response = await APIHelper.GetAsJsonAsync<Airport>(client, $"Airport/{id}");
            if (response != null)
            {
                airport = response;
                return Page();
            }
            else
            {
                return BadRequest();
            }
        }

        //public async Task<IActionResult> OnPostAsync(UpdateAirportRequest updateAirportRequest)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return Page();
        //    }

        //    var client = _httpClientFactory.CreateClient("ApiClient");

        //    var n = new UpdateAirportRequest
        //    {
        //        Name = updateAirportRequest.Name,
        //        City = updateAirportRequest.City,
        //        Country = updateAirportRequest.Country,
        //    };

        //    var response = await APIHelper.PutAsJson(client, $"airport/{airport.Id}", n);

        //    if (response.IsSuccessStatusCode)
        //    {
        //        return RedirectToPage("./Index");
        //    }
        //    else
        //    {
        //        ModelState.AddModelError(string.Empty, "Error occurred while update the airline.");
        //        return Page();
        //    }
        //}
    }
}