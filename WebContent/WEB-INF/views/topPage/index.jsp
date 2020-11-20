<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test = "${flush != null}" >
            <div id = "flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>マーケティングチェッカ―へようこそ</h2>
        <h3>【自分の戦略一覧】</h3>
        <p><a href="<c:url value='/select/select.jsp' />">新規戦略の登録</a></p>
    </c:param>
</c:import>