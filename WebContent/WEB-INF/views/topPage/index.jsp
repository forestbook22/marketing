<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test = "${flush != null}" >
            <div id = "flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>マーケティングチェッカ―へようこそ</h2>
        <h3>【自分の戦略一覧】</h3>
                <table id="strategy_list">
            <tbody>
                <tr>
                    <th class="strategy_name">氏名</th>
                    <th class="strategy_date">日付</th>
                    <th class="strategy_frame">フレームワーク</th>
                    <th class="strategy_title">タイトル</th>
                    <th class="strategy_action">操作</th>
                </tr>
                <c:forEach var="fourp" items="${fourps}" varStatus="status">
                    <tr class="row${status.count % 2}">
                       <c:choose>
                             <c:when test="${fourp.delete_flag == 0}">
                                 <td class="fourp_name"><c:out value="${fourp.user.name}" /></td>
                                 <td class="fourp_date"><fmt:formatDate value='${fourp.fourp_date}' pattern='yyyy-MM-dd' /></td>
                                 <td class="fourp_frame">${fourp.frame}</td>
                                 <td class="fourp_title">${fourp.title}</td>
                                 <td class="fourp_action"><a href="<c:url value='/fourps/show?id=${fourp.id}' />">詳細を表示</a></td>
                             </c:when>
                         </c:choose>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${fourps_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((fourps_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <h3><a href="<c:url value='/select' />">新規フレームワーク登録</a></h3>
    </c:param>
</c:import>