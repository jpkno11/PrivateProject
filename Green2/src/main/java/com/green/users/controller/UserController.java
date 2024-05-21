package com.green.users.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.users.apply.domain.ApplyVo;
import com.green.users.apply.mapper.ApplyMapper;
import com.green.users.domain.UserVo;
import com.green.users.mapper.UserMapper;
import com.green.users.post.domain.PostVo;
import com.green.users.post.mapper.PostMapper;
import com.green.users.resume.domain.ResumeVo;
import com.green.users.resume.mapper.ResumeMapper;

@Controller
@RequestMapping("/Users")
public class UserController {

	@Autowired
	private ResumeMapper resumeMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private ApplyMapper applyMapper;
	@Autowired
	private PostMapper postMapper;
	
	@RequestMapping("/Uhome")
	public   ModelAndView   uhome() {		
		ModelAndView   mv  =  new ModelAndView();
		List<PostVo> postList = postMapper.LuserMainPostList();
		mv.addObject("postList", postList);
		mv.setViewName("user/phome");
		return mv;
	}
	
	@RequestMapping("/Info")
	   public  ModelAndView  Info(UserVo userVo) {
		UserVo vo = userMapper.Pgetuser( userVo );
		ModelAndView   mv  =  new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("user/info");
		return         mv;
	   }

	
	@RequestMapping("/ResumeForm")
	public  ModelAndView  ResumeForm ( ResumeVo resumeVo  ) {
		List<ResumeVo> resumeList = resumeMapper.LgetResumeList( resumeVo );
		ModelAndView   mv   =  new  ModelAndView();
		mv.addObject("resumeList", resumeList);
		mv.setViewName("user/resumeForm");
		return mv;
	}
	@RequestMapping("/ResumeMake")
	public  ModelAndView  SaveResumeForm ( UserVo userVo  ) {
		
		UserVo vo  =  userMapper.LgetUser( userVo );
		ModelAndView   mv   =  new  ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("user/resumeMake");
		return mv;
	}
	@RequestMapping("/SaveResume")
	public  ModelAndView  saveResume ( ResumeVo resumeVo ) {
		
		resumeMapper.LinsertResume( resumeVo );
		
		String user_id = resumeVo.getUser_id();
		
		ModelAndView   mv   =  new  ModelAndView();
		mv.setViewName("redirect:/Users/ResumeForm?user_id="+ user_id);
		return mv;
	}
	
	
	@RequestMapping("/ApplyList")
	public  ModelAndView  supportList(PostVo postVo, ApplyVo applyVo){
	         List<ApplyVo> applyList = applyMapper.getApplyList( applyVo );
	         ModelAndView   mv   =  new  ModelAndView();
	         mv.addObject("applyList", applyList);
	         mv.setViewName("user/supportList");
	         return mv;
	 }

		
//		String user_id = userVo.getUser_id();
//		
//		System.out.println("================");
//		System.out.println(user_id);
//		System.out.println("================");
//        // 유저정보 가지고 오기
//		//userVo = userApplyListMapper.getInfo(user_id) ;
//        
//        // 유저가 지원한 공고 정보 가져오기
//        List<HashMap<String, Object>>  map = userApplyListMapper.getApplyList(userVo, applyVo);
//        //map = userApplyListMapper.getApplyList(userVo, ApplyVo);
//  
//		ModelAndView   mv  =  new ModelAndView();
//		
//		if(userVo !=null) {
//		mv.addObject("userVo", userVo);
//		mv.addObject("applyVo", applyVo);
//		mv.addObject("map", map);
//	    mv.addObject("user_id",  user_id );
//		} else {
//			System.out.println("아이디 없음");
//		}
//		
//		mv.setViewName("user/supportList");
//		return         mv;

}
