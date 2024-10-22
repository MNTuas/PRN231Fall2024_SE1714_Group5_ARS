﻿using BusinessObjects.ResponseModels.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Services.UserServices
{
    public interface IUserService
    {
        Task<List<UserInfoResponseModel>> GetAllUserExceptAdmin();
    }
}
