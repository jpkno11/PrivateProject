package com.green.dto;

import com.green.Entity.Article;

import lombok.AllArgsConstructor;
import lombok.ToString;
@AllArgsConstructor
@ToString
public class ArticleDto {
   private String title;
   private String content;


public Article toEntity() {
	Article article = new Article(null, title, content);	
	return article;
}
 
}
