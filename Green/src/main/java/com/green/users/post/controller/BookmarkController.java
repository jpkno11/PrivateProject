package com.green.users.post.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.green.users.post.domain.UserBookVo;
import com.green.users.post.mapper.BookmarkMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class BookmarkController {
	
    @Autowired
    private BookmarkMapper bookmarkMapper;
      
    @GetMapping("/checkUserBook")
    public List<UserBookVo> checkUserBook(
    		@RequestParam(value="user_id") String user_id,
    		@RequestParam(value="po_num") int po_num
    		) {
    	
    	List<UserBookVo> getCheckBook = bookmarkMapper.getUserBook(user_id, po_num);
    	log.info("=========================================================");
    	log.info("getCheckBook : {}", getCheckBook);
    	log.info("=========================================================");
    	
    	int checkUBNO = bookmarkMapper.checkUBNO(user_id, po_num);
    	log.info("=========================================================");
    	log.info("checkUBNO : {}", checkUBNO);
    	log.info("=========================================================");
    	
    	System.out.println("==============================user_id: " + user_id);
    	System.out.println("==============================po_num: " + po_num);
    	
    	return getCheckBook;
        
    }
    
    
    @PostMapping("/addBookmark")
    public List<UserBookVo> addBookmark(
    		@RequestParam("user_id") String user_id,
    		@RequestParam("po_num") int po_num
    		) {
        
    	bookmarkMapper.insertUserbook(user_id, po_num);
        
    	return bookmarkMapper.getUserBook(user_id, po_num);
    }

    @PostMapping("/removeBookmark")
    public List<UserBookVo> removeBookmark(
    		@RequestParam("user_id") String user_id,
    		@RequestParam("po_num") int po_num
    		) {
    	
    	bookmarkMapper.deleteUserbook(user_id, po_num);
        
        return bookmarkMapper.getUserBook(user_id, po_num);
    }
    
    
    

}
