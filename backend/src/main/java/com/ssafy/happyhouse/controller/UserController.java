package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.UserDto;
import com.ssafy.happyhouse.model.service.JwtService;
import com.ssafy.happyhouse.model.service.UserService;

import ch.qos.logback.core.Context;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private JwtService jwtService;
    
    @Autowired
    UserService service;
    
    public static final Logger logger = LoggerFactory.getLogger(UserController.class);
    
    @PostMapping("/register")
    public String register(@RequestBody UserDto dto, HttpSession session) {

//        System.out.println(dto.getUser_name());
//        System.out.println(dto.getUser_email());
//        System.out.println(dto.getUser_password());
        int result = service.register(dto);
        System.out.println(result);
        if (result == 1) {
            session.setAttribute("userDto", dto);
            return "success";
        }
        return "fail";
    }
    
    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> login(@RequestBody UserDto userDto, HttpServletResponse response, HttpSession session) {
        Map<String, Object> resultMap = new HashMap<>();
        HttpStatus status = null;
        System.out.println(this.getClass().getName());
        System.out.println(userDto.toString());
        try {
            UserDto loginUser = service.login(userDto);
            
            if(loginUser != null) {
                String token = jwtService.create(loginUser);
                logger.trace("로그인 토큰정보 : {}", token);
                
                resultMap.put("auth-token", token);
                resultMap.put("user-id", loginUser.getUser_id());
                resultMap.put("user-name", loginUser.getUser_name());
                resultMap.put("user-no", loginUser.getUserNo());
                status = HttpStatus.ACCEPTED;
                System.out.println(1);
            } else {
                resultMap.put("message", "로그인 실패");
                status = HttpStatus.ACCEPTED;
                System.out.println(2);
            }
        } catch (Exception e) {
            logger.error("로그인 실패 : {}", e);
            resultMap.put("message", e.getMessage());
            status = HttpStatus.INTERNAL_SERVER_ERROR;
            System.out.println(3);
        }
        return new ResponseEntity<Map<String, Object>>(resultMap, status);
    }
    
    @GetMapping("/detail")
    public ResponseEntity<UserDto> detail(UserDto userDto, HttpSession session) throws Exception {

        String userName = userDto.getUser_name();
        userDto = service.detail(userName);
        
        return new ResponseEntity<UserDto>(userDto, HttpStatus.OK);
    }
    
    @PostMapping("update")
    public String update(@RequestBody UserDto userDto, HttpSession session) {

        int result = service.update(userDto);
        System.out.println(result);
        if (result == 1) {
            return "success";
        }
        return "fail";
    }
    
    @PostMapping("/delete")
    public String delete(@RequestBody UserDto userDto, HttpSession session) {

        int result = service.delete(userDto.getUser_name());
        System.out.println(result);
        if (result == 1) {
            return "success";
        }
        return "fail";
    }
    
}