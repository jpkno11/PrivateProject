package com.green.users.post.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserBookVo {

	private int ub_num;
	private int ub_boolean;
	
	private String user_id;
	
	private int po_num;
	private String com_id;
	
}
