﻿using BusinessObjects.Models;
using Repository.Repositories.GenericRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repositories.RankRepositories
{
    public interface IRankRepository : IGenericRepository<Rank>
    {
        Task<List<Rank>> GetAllRankAsync();
        Task<Rank> GetRank(string id);
        Task<string> GetRankIdByName(string name);

    }
}
