﻿using BusinessObjects.Models;
using Repository.Repositories.GenericRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repositories.SeatClassRepositories
{
    public interface ISeatClassRepository : IGenericRepository<SeatClass>
    {
        Task<SeatClass> GetSeatClassBySeatClassName(string seatClassName);
        Task<List<SeatClass>> GetAllSeatClass();
    }
}