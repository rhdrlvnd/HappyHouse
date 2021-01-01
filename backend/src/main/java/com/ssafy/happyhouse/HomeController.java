package com.ssafy.happyhouse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/board")
	private String Home() {
		return ("Board");
	}
	
	@GetMapping("/login")
	private String Login() {
		return ("index_beforeLogin");
	}
	
	@GetMapping("/main")
	private String Main() {
		return ("index_afterLogin");
	}
	
//	@GetMapping
//    public String index(){
//        return "index";
//    }
}

