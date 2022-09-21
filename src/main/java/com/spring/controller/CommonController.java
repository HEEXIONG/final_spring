package com.spring.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("denied : "+auth);
		model.addAttribute("msg","access denied");
	}
	
	@GetMapping("/customLogin")
	public void login(String error, String logout , Model model) {
		log.info("error: "+error);
		log.info("logout: "+logout);
		
		if(error != null) {
			model.addAttribute("error","Login error" );
		}
		if(logout != null) {
			model.addAttribute("logout","logout!!");
		}
		
	}
	@GetMapping("/customLogin1")
	public void login1(String error, String logout , Model model) {
		log.info("error: "+error);
		log.info("logout: "+logout);
		
		if(error != null) {
			model.addAttribute("error","Login error" );
		}
		if(logout != null) {
			model.addAttribute("logout","logout!!");
		}
		
	}
	@GetMapping("/customLogout")
	public void logoutget() {
		log.info("custom logout");
	}
	
	@GetMapping("/users/myinfo")
	public void myinfo() {
		log.info("myinfo");
	}
	
	@GetMapping("/main")
	public void main() {
		log.info("main");
	}

}
