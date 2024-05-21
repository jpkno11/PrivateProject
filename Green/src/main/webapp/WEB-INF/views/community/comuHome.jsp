<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
<link href="/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet"  />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>

<style>
 .select_box {
  display: flex;
  justify-content: center; /* 가로로 중앙 정렬 */
  align-items: center; /* 세로로 중앙 정렬 */
  flex-wrap: wrap; /* 내용이 넘칠 경우 다음 줄로 이동 */
  gap: 10px; /* 자식 요소들 사이의 간격 */
}
  .login-box {
    position: absolute;
    right: 10px;
    top: 10px;
    padding: 10px;
    background-color: #f2f2f2;
    border: 1px solid #ddd;
  }

  .center-boxes {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 20px;
    margin-top: 50px;
  }

  .announcement {
    display: inline-block;
    padding: 20px;
    background-color: #f2f2f2;
    border: 1px solid #ddd;
    text-align: center;
  }
  
 #table {
	  td { 
	    padding     : 10px;
	    text-align  : center; 
	  }
	  
	  td:nth-of-type(1) { width : 100px; }  
	  td:nth-of-type(2) { width : 380px; text-align : center;  }  
	  td:nth-of-type(3) { width : 110px; text-align : right;}  
	  td:nth-of-type(4) { width : 110px; }  
	  td:nth-of-type(5) { width : 100px; }
	  
	  tr:first-child > td { text-align:center; }
	   
	  tr:first-child {
	     background-color: black;
	     color : white;
	     font-weight: bold;
	     /* SCSS 문법에 적용 
	     https://www.jsdelivr.com/package/npm/browser-scss
	      */
	     td {
	        border-color : white;
	     }
	  }
	 
	  tr:nth-child(2) > td {
	     text-align : center;
	  }

</style>
	
</head>
<body>
		<%@include file="/WEB-INF/views/include/cheader.jsp"%>
		
		<h2>게시물 목록</h2>
	  <table id="table" >
	    <tr>
	      <td>번호</td>
	      <td>제목</td>
	      <td>작성자</td>	      
	      <td>작성일</td>	   
	      <td>조회수</td>	   
	    </tr>
	    <tr>
	      <td colspan="5">
	        [<a href="/Community/WriteForm?com_id=${ sessionScope.clogin.com_id}">새 글 추가</a>]
	      </td>
	    </tr>
	    
	    <c:forEach  var="boardList"  items="${ communityList }" >
	    <tr>
	      <td>${ boardList.ccomu_bno   }</td>
	      <td>
<!-- 	       <a href="#={ boardList.ccomu_bno }"> -->
	          <a href="/Community/View?ccomu_bno=${boardList.ccomu_bno}&com_id=${ sessionScope.clogin.com_id}">
	          ${ boardList.ccomu_title       }
	       		</a>
	      </td>	      	      
	      <td>${ boardList.com_id      }</td>	      
	      <td>${ boardList.ccomu_date     }</td>      
	      <td>${ boardList.ccomu_hit    }</td>      
	    </tr>
	    </c:forEach>
	    
	    
	  </table>
		
		
		<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>