﻿using BusinessObjects.Models;
using DAO;

namespace Repository.Repositories.TicketRepositories
{
    public class TicketRepository : GenericDAO<Ticket>, ITicketRepository
    {
        public async Task<List<Ticket>> GetAllTicket()
        {
            var list = await Get();
            return list.ToList();
        }

        public async Task<Ticket> GetById(string id)
        {
            return await GetSingle(a => a.Id.Equals(id));
        }

        public async Task<List<Ticket>> GetTicketByBookingId(string bookingId)
        {
            var list = await Get(b => b.BookingId.Equals(bookingId));
            return list.ToList();
        }
    }
}