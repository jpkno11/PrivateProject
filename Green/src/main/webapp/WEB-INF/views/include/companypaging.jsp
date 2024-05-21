<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
  
  <c:set  var="po_num"            value="${po_num}" /> 
  <c:set  var="startnum"           value="${ searchVo.pagination.startPage         }" /> 
  <c:set  var="endnum"             value="${ searchVo.pagination.endPage           }" /> 
  <c:set  var="totalpagecount"     value="${ searchVo.pagination.totalPageCount  }" /> 
 
  <div id="paging" style="margin: 20px 0px; border:0px solid black;">
    <table style="width:100%;height:25px;text-align:center"  >
     <tr>
       <td style="width:100%;height:25px;text-align:center" >
     
     <!-- 처음/ 이전 -->     
     <c:if test="${ startnum gt 1 }">
       <a href="/BoardPaging/CList?com_id=${ sessionScope.clogin.com_id }&nowpage=1">1--</a>
       <a href="/BoardPaging/CList?com_id=${ sessionScope.clogin.com_id }&nowpage=${ startnum - 1 }">
       1-
       </a>
     </c:if>
     <c:forEach  var="pagenum"  begin="${startnum}"  end="${endnum}"  step="1">
        <a href="/BoardPaging/CList?com_id=${ sessionScope.clogin.com_id }&nowpage=${ pagenum }">
        ${ pagenum }
        </a>&nbsp;&nbsp;     
     </c:forEach>    

     <c:if test="${ totalpagecount ne endnum }">
       <a href="/BoardPaging/CList?com_id=${ sessionScope.clogin.com_id }&nowpage=${ endnum + 1 }">
       -2
       </a>
       <a href="/BoardPaging/CList?com_id=${ sessionScope.clogin.com_id}&nowpage=${ totalpagecount }">--2</a>
     </c:if>    
      </td>
     </tr>    
    </table>   
  </div>
  
  
  