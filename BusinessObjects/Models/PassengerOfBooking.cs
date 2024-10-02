﻿using System;
using System.Collections.Generic;

namespace BusinessObjects.Models;

public partial class PassengerOfBooking
{
    public string Id { get; set; } = null!;

    public string? PassengerId { get; set; }

    public string? BookingId { get; set; }

    public virtual BookingInformation? Booking { get; set; }

    public virtual Passenger? Passenger { get; set; }
}
