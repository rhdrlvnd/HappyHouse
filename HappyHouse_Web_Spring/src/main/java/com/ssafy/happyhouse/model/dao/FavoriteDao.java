package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.FavoriteDto;
import com.ssafy.happyhouse.model.HouseDealDto;

@Mapper
public interface FavoriteDao {

    List<HouseDealDto> favoriteRankList();

    int insert(FavoriteDto dto);
    
}