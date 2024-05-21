package com.green.community.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommunityVo {
	// C_COMMUNITY
	private int ccomu_bno;
	private String ccomu_title;
	private String ccomu_content;
	private String com_id;
	private int ccomu_hit;
	private String ccomu_date;
	
	// C_COMMENTS
//	private int ccomu_bno;
	private int ccomm_id;
	private String ccomm_body;
//	private String com_id;
	private int ccomu_good;
	
	// U_COMMUNITY
	private int ucomu_bno;
	private String ucomu_title;
	private String ucomu_content;
	private String user_id;
	private int ucomu_hit;
	private String ucomu_date;
	
	// U_COMMENTS
//	private int ucomu_bno;
	private int ucomm_id;
	private String ucomm_body;
//	private String user_id;
	private int ucomu_good;
}
