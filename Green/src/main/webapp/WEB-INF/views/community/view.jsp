<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <link rel="icon" type="image/x-icon" href="/img/favicon.ico"> -->
<link href="/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet"  />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script src="/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>

<style>
   input:not(input[type=submit]) { width:100%; }
   input[type=submit] { width : 100px; }
   #goList  { width : 80px; }
   main {
   	height: 150vh;
   }
   
   td { 
      padding:10px;
      width: 700px;
      text-align: center;
   }
   td:nth-of-type(1) {
      width : 200px;
   }
   
   td:not([colspan]):first-child {
      background: black;
      color : white;
      font-weight: bold;
   }
   
   input[readonly] {
      background: #EEE;
   } 
   
   #table {
      width: 800px;    
      margin-bottom: 20px; 
      
     td {
      text-align :center;
      padding :10px;
      
      &:nth-of-type(1) { 
          width : 150px; 
          background-color : black;
          color            : white; 
      }
      &:nth-of-type(2) { width : 250px;  }
      &:nth-of-type(3) { 
          width : 150px; 
          background-color : black;
          color            : white;
      }
      &:nth-of-type(4) { width : 250px;  }    
     }
     
    tr:nth-of-type(3) td:nth-of-type(2) {
    	text-align: left;	
    }
    tr:nth-of-type(4) td[colspan] {
           height : 250px;
           width  : 600px;   
           text-align: left;
           vertical-align: baseline;
    }
    tr:last-child td {
           background-color : white;
           color            : black;   
    }
   }
   
      
   textarea  {
      height: 150px;
      width : 100%;
   }
   
   #comments {
   	
   }
   .thumb-icon {
   	font-size: 10px;
   }

</style>
</head>
<body>
  <main>
    
    <%@include file="/WEB-INF/views/include/pheader.jsp" %>
  
	<h2>게시글 내용 조회</h2>
   <table id="table">
    <tr>
      <td>글번호</td>
      <td>${ vo.ccomu_bno }</td>
      <td>조회수</td>
      <td>${ vo.ccomu_hit }</td>      
    </tr>
    <tr>
      <td>작성자</td>
      <td>${ vo.com_id }</td>
      <td>작성일</td>
      <td>${ vo.ccomu_date }</td>
    </tr>
    <tr>
      <td>제목</td>
      <td colspan="3">${ vo.ccomu_title }</td>   
    </tr>
    <tr>
      <td>내용</td>
      <td colspan="3">${ vo.ccomu_content }</td>
    </tr>
       
    <tr>
      <td colspan="4">
       <a class = "btn btn-primary btn-sm" 
          href  = "/Community/WriteForm?com_id=${ sessionScope.clogin.com_id}">새 글 추가</a>&nbsp;&nbsp;
       
<!--        <a class = "btn btn-warning btn-sm"  -->
<%--           href  = "/Board/UpdateForm?bno=${ vo.bno }&menu_id=${ vo.menu_id }">수정</a>&nbsp;&nbsp; --%>
       
<!--        <a class = "btn btn-danger btn-sm"  -->
<%--           href  = "/Board/Delete?bno=${ vo.bno }&menu_id=${ vo.menu_id}">삭제</a>&nbsp;&nbsp; --%>
       
<!--        <a class = "btn btn-secondary btn-sm"  -->
<%--           href  = "/Board/List?menu_id=${ vo.menu_id }">목록으로</a>&nbsp;&nbsp; --%>
<!--       	 <a class = "btn btn-info btn-sm"  -->
<!--           href  = "/Comment/">댓글달기</a>&nbsp;&nbsp; -->
       <a class = "btn btn-info btn-sm" 
          href  = "javascript:history.back()">이전으로</a>&nbsp;&nbsp;
      
