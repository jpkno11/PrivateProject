package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.domain.CompanyVo;
import com.green.users.domain.UserVo;
import com.green.users.mapper.UserMapper;
import com.green.users.post.domain.PostVo;
import com.green.users.post.mapper.PostMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private PostMapper postMapper;

	//--------------------------------------------------------------------------------------------

	@RequestMapping("/")
	public ModelAndView MainForm() {
			ModelAndView   mv  =  new ModelAndView();
			List<PostVo> postList = postMapper.LmainPostList();
			mv.addObject("postList", postList);
			mv.setViewName("home");
			return mv;
	}
	
	//--------------------------------------------------------------------------------------------
	
	// 로그인 화면
	@RequestMapping("/LoginForm")
	public ModelAndView loginForm() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/login");
		
		return mv;
	}
	
	// 로그인
	@RequestMapping("/Login")
	public ModelAndView login( HttpServletRequest request ) {
		
		String user_id  = request.getParameter("user_id");
		String user_pw  = request.getParameter("user_pw");
		String com_id   = request.getParameter("com_id");
		String com_pw   = request.getParameter("com_pw");
		
		UserVo    UserVo     = userMapper.pLogin( user_id, user_pw );
		CompanyVo companyVo  = userMapper.cLogin( com_id, com_pw );
		
		System.out.println("=======================UserVo" + UserVo);
		System.out.println("=======================companyVo" + companyVo);
		
		String loc          = "";
		HttpSession session = request.getSession();
		
		//아이디 암호가 일치하면
		if(UserVo != null && companyVo == null) {
			
		    session.setAttribute("plogin", UserVo);
		    loc = "redirect:/Users/Uhome";
		    
		} else if(companyVo != null && UserVo == null) {
			
		    session.setAttribute("clogin", companyVo);
		    loc = "redirect:/Company/Chome";
		    
		} else {
			
		    loc = "user/login";
		    
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName(loc);
		
		return mv;
		
	}
	
	//--------------------------------------------------------------------------------------------
	// 개인
		
	// 개인-회원가입 화면
	@RequestMapping("/PWriteForm")
	public ModelAndView pwriteForm() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/pwrite");
		return mv;
		
	}
	
	// 개인-회원가입
	@RequestMapping("/PWrite")
	public ModelAndView pwrite( UserVo userVo ) {
		
		System.out.println( "userVo: " + userVo );
		
		userMapper.insertPUser( userVo );
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/login");
		return mv;
		
	}
	
	//--------------------------------------------------------------------------------------------
	// 기업
	
	// 기업-회원가입 화면
	@RequestMapping("/CWriteForm")
	public ModelAndView cwriteForm() {
			
		ModelAndView mv = new ModelAndView();
		mv.setViewName("company/cwrite");
		return mv;
		
	}
		
	// 기업-회원가입
	@RequestMapping("/CWrite")
	public ModelAndView cwrite( CompanyVo companyVo ) {
			
		System.out.println( "companyVo: " + companyVo );
			
		userMapper.insertCUser( companyVo );
			
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/login");
		return mv;
			
	}
	//logout
	@RequestMapping("/Logout")
	public   String   logout(  HttpSession  session    ) {
		session.invalidate();
		return  "user/login";
	}

	 //CS
	@RequestMapping("/Cs")
	public ModelAndView cs() {
	   ModelAndView mv = new ModelAndView();	
		mv.setViewName("user/cs");
		return mv;
	}	 
	
   }

	











