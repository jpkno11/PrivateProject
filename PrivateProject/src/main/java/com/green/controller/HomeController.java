package com.green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
 // hi : http://localhost:9090/hi
	@GetMapping("/hi")
	public String hi() {
		return "greetings";
	 // greetings.mustache 화면을 보여줄 template 이름 
		 // resources/template package 에생성
	}
	@GetMapping("/hi2")
	public String hi2(Model model) {
		model.addAttribute("username", "손흥민");
		return "greetings2";
			
	}
   @GetMapping("/hi3")
   public String hi3(Model model) {
	   model.addAttribute("username", "클로셉스키");
	   return "greetings3";
			   
   }
  @GetMapping("/hi4")
  public String hi4(Model model) {
	  model.addAttribute("username","메디슨");
	  return "greetings4";
  }
}
