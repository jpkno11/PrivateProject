package com.green.community.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.community.domain.CommunityVo;

@Mapper
public interface CommunityMapper {

	List<CommunityVo> getCBoardPagingList(CommunityVo communityVo);

	void insertBoard(CommunityVo communityVo);

	CommunityVo getcommunityVo(CommunityVo communityVo);

	void incHit(CommunityVo communityVo);

	List<CommunityVo> getCBoardCommentList(CommunityVo communityVo);

	void insertComment(CommunityVo communityVo);

	void incrementLike(CommunityVo communityVo);

}
