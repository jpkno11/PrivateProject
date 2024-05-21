package com.green.users.post.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.domain.CompanyVo;
import com.green.company.mapper.CompanyMapper;
import com.green.users.apply.domain.ApplyVo;
import com.green.users.apply.mapper.ApplyMapper;
import com.green.users.domain.UserVo;
import com.green.users.post.domain.PostVo;
import com.green.users.post.domain.UserBookVo;
import com.green.users.post.mapper.BookmarkMapper;
import com.green.users.post.mapper.PostMapper;
import com.green.users.resume.domain.ResumeVo;
import com.green.users.resume.mapper.ResumeMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PostController {

	@Autowired
	private PostMapper postMapper;
	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private ResumeMapper resumeMapper;
	@Autowired
	private ApplyMapper applyMapper;
	@Autowired
	private BookmarkMapper bookmarkMapper;
	
	// 채용공고 목록 조회
	@RequestMapping("/Post/List")
	public ModelAndView list( PostVo postVo, CompanyVo companyVo ) {
				
        List<PostVo> postList = postMapper.KgetPostList(postVo, companyVo);
        ModelAndView   mv  =  new ModelAndView();
        mv.addObject("postList", postList);
        mv.setViewName("user/postList");
        return mv;
        
	}
	
	@RequestMapping("/Post/View")
	public ModelAndView view(
			@RequestParam(value="po_num") int po_num,
			PostVo postVo,
			UserBookVo userBookVo,
			CompanyVo companyVo,
			HttpServletRequest request,
			@RequestParam(value="user_id") String user_id
			) {
				
		HttpSession session = request.getSession();
		
		//List<PostVo> postList = postMapper.getView(postVo);
		List<PostVo> postList = postMapper.KgetView(postVo, companyVo, po_num);

		List<UserBookVo> getBookList = bookmarkMapper.getUserBook(user_id, po_num);

    	String com_id = postVo.getCom_id();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("postList", postList);
		mv.addObject("po_num", po_num);
		mv.addObject("user_id", user_id);
		mv.addObject("com_id", com_id);
		mv.addObject("getBookList", getBookList);
		mv.setViewName("user/postListGoView2");
		return mv;
		
	}
	@RequestMapping("/Post/CView")
	public ModelAndView cview( PostVo postVo, CompanyVo companyVo ) {
		
		List<PostVo> postList = postMapper.LComPostView(postVo);
		String com_id = postVo.getCom_id();
		ModelAndView mv = new ModelAndView();
		mv.addObject("postList", postList);
		mv.addObject("com_id", com_id);
		mv.setViewName("company/postListGoView");
		return mv;
		
	}
	
	@RequestMapping("/Post/GoApply")
	public ModelAndView goapply(
			HttpServletRequest request,
			ResumeVo resumeVo,
			PostVo postVo,
			ApplyVo applyVo,
			UserVo userVo,
			@RequestParam(value="com_id") String comId,
			@RequestParam(value="po_title") String poTitle,
			@RequestParam(value="po_num") int poNum
			) {
		HttpSession session = request.getSession();
		
		UserVo sessionPUser = (UserVo) session.getAttribute("plogin");
	    if(sessionPUser == null) {
	        return new ModelAndView("redirect:/LoginForm");
	    }
	    String  user_id    = resumeVo.getUser_id();
	    PostVo vo = companyMapper.KgetPost( postVo );
		List<ResumeVo> goresumeList = resumeMapper.KgetResumeList( sessionPUser );
		ModelAndView mv = new ModelAndView();
		mv.addObject("goresumeList", goresumeList);
		mv.addObject("user_id", user_id);
		mv.addObject("com_id", comId);
		mv.addObject("po_title", poTitle);
		mv.addObject("po_num", poNum);
		mv.addObject("vo", vo);
		mv.setViewName( "user/resumeChoice" );
		return mv;
		
	}

	@RequestMapping(value = "/Post/Apply", method=RequestMethod.POST)
	public ModelAndView apply(
			HttpServletRequest request,
			ResumeVo resumeVo,
			PostVo postVo,
			ApplyVo applyVo,
			UserVo userVo,
			@RequestParam(value="po_num") int poNum
			) {
		

		HttpSession session = request.getSession();
		
		UserVo sessionPUser = (UserVo) session.getAttribute("plogin");
	    if(sessionPUser == null) {
	        return new ModelAndView("redirect:/LoginForm");
	    }
	    String  user_id    = resumeVo.getUser_id();
	    int     re_num     = resumeVo.getRe_num();
	    String  re_title   = resumeVo.getRe_title();
	    String  po_title   = postVo.getPo_title();
	    int     result     = applyVo.getResult();
	    
	    postVo.setPo_num(poNum);
	    applyMapper.KinsertResumeApply( applyVo );
	    
	    ModelAndView mv = new ModelAndView();
		mv.addObject("user_id", user_id);
		mv.addObject("applyVo", applyVo);
		mv.addObject("po_num", poNum);
		mv.addObject("re_num", re_num);
		mv.addObject("re_title", re_title);
		mv.addObject("po_title", po_title);
		mv.addObject("result", result);
		mv.setViewName( "user/postSuccess" );
		return mv;
	}
	
	@GetMapping("/Post/Success")
    public ModelAndView success( String user_id ) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Post/List?user_id=" + user_id);
		
        return mv;
        
    }
	
}
	



