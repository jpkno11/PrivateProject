package com.green.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.green.community.domain.CommunityVo;
import com.green.community.mapper.CommunityMapper;



@RestController
@RequestMapping("/Api")
public class CommentController {
	
	@Autowired
	private CommunityMapper communityMapper;
	
	// RESTful API로 댓글 생성 처리
	// http://localhost:7777/Api/Comment/1/comments
	@PostMapping("/Comment/{ccomu_bno}/commentCreate")
	public List<CommunityVo> commentCreate(
				@PathVariable int ccomu_bno,
				@RequestBody CommunityVo communityVo
			) {
		
		// 댓글 생성
		communityMapper.insertComment(communityVo);
		
	    // 댓글 목록 조회 
		List<CommunityVo> commentList = communityMapper.getCBoardCommentList(communityVo);
		
		return commentList;
	}
	
	@PostMapping("/Comment/{ccomu_bno}/{ccomm_id}/commentLike")
	public ResponseEntity<String> commentLike (
			@PathVariable int ccomm_id,
			@PathVariable int ccomu_bno,
			@RequestBody CommunityVo communityVo)	{
		// 좋아요를 증가시키는 로직
		communityVo.setCcomu_bno(ccomu_bno);
		communityVo.setCcomm_id(ccomm_id);
		communityMapper.incrementLike(communityVo);
		
		
	    // ccomm_id를 사용하여 해당 댓글에 대한 좋아요를 추가하거나 업데이트합니다.
		return ResponseEntity.ok("좋아요가 추가되었습니다");
	}
		
}
		
		

