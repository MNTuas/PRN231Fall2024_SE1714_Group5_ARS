﻿namespace BusinessObjects.ResponseModels.User
{
    public class UserInfoResponseModel
    {
        public string Id { get; set; } = null!;

        public string? Avatar { get; set; }

        public string Name { get; set; } = null!;

        public string? PhoneNumber { get; set; }

        public string Email { get; set; } = null!;

        public string? Address { get; set; }

        public int? Point { get; set; }

        public string? RankName { get; set; } = null!;

        public decimal? Discount { get; set; }

        public string Role { get; set; } = null!;

        public string Status { get; set; } = null!;

    }
}
