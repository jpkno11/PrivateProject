package com.green.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// @Data : @NoArgsConstructor + @Setter + @Getter + @ToString
//         + hashCode() + equals()
// @AllArgsConstructor 를 추가하면 기본생성자가 모든인자생성자로 변경된다
//   @NoArgsConstructor 를 추가해야한다
@Data
@NoArgsConstructor
@AllArgsConstructor   
public class UserDto {

	private  String  userid;
	private  String  userpass;
	private  String  username;
	
}





