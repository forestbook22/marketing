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
        <h2>3C</h2>
        <table id="list">
            <tbody>
                <tr>
                    <th class="name">Name</th>
                    <th class="date">Date</th>
                    <th class="title">Title</th>
                    <th class="action">Action</th>
                </tr>
                <c:forEach var="threec" items="${threecs}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="name"><c:out value="${threec.user.name}" /></td>
                        <td class="date"><fmt:formatDate value='${threec.date}' pattern='yyyy-MM-dd' /></td>
                        <td class="title">${threec.title.title}</td>
                        <td class="action"><a href="<c:url value='/threecs/show?id=${threec.id}' />">詳細を表示</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${threecs_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((threecs_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/threecs/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </c:param>
</c:import>