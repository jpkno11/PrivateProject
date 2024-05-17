package com.green.users.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class UserVo {

	private  String user_id;
	private  String user_name;
	private  String user_pw;
	private  String user_tell;
	private  String user_birth;
	private  String user_adr;
	private  String user_date;
}
