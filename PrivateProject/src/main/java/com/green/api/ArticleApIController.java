package com.green.api;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.green.Entity.Article;
import com.green.dto.ArticleDto;
import com.green.repository.ArticleRepository;
@RestController

public class ArticleApIController {
  @Autowired
 private ArticleRepository articleRepository;
  //GET
  @GetMapping("/api/articles")
 public List<Article> index(){
 return articleRepository.findAll();
   }
 @GetMapping("/api/articles/{id}")
 public Article show(@PathVariable Long id) {
	 return articleRepository.findById(id).orElse(null);
 }
 @PostMapping("/api/articles")
 public Article create(@RequestBody ArticleDto dto) {
	
   	 
 }
 
	 
 }

