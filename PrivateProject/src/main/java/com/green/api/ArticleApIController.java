package com.green.api;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.green.Entity.Article;
import com.green.api.service.ArticleService;
import com.green.dto.ArticleDto;
import com.green.repository.ArticleRepository;

import lombok.extern.slf4j.Slf4j;
@RestController
@Slf4j
public class ArticleApIController {
  @Autowired
  private ArticleService articleService;
  //GET
  @GetMapping("/api/articles/{id}")
  public Article show(@PathVariable Long id){
	  return articleService.show(id);
  }
  
//private ArticleRepository articleRepository;
// //GET
//  @GetMapping("/api/articles")
// public List<Article> index(){
// return articleRepository.findAll();
//   }
//  
//  //Get
// @GetMapping("/api/articles/{id}")
// public Article show(@PathVariable Long id) {
//	 return articleRepository.findById(id).orElse(null);
// }
//Post
 @PostMapping("/api/articles")
 public ResponseEntity<Article>create(@RequestBody ArticleDto dto) {
 Article created = articleService.create(dto);
	return (created !=null)?
			ResponseEntity.status(HttpStatus.OK).body(created):
				ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
  }
 
 
//Patch
 @PatchMapping("api/articles/{id}")
 public ResponseEntity<Article> update(@PathVariable Long id, @RequestBody ArticleDto dto) {
	 Article updated = articleService.update(id,dto);
	  return (updated != null)?
			  ResponseEntity.status(HttpStatus.OK).body(updated):
				  ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
     }
	 // 4.업데이트 및 정상 응답(200)하기
     //target.patch(article); 
  // Article updated = articleRepository.save(target);
  //  return ResponseEntity.status(HttpStatus.OK).body(updated);
 
// }
     @DeleteMapping("/api/articles/{id}")
     public ResponseEntity<Article> delete(@PathVariable Long id){
     Article deleted = articleService.delete(id);	 
     
        return (deleted !=null) ?
        		ResponseEntity.status(HttpStatus.NO_CONTENT).build():
                ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
}
     @PostMapping("/api/transaction-test")
     public ResponseEntity<List<Article>> transactionTest
     (@RequestBody List<ArticleDto> dtos){
    List<Article> createdList = articleService.createArticles(dtos);
     return (createdList !=null)?
    		ResponseEntity.status(HttpStatus.OK).body(createdList):
            ResponseEntity.status(HttpStatus.BAD_REQUEST).build();     
}
}
	   
	
	   
   


	 
 

