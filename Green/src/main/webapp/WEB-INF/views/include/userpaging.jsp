<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="startnum" value="${response.pagination.startPage}" /> 
<c:set var="endnum" value="${response.pagination.endPage}" /> 
<c:set var="totalpagecount" value="${response.pagination.totalPageCount}" /> 

<div id="paging" style="margin: 20px 0px; border:0px solid black;">
    <table style="width:100%;height:25px;text-align:center">
        <tr>
            <td style="width:100%;height:25px;text-align:center">
                <!-- First/Previous -->
                    <a href="/BoardPaging/List?user_id=${sessionScope.plogin.user_id}&nowpage=1">⏮</a>
                    <a href="/BoardPaging/List?user_id=${sessionScope.plogin.user_id}&nowpage=${startnum - 1}">⏪</a>
                
                <!-- Page Numbers -->
                <c:forEach var="pagenum" begin="${startnum}" end="${endnum}" step="1">
                    <a href="/BoardPaging/List?user_id=${sessionScope.plogin.user_id}&nowpage=${pagenum}">${pagenum}</a>&nbsp;&nbsp;
                </c:forEach>    

                <!-- Next/Last -->
                    <a href="/BoardPaging/List?user_id=${sessionScope.plogin.user_id}&nowpage=${endnum + 1}">⏩</a>
                    <a href="/BoardPaging/List?user_id=${sessionScope.plogin.user_id}&nowpage=${totalpagecount}">⏭</a>
            </td>
        </tr>
    </table>
</div>
