package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.FavoriteDto;
import com.ssafy.happyhouse.model.HouseDealDto;

public interface FavoriteService {

    List<HouseDealDto> favoriteRankList();

    int insert(FavoriteDto dto);

}