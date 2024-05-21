package com.green.users.apply.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.users.apply.domain.ApplyVo;
import com.green.users.domain.UserVo;

@Mapper
public interface ApplyMapper {

	UserVo getInfo(String user_id);

//	List<HashMap<String, Object>> getApplyList(UserVo userVo, ApplyVo applyVo);

	List<ApplyVo> getApplyList(ApplyVo applyVo);

	


}
