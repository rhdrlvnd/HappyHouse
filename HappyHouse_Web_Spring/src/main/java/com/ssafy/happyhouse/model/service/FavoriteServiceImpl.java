package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.FavoriteDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.dao.FavoriteDao;

@Service
public class FavoriteServiceImpl implements FavoriteService {

    @Autowired
    FavoriteDao dao;
    
    @Override
    public List<HouseDealDto> favoriteRankList() {
        return dao.favoriteRankList();
    }

    @Override
    public int insert(FavoriteDto dto) {
        return dao.insert(dto);
    }
    
}