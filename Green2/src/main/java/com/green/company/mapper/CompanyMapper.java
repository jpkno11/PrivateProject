package com.green.company.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.domain.CompanyVo;
import com.green.users.domain.UserVo;

@Mapper
public interface CompanyMapper {

	CompanyVo LgetCom(CompanyVo companyVo);

	CompanyVo LgetCompany(CompanyVo companyVo);

}
