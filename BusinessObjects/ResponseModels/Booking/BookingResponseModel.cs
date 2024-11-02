﻿using BusinessObjects.ResponseModels.Ticket;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObjects.ResponseModels.Booking
{
    public class BookingResponseModel
    {
        public string Id { get; set; } = null!;

        public string UserName { get; set; } = null!;

        public DateTime CreatedDate { get; set; }

        public int Quantity { get; set; }

        public string Status { get; set; } = null!;

        public string FlightStatus { get; set; } = null!;

        public decimal TotalAmount { get; set; }

        public virtual List<TicketResponseModel> Tickets { get; set; } = new List<TicketResponseModel>();
    }
}