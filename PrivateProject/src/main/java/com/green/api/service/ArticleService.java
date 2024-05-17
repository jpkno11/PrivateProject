package com.green.api.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.Entity.Article;
import com.green.dto.ArticleDto;
import com.green.repository.ArticleRepository;

import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import net.bytebuddy.implementation.Implementation.Target;
@Slf4j
@Service
	public class ArticleService {
	  @Autowired
	  private ArticleRepository articleRepository; //게시글 리파지터리 객체 주입

	public List<Article> index() {

		return articleRepository.findAll();
	}

	public Article show(Long id) {
		return articleRepository.findById(id).orElse(null);
		
	}

	public Article create(ArticleDto dto) {
		Article article = dto.toEntity();	
		if(article.getId() !=null) {
			 return null;
		}
       return articleRepository.save(article);	
 	}

	public Article update(Long id, ArticleDto dto) {
		// 1.DTO-> 엔티티변환하기
		Article article = dto.toEntity();
		log.info("id:{}, article: {}",id, article.toString());
		//2.타깃 조회하기
	   	Article target= articleRepository.findById(id).orElse(null);
	   // 3. 잘못된 요청 처리하기
	   	if (target==null|| id != article.getId()) {
	   		log.info("잘못된요청! id:{},article:{}",id,article.toString());
	   	    return null;			
	   	}
	
	  //4. 업데이트하기
	 target.patch(article);
	 Article updated= articleRepository.save(target);
	 return updated;
       
}

	public Article delete(Long id) {
		 //1. 대상찾기
		Article target = articleRepository.findById(id).orElse(null);
		//2. 잘못된 요청처리하기
		if(target == null) {
			return null;
		}
		
        //3. 대상 삭제하기
	articleRepository.delete(target);
	 return target;
	}
   @Transactional
	public List<Article> createArticles(List<ArticleDto> dtos) {
		//1.dto 묶음을 엔티티 묶음으로 변환하기
		List<Article> articleList=dtos.stream()
			.map(dto ->dto.toEntity())
			.collect(Collectors.toList());
	
		//2.엔티티 묶음을 DB에 저장하기
		articleList.stream()
		.forEach(article->articleRepository.save(article));
		//3.강제 예외 발생시키기
		 articleRepository.findById(-1L)
		 .orElseThrow(()->new IllegalArgumentException("결제실패"));
		
		//4.결과 값 반환하기
		return articleList;
	

	}
}