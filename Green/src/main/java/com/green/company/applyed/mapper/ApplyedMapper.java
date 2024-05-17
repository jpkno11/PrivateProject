package com.green.company.applyed.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.applyed.domain.ApplyedVo;
import com.green.company.domain.CompanyVo;

@Mapper
public interface ApplyedMapper {
	
	CompanyVo LgetCom(String com_id);
	
	List<ApplyedVo> getApplyedList(ApplyedVo applyedVo);
}
