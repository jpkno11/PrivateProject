package com.green.users.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.users.domain.Pagination;
import com.green.users.domain.PagingResponse;
import com.green.users.domain.SearchVo;
import com.green.users.mapper.UserPagingMapper;
import com.green.users.post.domain.PostVo;
import com.green.users.post.mapper.PostMapper;
import java.util.Collections;

@Controller
@RequestMapping("/BoardPaging")
public class UserPagingController {
	
	@Autowired
	private   PostMapper postMapper;
	
	@Autowired
	private  UserPagingMapper   userPagingMapper;
	
	@RequestMapping("/List")
	public   ModelAndView   list(int nowpage, PostVo  postVo) {
		List<PostVo>  postList   =  postMapper.LgetpagePostList();
        int count = userPagingMapper.count( postVo );
        PagingResponse<PostVo> response = null;
        if (count < 1) {
        	response =  new PagingResponse<>(Collections.emptyList(), null);
        }

        // 페이징을 위한 초기설정값
        SearchVo    searchVo   =  new SearchVo();
        searchVo.setPage(nowpage);
        searchVo.setPageSize(5); // 기본10개 -> 20개
        searchVo.setRecordSize(5);
        // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
        Pagination pagination = new Pagination(count, searchVo);
        searchVo.setPagination(pagination);
        
        int         po_num   =  postVo.getPo_num();
        String      com_name   =  postVo.getCom_name();
        String      title     =  postVo.getPo_title();
        String      Qual    =  postVo.getPo_qual();        
        int         offset    =  searchVo.getOffset();
        int         pageSize  =  searchVo.getPageSize();

        // 계산된 페이지 정보의 일부(limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 반환
        List<PostVo> list = userPagingMapper.LgetPostPagingList(
        		po_num, com_name, title, Qual, offset, pageSize);
        response =  new PagingResponse<>(list, pagination);
		ModelAndView  mv         =  new ModelAndView();
		
		mv.addObject("postList",   postList ); // pagingmenus.jsp
		mv.addObject("nowpage",    nowpage );  // pagingmenus.jsp, list.jsp
		
		mv.addObject("po_num",    po_num );   // list.jsp
		mv.addObject("response",   response );  // list.jsp 
		mv.addObject("searchVo",   searchVo );  // list.jsp
		mv.setViewName("user/postList");
		return   mv;
		
	}
	@RequestMapping("/CList")
	public   ModelAndView   clist(int nowpage, PostVo  postVo) {
		List<PostVo>  postList   =  postMapper.LgetpagePostList();
        int count = userPagingMapper.count( postVo );
        PagingResponse<PostVo> response = null;
        if (count < 1) {
        	response =  new PagingResponse<>(Collections.emptyList(), null);
        }

        // 페이징을 위한 초기설정값
        SearchVo    searchVo   =  new SearchVo();
        searchVo.setPage(nowpage);
        searchVo.setPageSize(5); // 기본10개 -> 20개
        searchVo.setRecordSize(5);
        // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
        Pagination pagination = new Pagination(count, searchVo);
        searchVo.setPagination(pagination);
        
        int         po_num   =  postVo.getPo_num();
        String      com_name   =  postVo.getCom_name();
        String      title     =  postVo.getPo_title();
        String      Qual    =  postVo.getPo_qual();        
        int         offset    =  searchVo.getOffset();
        int         pageSize  =  searchVo.getPageSize();

        // 계산된 페이지 정보의 일부(limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 반환
        List<PostVo> list = userPagingMapper.LgetPostPagingList(
        		po_num, com_name, title, Qual, offset, pageSize);
        response =  new PagingResponse<>(list, pagination);
		ModelAndView  mv         =  new ModelAndView();
		
		mv.addObject("postList",   postList ); // pagingmenus.jsp
		mv.addObject("nowpage",    nowpage );  // pagingmenus.jsp, list.jsp
		mv.addObject("po_num",    po_num );   // list.jsp
		mv.addObject("response",   response );  // list.jsp 
		mv.addObject("searchVo",   searchVo );  // list.jsp
		mv.setViewName("company/postList");
		return   mv;
		
	}
}
