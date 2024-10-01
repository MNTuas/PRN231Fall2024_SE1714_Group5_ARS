﻿using BusinessObjects.Models;
using DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repositories.RankRepositories
{
    public class RankRepository : GenericDAO<Rank>, IRankRepository
    {
       

      
        public async Task<List<Rank>> GetAllRankAsync()
        {
            var listRank = await Get();
            return listRank.ToList();
        }

    }
}
