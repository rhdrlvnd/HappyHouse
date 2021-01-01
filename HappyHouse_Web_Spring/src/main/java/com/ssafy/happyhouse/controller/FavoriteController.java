package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.FavoriteDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.service.FavoriteService;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/favorite")
public class FavoriteController {

    @Autowired
    FavoriteService service;

    private static final int SUCCESS = 1;
    private static final int FAIL = -1;

    @GetMapping(value = "/rank")
    private ResponseEntity<List<HouseDealDto>> favoriteRankList() {
        List<HouseDealDto> houseDealList;

        houseDealList = service.favoriteRankList();
        if(!houseDealList.isEmpty()) {
            return new ResponseEntity<List<HouseDealDto>>(houseDealList, HttpStatus.OK);
        }else {
            return new ResponseEntity<List<HouseDealDto>>(houseDealList, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @PostMapping("/insert")
    public String insert(@RequestBody FavoriteDto dto, HttpSession session) {

//        System.out.println(dto.getUser_name());
//        System.out.println(dto.getUser_email());
//        System.out.println(dto.getUser_password());
        int result = service.insert(dto);
        System.out.println(result);
        if (result == 1) {
            session.setAttribute("userDto", dto);
            return "success";
        }
        return "fail";
    }
}