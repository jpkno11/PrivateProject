package com.green.users.controller;

import java.util.List;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.domain.CompanyVo;
import com.green.users.apply.domain.ApplyVo;
import com.green.users.apply.mapper.ApplyMapper;
import com.green.users.domain.UserVo;
import com.green.users.mapper.UserMapper;
import com.green.users.post.domain.PostVo;
import com.green.users.post.domain.UserBookVo;
import com.green.users.post.mapper.PostMapper;
import com.green.users.resume.domain.ResumeVo;
import com.green.users.resume.mapper.ResumeMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Users")
public class UserController {

	@Autowired
	private ResumeMapper resumeMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private PostMapper postMapper;
	@Autowired
	private ApplyMapper applyMapper;
	
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
	public  ModelAndView  resumeMake ( UserVo userVo  ) {
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

	@RequestMapping("/ResumeView")
	public ModelAndView ResumeDetailForm(ResumeVo resumeVo, UserVo userVo) {
		ResumeVo Rvo = resumeMapper.LgetResumes(resumeVo);
		UserVo Uvo = userMapper.LgetUser(userVo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("rvo", Rvo);
		mv.addObject("uvo", Uvo);
		mv.setViewName("user/resumeView");
		return mv;
	}

	@RequestMapping("/UpdateResume")
	public ModelAndView updateResume(ResumeVo resumeVo) {
		resumeMapper.LResumeUpdate(resumeVo);
		ModelAndView mv = new ModelAndView();
		String user_id = resumeVo.getUser_id();
		mv.setViewName("redirect:/Users/ResumeForm?user_id=" + user_id);
		return mv;
	}

	@RequestMapping("/List")
	public ModelAndView list(PostVo postVo) {
		List<PostVo> postList = postMapper.LgetPostList(postVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("postList", postList);
		mv.setViewName("user/postList");
		return mv;
	}

	@RequestMapping("/ReusmeDelete")
	public ModelAndView deleteResume(ResumeVo resumeVo) {
		resumeMapper.LResumeDelete(resumeVo);
		ModelAndView mv = new ModelAndView();
		String user_id = resumeVo.getUser_id();
		mv.setViewName("redirect:/Users/ResumeForm?user_id=" + user_id);
		return mv;
	}

	@RequestMapping("/ApplyList")
	public ModelAndView supportList(PostVo postVo, ApplyVo applyVo) {
		List<ApplyVo> applyList = applyMapper.getApplyList(applyVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("applyList", applyList);
		mv.setViewName("user/supportList");
		return mv;
	}

	@RequestMapping("/Infoedit")
	public ModelAndView InfoEdit(UserVo userVo) {
		UserVo vo = userMapper.Pgetedituser(userVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("user/infoedit");
		return mv;

	}

	@RequestMapping("/InfoUpdate")
	public ModelAndView PupdateInfo(UserVo userVo) {
		userMapper.PupdateInfo(userVo);
		ModelAndView mv = new ModelAndView();
		String user_id = userVo.getUser_id();
		mv.setViewName("redirect:/Users/Info?user_id=" + user_id);
		return mv;
	}

	@RequestMapping("/InfoDelete")
	public ModelAndView InfoDelete(UserVo userVo, HttpServletRequest request) {
		userMapper.PInfoDelete(userVo);
		// 세션무효화
		request.getSession().invalidate();

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/");
		return mv;
	}
    @RequestMapping("/BookmarkList")
    public ModelAndView bookmarkList( UserVo userVo, PostVo postVo, UserBookVo userBookVo, CompanyVo companyVo ) {
    	
    	String user_id = userVo.getUser_id();
    	
    	List<PostVo> postbookList = postMapper.getpostbookList( postVo, user_id, companyVo );
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("postbookList", postbookList);
    	mv.setViewName("user/bookmarkList");
    	return mv;
    	
    }

}
