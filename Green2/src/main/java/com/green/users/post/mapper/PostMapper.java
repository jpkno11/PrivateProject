package com.green.users.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.users.post.domain.PostVo;

@Mapper
public interface PostMapper {

	List<PostVo> getPostList(PostVo postVo);

	List<PostVo> LmainPostList();

	List<PostVo> LuserMainPostList();

	void LinsertComPost(PostVo postVo);

	List<PostVo> LComPostList(PostVo postVo);

	void LPostDelete(PostVo postVo);

}
