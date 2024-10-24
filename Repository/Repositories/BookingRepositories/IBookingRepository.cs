﻿using BusinessObjects.Models;
using Repository.Repositories.GenericRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repositories.BookingRepositories
{
    public interface IBookingRepository : IGenericRepository<BookingInformation>
    {
        Task<List<BookingInformation>> GetAllBooking();
        Task<BookingInformation> GetById(string id);
    }
}
