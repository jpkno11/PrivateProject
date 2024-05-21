package com.green.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Faq")
public class FaqController {
	
	
	@RequestMapping("/Home")
	public String home() {
		return "/user/faq";
	}
	@RequestMapping("/CHome")
	public String chome() {
		return "/company/faq";
	}
	@RequestMapping("/cfaq")
	public String Cfaq() {
		return "company/cfaq";
	}
	
}
