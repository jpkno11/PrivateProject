package com.green.users.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.domain.CompanyVo;
import com.green.users.post.domain.PostVo;

@Mapper
public interface PostMapper {

	List<PostVo> LmainPostList();

	List<PostVo> LuserMainPostList();

	void LinsertComPost(PostVo postVo);

	List<PostVo> LComPostList(PostVo postVo);

	void LPostDelete(PostVo postVo);

	PostVo LgetPost(PostVo postVo);

	void LPostUpdate(PostVo postVo);

	List<PostVo> getFilteredPosts(PostVo postVo);

	List<PostVo> KgetPostList(PostVo postVo, CompanyVo companyVo);

	List<PostVo> KgetView(PostVo postVo, CompanyVo companyVo, int po_num);

	List<PostVo> LgetPostList(PostVo postVo);

	List<PostVo> GetPosts1(PostVo postVo);

	List<PostVo> LgetpagePostList();

	List<PostVo> getpostbookList(PostVo postVo, String user_id, CompanyVo companyVo);

	List<PostVo> LComPostView(PostVo postVo);








}
