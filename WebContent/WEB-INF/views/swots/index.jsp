<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>SWOT　一覧</h2>
        <table id="swot_list">
            <tbody>
                <tr>
                    <th class="swot_name">氏名</th>
                    <th class="swot_date">日付</th>
                    <th class="swot_title">タイトル</th>
                    <th class="swot_action">操作</th>
                </tr>
                <c:forEach var="swot" items="${swots}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <c:choose>
                             <c:when test="${swot.delete_flag == 0 && swot.show_flag == 0}">
                                 <td class="swot_name"><c:out value="${swot.user.name}" /></td>
                                 <td class="swot_date"><fmt:formatDate value='${swot.swot_date}' pattern='yyyy-MM-dd' /></td>
                                 <td class="swot_title">${swot.title}</td>
                                 <td class="swot_action"><a href="<c:url value='/swots/show?id=${swot.id}' />">詳細を表示</a></td>
                             </c:when>
                         </c:choose>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${swots_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((swots_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/swots/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/swots/new' />">新規SWOTの登録</a></p>

    </c:param>
</c:import>