﻿using AutoMapper;
using BusinessObjects.Models;
using BusinessObjects.RequestModels.Booking;
using BusinessObjects.ResponseModels.Booking;
using FFilms.Application.Shared.Response;
using Microsoft.AspNetCore.Http;
using Repository.Repositories.BookingRepositories;
using Service.Enums;
using Service.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Services.BookingServices
{
    public class BookingService : IBookingService
    {
        private readonly IBookingRepository _bookingRepository;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IMapper _mapper;

        public BookingService(IBookingRepository bookingRepository, IHttpContextAccessor httpContextAccessor, IMapper mapper)
        {
            _bookingRepository = bookingRepository;
            _httpContextAccessor = httpContextAccessor;
            _mapper = mapper;
        }

        public async Task<Result<BookingInformation>> addBooking(CreateBookingRequest createBookingRequest)
        {
            try
            {

                var idclaim = _httpContextAccessor.HttpContext.User.FindFirst(MySetting.CLAIM_USERID);
                var userid = idclaim.Value;


                var newBooking = new BookingInformation
                {
                    Id = Guid.NewGuid().ToString(),
                    CreatedDate = DateTime.Now,
                    Status = BookingStatusEnums.Pending.ToString(),
                    Quantity = createBookingRequest.Quantity,
                    UserId = userid,
                };

                await _bookingRepository.Insert(newBooking);
                return new Result<BookingInformation>
                {
                    Success = true,
                    Data = newBooking
                };

            }
            catch (Exception ex)
            {
                return new Result<BookingInformation>
                {
                    Success = false,
                    Message = ex.Message,
                };
            }
        }

        public async Task UpdateBookingStatus(string id, string status)
        {
            var booking = await _bookingRepository.GetById(id);
            if (booking == null)
            {
                throw new Exception("Not found booking");
            }
            booking.Status = status;
            foreach (var ticket in booking.Tickets)
            {
                ticket.Status = status;
            }
            await _bookingRepository.Update(booking);
        }

        public async Task<List<UserBookingResponseModel>> GetOwnBookings()
        {
            var idclaim = _httpContextAccessor.HttpContext.User.FindFirst(MySetting.CLAIM_USERID);
            var userid = idclaim.Value;
            var list = await _bookingRepository.GetAllBookingOfUser(userid);
            return _mapper.Map<List<UserBookingResponseModel>>(list);
        }

        public async Task<UserBookingResponseModel> GetBookingById(string id)
        {
            var booking = await _bookingRepository.GetById(id);
            return _mapper.Map<UserBookingResponseModel>(booking);
        }
    }
}
