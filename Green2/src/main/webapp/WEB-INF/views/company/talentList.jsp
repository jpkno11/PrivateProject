<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 화면</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   
<style>

  main {
    height: 120vh;
  }
  
  ul {
    list-style-type: none;
  }
  
  .post-top,
  .post-mid,
  .post-third,
  .applybutton {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: auto;
    margin-top: 10px;
  }
  
  .post-top li:first-child {
    border: 1px solid black;
    border-radius: 10px;
    padding: 40px 100px;
  }
  
  .post-mid {
    width: 50%;
  }
  .post-mid tr td {
    border: 1px solid black;
    width: 200px;
    padding: 20px;
  }
  
  .podt-third {
    width: 50%;
  }
  .post-third tr td {
    border: 1px solid black;
    width: 100%;
    padding: 20px;
    height: 200px;
  }
  
  .postTitle {
    border: none;
    outline: none;
    border-radius: 10px;
    padding: 40px 70px;
    width: 400px;
  }
  
</style>

</head>

<body>

   <%@include file="/WEB-INF/views/include/pheader.jsp"%>

   <main>

      <section>

         <article>

<%--             <form action="/Post/GoApply?po_num=${po_num}" method="POST"> --%>
<%--             <input type="hidden" name="po_num" value="${ po_num }" /> --%>
<%--             <input type="hidden" id="user_id" name="user_id" value="${ sessionScope.plogin.user_id }" /> --%>

               <c:forEach var="talentList" items="${talentList}">
                  <div>
                     <ul class="post-top" id="postView">
                        <li data-value="value1"><input type="text"
                           class="postTitle" name="po_title"
                           value="공고 제목: ${talentList.po_title}" /></li>
                        <li data-value="value2"><img src="/img/Rogo.png"
                           alt="회사로고 이미지1"></li>
                     </ul>
                  </div>
               
                     <table class="post-mid">
                        <tr>
                           <td>기술스택</td>
                           <td>지역</td>
                           <td>경력유무</td>
                        </tr>
                        <tr>
                           <td><input type="text" style="border: none;" name="skill"
                              value="${talentList.skill}" /></td>
                           <td><input type="text" style="border: none;" name="region"
                              value="${talentList.region}" /></td>
                           <td><input type="text" style="border: none;" name="career"
                              value="${talentList.career}" /></td>
                        </tr>
                     </table>
                     
                     <table class="post-third">
                        <tr>
                           <td colspan="3"><input type="text" style="border: none;"
                              name="po_content" value="모집조건: ${talentList.po_content}" /></td>
                        </tr>
                        <tr>
                           <td colspan="3"><input type="text" style="border: none;"
                              name="po_qual" value="근무조건: ${talentList.po_qual}" /> <input
                              type="hidden" style="border: none;" name="com_id"
                              value="${talentList.com_id}" /></td>
                        </tr>
                     </table>
                  </c:forEach>

               

               <div class="applybutton" style="display: flex;">
               
                  <input type="submit" class="btn btn-primary" value="지원하기">&nbsp;&nbsp;
                  <a href="/Post/List?user_id=${sessionScope.plogin.user_id}"
                     class="btn btn-primary">목록으로</a>&nbsp;&nbsp;

               </div>
               
               <div>
                  <input class="btn btn-outline-secondary scrap-button" type="button"
                     data-po-num="${ po_num }" data-user-id="${sessionScope.plogin.user_id}" data-ub-boolean="0" value="스크랩 하기" />
               </div>

            </form>

         </article>

      </section>

   </main>

   <%@include file="/WEB-INF/views/include/footer.jsp"%>


</body>
</html>