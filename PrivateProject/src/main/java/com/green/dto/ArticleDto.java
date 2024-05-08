package com.green.dto;

import com.green.Entity.Article;

public class ArticleDto {
   private String title;
   private String content;
public ArticleDto(String title, String content) {
	super();
	this.title = title;
	this.content = content;
}
@Override
public String toString() {
	return "ArticleDto [title=" + title + ", content=" + content + "]";
}
public Article toEntity() {
	Article article = new Article(null, title, content);	
	return article;
}
 
}
