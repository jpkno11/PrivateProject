package com.green.company.talentList.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.applyed.domain.ApplyedVo;

@Mapper
public interface TalentListMapper {

	List<ApplyedVo> getTalentList();
	
}
