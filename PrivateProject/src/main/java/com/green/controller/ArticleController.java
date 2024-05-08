package com.green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.green.Entity.Article;
import com.green.dto.ArticleDto;
import com.green.repository.ArticleRepository;
 
@Controller
public class ArticleController {
 @GetMapping("/articles/WriteForm")
 public String  writeForm() {
	 return "articles/write";
	 
 }
 @PostMapping("articles/Write")
 public String write(ArticleDto articleDto) {
	 //넘어온 데이터 확인
	 System.out.println("결과"+articleDto.toString());
	  //1. DTO를 엔티티로변환
	 Article article = articleDto.toEntity();
	 // 2. 리파지터리로 엔티티를 DB에 저장
	 Article saved= ArticleRepository.save(article);
	   
	 return "";
     
 }
 
}
