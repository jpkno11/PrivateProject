<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>

<style>

  .table-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 60vh;
  }
  
  .login-table, 
  .login-table tr,
  .login-table tr td {
    width: 28%;
    /* border: 1px solid black; */
  }
  
  .login-table input[type="text"],
  .login-table input[type="password"],
  .login-table a {
    width: 300px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
    margin: 10px 0;
  }

  .login-table a {
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
    text-decoration: none;
  }

  .login-table a:hover {
    background-color: #0056b3;
  }
  
  .login-table td {
    text-align: center; /* 수평 정렬 */
    vertical-align: middle; /* 수직 정렬 */
  }
  
  .login-table tr td:first-child {
    width: 10%;
  }
  
  #firstrow {
    height: 80px;
  }
  
  .login-table button,
  #plogincss {
    width: 100px;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #666;
    color: #fff;
    cursor: pointer;
    text-decoration: none;
  }
  
  #clogincss {
    width: 100px;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: cyan;
    color: #fff;
    cursor: pointer;
    text-decoration: none;
  }
  
</style>

</head>
<body>

    <%@include file="/WEB-INF/views/include/pheader.jsp" %>

	<form action="/Login" method="POST">
		
		<div class="table-container">
		
			<table class="login-table">
			 
			 <tr>
			   <td colspan="2" id="firstrow">
			     <a href="LoginForm" class="btn btn-info">개인용</a>
			     <a href="LoginForm" class="btn btn-info" id="showCompanyLoginForm">기업용</a>
			   </td>
			 </tr>
			 
			  <!-- 기업용 로그인 폼 -->
			  <tr id="companyLoginFormRow1" style="display: none;">
			    <td>아이디</td>
			    <td><input type="text" name="com_id" placeholder="기업용 아이디" /></td>
			  </tr>
			  <tr id="companyLoginFormRow2" style="display: none;">
			    <td>비밀번호</td>
			    <td><input type="password" name="com_pw" placeholder="기업용 비밀번호" /></td>
			 </tr>
			 
			 <!-- 개인용 로그인 폼 -->
			 <tr id="userLoginFormRow1">
			   <td>아이디</td>
			   <td><input type="text" name="user_id" placeholder="개인용 아이디" /></td>
			 </tr>
			 <tr id="userLoginFormRow2">
			   <td>비밀번호</td>
			   <td><input type="password" name="user_pw" placeholder="개인용 비밀번호" /></td>
			 </tr>
			 
			 <!-- 기업용 로그인 버튼 -->
			 <tr id="companyLoginFormRow3" style="display: none;">
			   <td colspan="2">
			    <button type="button" class="btn btn-primary" id="cwriteForm" >회원가입</button>
			    <input type="submit" value="(기업)로그인" id="clogincss" />
			   </td>
			 </tr>

			 <!-- 개인용 로그인 버튼 -->
			 <tr id="userLoginFormRow3">
			   <td colspan="2">
			    <button type="button" class="btn btn-primary" id="pwriteForm" >회원가입</button>
			    <input type="submit" value="(개인)로그인" id="plogincss" />
			   </td>
			 </tr>
			
			</table>
			
		</div>
		
	</form> 

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	
	<script>
	
	  const pwriteFormEl = document.getElementById('pwriteForm');
	  pwriteFormEl.addEventListener( 'click', function() {
		  location.href = '/PWriteForm';
	  })

	  const cwriteFormEl = document.getElementById('cwriteForm');
	  cwriteFormEl.addEventListener( 'click', function() {
		  location.href = '/CWriteForm';
	  })
	  
	  //const cloginFormEl = document.getElementById('clogincss');
	  //cloginFormEl.addEventListener( 'click', function() {
	  //  location.href = '/CLogin';
	  //})
	  
	  //----------------------------------------------------------------------------------------------

	  
	  // '기업용' 링크 클릭 시 기업용 로그인 폼 표시/숨기기
	  document.getElementById('showCompanyLoginForm').addEventListener('click', function(event) {
	    
		// 링크의 기본 동작(페이지 이동)을 막음
		event.preventDefault();
	    var companyLoginFormRow = document.getElementById('companyLoginFormRow1');
	    
		if (companyLoginFormRow1.style.display === 'none') {
			// 로그인 폼 표시
			companyLoginFormRow1.style.display = 'table-row';
			companyLoginFormRow2.style.display = 'table-row';
			companyLoginFormRow3.style.display = 'table-row';
			userLoginFormRow1.style.display = 'none';
			userLoginFormRow2.style.display = 'none';
			userLoginFormRow3.style.display = 'none';
	    } else {
	    	// 로그인 폼 숨김
	        companyLoginFormRow1.style.display = 'none';
	        companyLoginFormRow2.style.display = 'none';
	        companyLoginFormRow3.style.display = 'none';
			userLoginFormRow1.style.display = 'table-row';
			userLoginFormRow2.style.display = 'table-row';
			userLoginFormRow3.style.display = 'table-row';
	    }
			    
	  });
	
	</script>
	
</body>
</html>