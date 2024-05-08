package com.green.repository;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;

import com.green.Entity.Article;

public interface ArticleRepository extends CrudRepository<Article,Long> {
	@Override
	ArrayList<Article> findAll();
	
 
}
