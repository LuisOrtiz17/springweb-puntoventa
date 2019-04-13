package com.softtek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String showIndex() {
		return "index";
	}
	
	@RequestMapping("/acceso")
	public String showLogin() {
		return "acceso";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		return "/";
	}
	
}
