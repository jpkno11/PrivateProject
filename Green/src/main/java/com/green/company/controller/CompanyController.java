package com.green.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.applyed.domain.ApplyedVo;
import com.green.company.applyed.mapper.ApplyedMapper;
import com.green.company.domain.CompanyVo;
import com.green.company.mapper.CompanyMapper;

import com.green.company.talentList.mapper.TalentListMapper;
import com.green.users.post.domain.PostVo;
import com.green.users.post.mapper.PostMapper;


@Controller
@RequestMapping("/Company")
public class CompanyController {
	@Autowired
	PostMapper postMapper;
	@Autowired
	CompanyMapper companyMapper;
	@Autowired
	ApplyedMapper applyedMapper;
	@Autowired
	TalentListMapper talentListMapper;
	
	@RequestMapping("/Chome")
	public   ModelAndView   uhome() {		
		ModelAndView   mv  =  new ModelAndView();
		List<PostVo> postList = postMapper.LuserMainPostList();
		mv.addObject("postList", postList);
		mv.setViewName("company/chome");
		return mv;
	}
	
	@RequestMapping("/CInfo")
	   public  ModelAndView  cInfo(CompanyVo companyVo) {
		CompanyVo po = companyMapper.LgetCom( companyVo );
		ModelAndView   mv  =  new ModelAndView();
		mv.addObject("po", po);
		mv.setViewName("company/info");
		return         mv;
	   }
	@RequestMapping("/PostForm")
	public  ModelAndView  PostsForm ( PostVo postVo  ) {
		List<PostVo> postComList = postMapper.LComPostList( postVo );
		ModelAndView   mv   =  new  ModelAndView();
		mv.addObject("postList", postComList);
		mv.setViewName("company/postForm");
		return mv;
	}

	@RequestMapping("/PostMake")
	public  ModelAndView  SavePostForm ( CompanyVo companyVo  ) {
		CompanyVo vo  =  companyMapper.LgetCompany( companyVo );
		ModelAndView   mv   =  new  ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("company/postMake");
		return mv;
	}
	
	@RequestMapping("/SavePost")
	public  ModelAndView  PostMake(PostVo postVo){
		postMapper.LinsertComPost( postVo );		
		ModelAndView   mv   =  new  ModelAndView();
		String com_id = postVo.getCom_id();
		mv.setViewName("redirect:/Company/PostForm?com_id=" + com_id);
		return   mv;
	}
	@RequestMapping("/PostDelete")
	   public  ModelAndView  deleteResume(PostVo postVo){
	      postMapper.LPostDelete( postVo );      
	      ModelAndView   mv   =  new  ModelAndView();
	      String com_id = postVo.getCom_id();
	      mv.setViewName("redirect:/Users/ResumeForm?com_id=" + com_id);
	      return   mv;
	   }
	
	@RequestMapping("/SupportedList")
	public ModelAndView supportedList(ApplyedVo applyedVo) {
		List<ApplyedVo> applyedList = applyedMapper.getApplyedList(applyedVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("applyedList", applyedList);
		mv.setViewName("company/supportedList");
		return mv;
	}
	
	@RequestMapping("/TalentInformation")
	public ModelAndView talentInformation() {
		List<ApplyedVo> talentList = talentListMapper.getTalentList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("talentList",talentList);
		mv.setViewName("company/talentList");
		return mv;
	}

}
