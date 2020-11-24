<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>フレームワーク選択</h2>
        <ul>
            <li><a href="<c:url value='/fourps/new' />">4P分析</a></li>
            <li><a href="<c:url value='/swots/new' />">SWOT分析</a></li>
            <li><a href="<c:url value='/threecs/new' />">3C分析</a></li>
        </ul>
    </c:param>
</c:import>