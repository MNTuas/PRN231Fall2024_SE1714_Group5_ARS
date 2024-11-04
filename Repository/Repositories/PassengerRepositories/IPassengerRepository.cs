﻿using BusinessObjects.Models;
using Repository.Repositories.GenericRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repositories.PassengerRepositories
{
    public interface IPassengerRepository : IGenericRepository<Passenger>
    {
        Task<List<Passenger>> GetAllPassenger();
        Task<Passenger> GetById(string id);
        Task<List<Passenger>> GetByLogin(string id);
    }
}
