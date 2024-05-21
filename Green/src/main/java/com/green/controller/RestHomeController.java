package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.green.company.domain.CompanyVo;
import com.green.company.mapper.CompanyMapper;
import com.green.users.domain.UserVo;
import com.green.users.mapper.UserMapper;

@RestController
public class RestHomeController {
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private CompanyMapper companyMapper;
	
	// 유저 중복체크
	@PostMapping("/CheckUserId")
	public List<UserVo> checkuserid(@RequestBody UserVo userVo) {
		List<UserVo> user_id = userMapper.LCheckGetUser_id(userVo);
		return user_id;
	}
	
	// 기업 중복체크
	@PostMapping("/CheckcomId")
	public List<CompanyVo> checkcomid(@RequestBody CompanyVo companyVo) { 
		List<CompanyVo> com_id = companyMapper.LCheckGetCom_id(companyVo);
		return com_id;
	}
}
