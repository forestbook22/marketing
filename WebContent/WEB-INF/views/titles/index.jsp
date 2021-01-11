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
        <h2>戦略立案</h2>
        <table id = "title_list">
            <tbody>
                <tr>
                    <th class="title_title">Title</th>
                    <th class="title_action">Action</th>
                </tr>
                <c:forEach var="title" items="${titles}" varStatus="status">
                    <tr>
                        <td><c:out value="${title.title}" /></td>
                        <td><a href="<c:url value='/titles/show?id=${title.id}' />">詳細を表示</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${titles_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((titles_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/titles/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/titles/new' />">新規タイトルの登録</a></p><br/>

    </c:param>
</c:import>