package com.green.users.apply.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


public class ApplyVo {
	// apply 
	private Long po_num;
	private int re_numl;
	private String re_title;
	private String po_title;
	private int result;
	private String ap_date;
	
	//  post 
//	private Long po_num;
	private String com_id;
//	private String po_title;
	private String skill;
	private String career;
	private String region;
	private String po_qual;
	private String po_content;
	private String po_image;
	
	// resume
	private Long re_num;
	private String user_id;
//	private String re_title;
//	private String skill;
//	private String career;
//	private String region;
	private String user_edu;
	private String user_car;
	private String user_intro;
	private String user_img;

	// company
//	private String com_id;
	private String com_pw;
	private String com_name;
	private String com_num;
	private String com_boss;
	private String com_adr;
	private String com_tell;
	private String com_date;
	
	// users
//	private String user_id;
	private String user_name;
	private String user_pw;
	private String user_tell;
	private String user_birth;
	private String user_adr;
	private String user_date;
}
