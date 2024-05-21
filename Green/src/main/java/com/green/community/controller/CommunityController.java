 package com.green.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.community.domain.CommunityVo;
import com.green.community.mapper.CommunityMapper;



@Controller
@RequestMapping("/Community")
public class CommunityController {
	
	@Autowired
	private CommunityMapper communityMapper;
	
	@RequestMapping("/ComuHome")
	public ModelAndView comuList(CommunityVo communityVo) {
		
		List<CommunityVo> communityList = communityMapper.getCBoardPagingList(communityVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("communityList",communityList);
		mv.setViewName("community/comuHome");
		return mv;		
	}
	
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(CommunityVo communityVo) {
		
		ModelAndView  mv  = new ModelAndView();
		String com_id = communityVo.getCom_id();
		
		mv.addObject("com_id", com_id);
		mv.setViewName("community/write");
		return mv;	
	}
	
	@RequestMapping("/Write")
	public ModelAndView write(CommunityVo communityVo) {
		
		communityMapper.insertBoard(communityVo);
		
		String com_id = communityVo.getCom_id();
		
		ModelAndView mv = new ModelAndView()	;
		mv.setViewName("redirect:/Community/ComuHome?com_id=" + com_id);
		return mv;
	}
	
	@RequestMapping("/View")
	public ModelAndView view (CommunityVo communityVo) {
		// 게시글 목록 조회
//		List<CommunityVo> communityList = communityMapper.getCBoardPagingList(communityVo);
		

		// 조회수 증가 ( 현재 BNO의 HIT = HIT + 1 )
		communityMapper.incHit( communityVo );
		
		// bno 로 조회한 게시글 정보
		CommunityVo  vo =  communityMapper.getcommunityVo( communityVo );
		
	
		// bno 로 조회한 댓글들 정보
		List<CommunityVo> commentList = communityMapper.getCBoardCommentList(communityVo);
		
		
		// vo.content 안의 \n(엔터) 를 '<br>' 로 변경한다
		String content = vo.getUcomu_content();
		if (content != null ) {
			content  =	content.replace("\n", "<br>");
			vo.setUcomu_content(content);
		}
		
		System.out.println(vo);
		System.out.println(commentList);
		ModelAndView  mv  =  new ModelAndView();
//		mv.addObject("communityList", communityList);
		mv.addObject("vo", vo);
		mv.addObject("commentList", commentList);
		mv.setViewName("community/view");
		
		
		return mv;
	}
	
}
