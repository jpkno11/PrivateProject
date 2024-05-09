package com.green.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	 return "redirect:/articles/" +saved.getId();
     
 }
  @GetMapping("/articles/{id}")
   public String show(@PathVariable  Long id, Model model) {
	  log.info("id="+id);
	  Article articleEntity = articleRepository.findById(id).orElse(null);
	  model.addAttribute("article",articleEntity);
	  return "articles/show";
  }
  @GetMapping ("/articles")
 public String index(Model model) {
	 
	 //1. 모든데이터 가져오기
	  ArrayList<Article> articleEntityList =articleRepository.findAll(); 	
	 //2. 모델에 데이터 등록하기
	  model.addAttribute("articleList",articleEntityList);
	 //3. 뷰페이지 설정하기
	  return "articles/list";
 }
  	@GetMapping ("/articles/{id}/edit")
   public String edit(@PathVariable Long id, Model model) {
  		// 수정할 데이터 가져오기
  		Article articleEntity = articleRepository.findById(id).orElse(null);
  		model.addAttribute("article", articleEntity);
  		// 뷰페이지설정하기
  		return "articles/edit";
  	}
 @PostMapping("articles/update")
 public String update(ArticleDto Dto ) {
	 log. info(Dto.toString());
	 //1. Dto를 엔티티 변환하기
	 Article articleEntity =Dto.toEntity();	 
	 log.info(Dto.toString());
	 //2. 엔티티를 DB에 저장하기
	 Article target =  articleRepository.findById(articleEntity.getId()).orElse(null);
	 //2-2 기존데이터값을 갱신하기
	 if (target != null) {
		 articleRepository.save(articleEntity); //엔티티를 DB에 저장(갱신)
		 
	 }
	 //3. 수정 결과페이지 리다이렉트하기
	 return "redirect:/articles/"+articleEntity.getId();
 }
  @GetMapping("/articles/{id}/delete")
  public String delete(@PathVariable Long id, RedirectAttributes rttr) {
	  log.info("삭제요청이 들어왔습니다!!"); 
	 //1. 삭제할 대상 가져오기
	  Article target = articleRepository.findById(id).orElse(null);
	  log.info(target.toString());
	  //2. 대상 엔티티 삭제하기
	  if(target != null) {
		  articleRepository.delete(target);
		  rttr.addFlashAttribute("msg","삭제됐습니다!");
	  }	  
		   
	 //3.결과 페이지로 리다이렉트하기
	  
	  
	  return "redirect:/articles";
    

}
}