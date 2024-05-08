package com.green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.green.Entity.Article;
import com.green.dto.ArticleDto;
import com.green.repository.ArticleRepository;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class ArticleController {
@Autowired
private ArticleRepository articleRepository;
 @GetMapping("/articles/WriteForm")
 public String  writeForm() {
	 return "articles/write";
	 
 }
 @PostMapping("articles/Write")
 public String write(ArticleDto articleDto) {
	 //넘어온 데이터 확인
	 log.info("결과"+articleDto.toString());
	  //1. DTO를 엔티티로변환
	 Article article = articleDto.toEntity();
	 // 2. 리파지터리로 엔티티를 DB에 저장
	 Article saved = articleRepository.save(article);
	  log.info("saved:"+saved); 
	 return "";
     
 }
  @GetMapping("/articles/{id}")
   public String show(@PathVariable  Long id, Model model) {
	  log.info("id="+id);
	  Article articleEntity = articleRepository.findById(id).orElse(null);
	  model.addAttribute("article",articleEntity);
	  return "articles/show";
  }
  @GetMapping ("/articles")
 public String index() {
	 
	 //1. 모든데이터 가져오기
	 //2. 모델에 데이터 등록하기
	 //3. 뷰페이지 설정하기
	  return "";
 }
}
