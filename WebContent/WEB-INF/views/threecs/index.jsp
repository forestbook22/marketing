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
        <table id="threec_list">
            <tbody>
                <tr>
                    <th class="threec_name">Name</th>
                    <th class="threec_date">Date</th>
                    <th class="threec_title">Title</th>
                    <th class="threec_action">Action</th>
                </tr>
                <c:forEach var="threec" items="${threecs}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="threec_name"><c:out value="${threec.user.name}" /></td>
                        <td class="threec_date"><fmt:formatDate value='${threec.threec_date}' pattern='yyyy-MM-dd' /></td>
                        <td class="threec_title">${threec.title}</td>
                        <td class="threec_action"><a href="<c:url value='/threecs/show?id=${threec.id}' />">Detail</a></td>
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
        <p><a href="<c:url value='/threecs/new' />">新規3Cの登録</a></p>

    </c:param>
</c:import>