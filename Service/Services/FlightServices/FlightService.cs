﻿using AutoMapper;
using BusinessObjects.Models;
using BusinessObjects.RequestModels.Flight;
using BusinessObjects.ResponseModels;
using Repository.Repositories.FlightRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Services.FlightServices
{
    public class FlightService : IFlightService
    {
        private readonly IFlightRepository _flightRepository;
        private readonly IMapper _mapper;

        public FlightService(IFlightRepository flightRepository, IMapper mapper)
        {
            _flightRepository = flightRepository;
            _mapper = mapper;
        }

        public async Task CreateFlight(CreateFlightRequest request)
        {
            Flight newFlight = _mapper.Map<Flight>(request);
            newFlight.Status = "Active";
            await _flightRepository.Insert(newFlight);
        }

        public async Task<List<Flight>> GetAllFlight()
        {
            return await _flightRepository.GetAllFlights();
        }

        public async Task<List<FlightResponseModel>> GetAllFlightsDetails()
        {
            return await _flightRepository.GetAllFlightsDetails();
        }

        public async Task UpdateFlight(UpdateFlightRequest request, string id)
        {
            var flight = await _flightRepository.GetFlightById(id);
            _mapper.Map(request, flight);
            await _flightRepository.Update(flight);
        }

        public async Task<FlightResponseModel> GetFlightById(string id)
        {
            var flight = await _flightRepository.GetFlightById(id);
            return new FlightResponseModel
            {
                Id = flight.Id,
                Airlines = flight.Airplane.Airlines.Name,
                AirlinesId = flight.Airplane.AirlinesId,
                AirplaneCode = flight.Airplane.Code,
                AirplaneId = flight.AirplaneId,
                DepartureTime = flight.DepartureTime,
                ArrivalTime = flight.ArrivalTime,
                From = flight.FromNavigation.City,
                FromId = flight.FromNavigation.Id,
                To = flight.ToNavigation.City,
                ToId = flight.ToNavigation.Id,
                Status = flight.Status
            };
        }
    }
}
