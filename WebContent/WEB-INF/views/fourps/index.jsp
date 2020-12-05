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
        <h2>4P</h2>
        <table id="fourp_list">
            <tbody>
                <tr>
                    <th class="fourp_name">Name</th>
                    <th class="fourp_date">Date</th>
                    <th class="fourp_title">Title</th>
                    <th class="fourp_action">Action</th>
                </tr>
                <c:forEach var="fourp" items="${fourps}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="fourp_name"><c:out value="${fourp.user.name}" /></td>
                        <td class="fourp_date"><fmt:formatDate value='${fourp.fourp_date}' pattern='yyyy-MM-dd' /></td>
                        <td class="fourp_title">${fourp.title}</td>
                        <td class="fourp_action"><a href="<c:url value='/fourps/show?id=${fourp.id}' />">Detail</a></td>
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
                        <a href="<c:url value='/fourps/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/fourps/new' />">新規4Pの登録</a></p>

    </c:param>
</c:import>