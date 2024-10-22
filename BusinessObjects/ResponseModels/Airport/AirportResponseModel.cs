﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObjects.ResponseModels.Airport
{
    public class AirportResponseModel
    {
        public string Id { get; set; } = null!;

        public string Name { get; set; } = null!;

        public string City { get; set; } = null!;

        public string Country { get; set; } = null!;

        public string Status { get; set; } = null!;
    }
}