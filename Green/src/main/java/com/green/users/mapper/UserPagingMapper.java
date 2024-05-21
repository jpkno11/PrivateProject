package com.green.users.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.users.post.domain.PostVo;

@Mapper
public interface UserPagingMapper {

	int count(PostVo postVo);

	List<PostVo> LgetPostPagingList(int po_num, String com_name, String title, String qual, int offset, int pageSize);





}
