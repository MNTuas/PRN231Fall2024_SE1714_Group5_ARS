﻿using BusinessObjects.Models;
using BusinessObjects.ResponseModels.Flight;
using Repository.Repositories.GenericRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repositories.FlightRepositories
{
    public interface IFlightRepository : IGenericRepository<Flight>
    {
        Task<List<Flight>> GetAllFlights();
        Task<Flight> GetFlightById(string id);
        Task<List<Flight>> GetFlightsByFilter(string from, string to, DateTime checkin, DateTime? checkout);
        Task<Flight> GetFlightByNumber(string flightNumber, DateTime departureTime);
        Task<List<Flight>> GetAllScheduledFlight();
        Task<int> CountFlightsForAirplaneOnDate(string airplaneId, DateTime departureTime);
    }
}
