package com.green.users.resume.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class ResumeVo {
	
	private int re_num;
	private String user_id;
	private String re_title;
	private String skill;
	private String career;
	private String region;
	private String user_edu;
	private String user_car;
	private String user_intro;
	private String user_img;
	
	private String user_name;
	private String user_brith;
	private String user_adr;
	private String user_tell;
}
