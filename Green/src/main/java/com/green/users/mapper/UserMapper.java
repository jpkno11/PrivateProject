package com.green.users.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.domain.CompanyVo;
import com.green.users.domain.UserVo;

@Mapper
public interface UserMapper {

	UserVo pLogin(String user_id, String user_pw);

	void insertPUser(UserVo userVo);

	CompanyVo cLogin(String com_id, String com_pw);

	void insertCUser(CompanyVo companyVo);

	UserVo LgetUser(UserVo userVo);

	UserVo Pgetuser(UserVo userVo);



}
