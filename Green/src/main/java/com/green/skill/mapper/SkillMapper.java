package com.green.skill.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.green.skill.domain.SkillVo;

@Mapper
public interface SkillMapper {

	SkillVo Lgetskill(SkillVo skillVo);



}
