<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</head>
<body>
    body {
            background-color: #F2F2F2; /* 연한 회색 배경색 */
        }
 
 
    .footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: gray;
            color: white;
            text-align: center;
            padding: 10px;
        }    


 a {
  
   text-decoration-line: underline;


}
 
 
 
  p{
   
	   align-items: center;  
	  text-align : center;
	  margin-left: auto;
	  margin-right:auto;
	  height: 30px;
	  position: relative;
	  top:5px;
	  font-size: 13px;
	  right: 40px;
  }
  
   
	div.a {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    position: relative; 
	    right:150px;
	  	 top:60px;
		 font-size: 13px;
	}

   div.a ul {
     margin-left: 50px;   
   }
  
   div.b {   
    display: flex;
    align-items: center;
    justify-content: center; 
  	position: relative;
  	left:10px;
    bottom: 27px;
  	font-size:13px; 
  }

  div.b ul {
    margin-left: 50px;
  }
  
      
 div.c{ 
	display: flex;
	justify-content: center;
	position: relative; 
	font-size: 13px;
 }
 
 div.c :after{
	content: "";
	display: block; 
	width: 115px;
	top: 20px;
	
	border-bottom: 2px solid #bcbcbc;
	margin: 20px 0px;
 }

  
.search {
   
  text-align:center; 
  justify-content: center;
  position: relative;
  bottom:70px;
  width: 300px;
  left: 580px;
}

input { 
  width: 100%;
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 10px 12px;
  font-size: 14px;
}

img {
  position : absolute;
  width: 17px;
  top: 10px;
  right: 12px;
  margin: 0;
}


div.va {
   display :flex; 
   justify-content: center;
   margin-right:120px;
   font-size:12px;
    margin-top:50px;
    
}

.item {
   background : #white;
   color:#black;
   margin : 5px;
   padding: 5px;
  
  
}
    
 </style>
 

</head>

<body>


 <%@include file="/WEB-INF/views/include/cheader.jsp" %>


 <p>빠른 검색으로 질문과 답변을 찾아보세요</p>
    
      
 <div class="c" >
   <div style="position: relative; right:50px; top:90px; ">개인회원</div>
   <div style="display: inline-block; position:relative; right: 30px; top:90px;">기업회원</div>
 </div>
 

<div style="display: flex; justify-content: center; font-size: 12px;">
	<div style="position: relative; right: 90px; top:80px;">자주 묻는 질문</div>
	<div style="display: inline-block; position:relative; top:80px; right:40px; ">자주 묻는 질문</div>
</div>

<div class="search">
  <input type="text" >
  <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">

</div>




<div class="va">
   <div class="item">
    <ul>
		<li><a href="" style="color:black; text-decoration:none;">이력서 작성/관리 </a></li>
		<li><a href="" style="color:black; text-decoration:none;">회원정보 수정 </a></li>
		<li><a href="" style="color:black; text-decoration:none;">입사지원 방법 </a></li>
		<li><a href="" style="color:black; text-decoration:none;">채용정보 찾기 </a></li>
	  </ul>
   </div>
   <div class="item">
     <ul>
		<li><a href="" style="color:black; text-decoration:none;">채용공고 등록/관리 </a></li>
		<li><a href="" style="color:black; text-decoration:none;">회원정보 수정 </a></li>
		<li><a href="" style="color:black; text-decoration:none;">구인 회원가입 </a></li>
	  </ul>   
   </div>
</div>

 <%@include file="/WEB-INF/views/include/footer.jsp" %>    


</body>
</html>