<!--        <a class = "btn btn-success btn-sm"  -->
<!--           href  = "/">Home</a> -->
      </td>
    </tr>
   </table> 
   
   
   <!-- 댓글 뷰 화면 추가 -->
   <div id="comments">
   		<!-- 댓글 목록 보기 -->
   		<div id="comments-list">
				  <c:forEach items="${commentList}" var="commentList">
				    <div class="card m-2" id="comments-${commentList.ccomu_bno}">   
				      <div class="card-header">
				        ${commentList.com_id}
				        &nbsp;&nbsp;&nbsp; 
				        <!-- Button trigger modal 댓글수정버튼 -->     
				        <button type="button"
				          class="btn btn-sm btn-outline-primary"    
				
				          data-toggle="modal"
				          data-target="#comment-edit-modal"
				
				          data-id="${commentList.ccomm_id}"
				          data-nickname="${commentList.com_id}"
				          data-body="${commentList.ccomm_body}"
				          data-article-id="${commentList.ccomu_bno}"                          
				        
				        >수정</button>
				     
				        <!--댓글 삭제 버튼-->   
				        <button  type="button"
				          class="btn btn-sm btn-outline-danger comment-delete-btn" 
				          >삭제</button> (${commentList.ccomm_id}, ${commentList.ccomu_bno})
				      </div>
				      <div class="card-body" style="display: flex;">
				        <div style="font-size: 20px;">${commentList.ccomm_body}</div>
					      <div class="comment">
							    <img src="thumb-icon.png" class="thumb-icon" data-comment-id="${commentList.ccomm_id}" alt="Thumb Icon">
							    <span style="font-size: 20px;">${commentList.ccomu_good}</span>
							  </div>
				      </div>
				    </div>
				  </c:forEach>
				</div>
   		<!-- 새 댓글 작성하기 -->
				<div class="card m-2" id="comments-new">
				  <div class="card-body">
				    <!-- 댓글 작성 폼 -->
				    <form action="/Comment/{ccomu_bno}/comments" method="POST">
				      <!-- hidden 정보 -->      
				    
				      <input type="hidden" name="ccomu_bno" value="${vo.ccomu_bno}" id="new-comment-id"/>
		    
				      <!-- 닉네임 -->
				      <div class="mb-3">
				        <label class="form-label">아이디</label>
				        <label>
				          <input type="text" class="form-control" 
				           id="new-comment-nickname" value="${ sessionScope.clogin.com_id}" readonly/>
				           
				        </label>
				      </div>
				      <!-- 댓글 본문  -->
				       <div class="mb-3">
				        <label class="form-label">댓글 내용</label>
				        <label>
				          <textarea type="text" class="form-control" rows="3"
				            id="new-comment-body"></textarea>
				        </label>
				        <!-- 전송 버튼-->
				        <button type="button" class="btn btn-primary"
				          id="comment-create-btn" >댓글 작성</button>
				      </div>
				    </form>
				  </div> 
				</div>
   		
   </div>
    
    
   
	
	
  </main>
  <%@include file="/WEB-INF/views/include/footer.jsp"%>
<!--   <script> -->
<!-- //   	const  goListEl  = document.getElementById('goList'); -->
<!-- //   	goListEl.addEventListener('click', function(e) { -->
<!-- //   		location.href = '/Community/ComuHome'; -->
<!-- //   	}) -->
<!--   </script> -->
  <script>
  	const commentCreateBtnEl = document.getElementById('comment-create-btn');
  	commentCreateBtnEl.addEventListener('click', ()=> {
  		let ccomu_bno = parseInt(document.querySelector('#new-comment-id').value); // ccomu_bno 값을 정수로 변환
  		let url = 'http://localhost:7777/Api/Comment/${vo.ccomu_bno}/commentCreate';
	 // js 객체
      const comment = {
          // 새 댓글의 nick name
          com_id   : document.querySelector('#new-comment-nickname').value,
          // 새글의 본문
          ccomm_body       : document.querySelector('#new-comment-body').value,
          // 부모 게시글의 id
          ccomu_bno  : ccomu_bno // 정수로 변환된 ccomu_bno 값 사용
      };
	 
      const params = {
          method  : 'POST',
          headers : {"Content-Type":"application/json" },
          body    : JSON.stringify( comment )   
      };
	 
   	  fetch(url, params)
   	  		.then(response => response.json()) // 응답 데이터를 JSON 으로 변환
   	  		.then(data => {
						if(data) {
								alert("댓글이 등록되었습니다");
								window.location.reload(); // 성공한 경우 페이지 새로고침
						} else {
							  alert("댓글 등록 실패!");
						}
   	  		}) 
      		.catch(error => {
						console.error('댓글 등록 에러:', error);
						alert("댓글 등록 중 오류가 발생했습니다.");      		
      		})
  	});
  	
  	document.addEventListener('DOMContentLoaded', () => {
  	    document.querySelectorAll('.thumb-icon').forEach(thumbIcon => {
  	        thumbIcon.addEventListener('click', function() {
  	            // data-comment-id 속성에서 값을 가져와 정수로 변환
  	            let ccomm_id = parseInt(this.getAttribute('data-comment-id'));
  	            console.log(ccomm_id)
  	            // ccomm_id가 정수로 변환되었는지 확인
//   	            if (isNaN(ccomm_id)) {
//   	                console.error('Invalid comment ID:', this.getAttribute('data-comment-id'));
//   	                return;
//   	            }
  	            
  	            // URL을 생성                     
  	            let url = 'http://localhost:7777/Api/Comment/${vo.ccomu_bno}/' + ccomm_id +'/commentLike';
  	           	
  	            let ccomu_good = 1; // 좋아요 값을 1로 설정
  	            
  	            const params = {
  	                method: 'POST',
  	                headers: { "Content-Type": "application/json" },
  	                body: JSON.stringify({ ccomu_good }) // 좋아요 값을 JSON 형식으로 보냄
  	            };
  	            
  	            // 좋아요를 증가시키는 요청 보내기
  	            fetch(url, params)
  	                .then(response => {
  	                    if (!response.ok) {
  	                        throw new Error('Failed to increment like');
  	                    }
  	                    // 성공적으로 좋아요를 증가시킨 경우
  	                    alert('좋아요가 추가되었습니다.');
  	              			 // 페이지 새로고침
  	                    window.location.reload();
  	                
  	                })
  	                .catch(error => console.error('좋아요 증가 에러: ', error));
  	        });
  	    });
  	});
  </script>
  
</body>
</html>





