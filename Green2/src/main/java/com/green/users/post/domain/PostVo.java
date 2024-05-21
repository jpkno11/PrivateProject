package com.green.users.post.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostVo {

	private Long po_num;
	private String com_id;
	private String po_title;
	private String skill;
	private String career;
	private String region;
	private String po_qual;
	private String po_content;
	private String po_image;
	
}
