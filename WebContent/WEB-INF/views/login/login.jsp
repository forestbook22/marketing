<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${hasError}">
            <div id="flush_error">
                ユーザーネームかパスワードが間違っています。
            </div>
        </c:if>
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <fieldset>
            <h1 id="login">Login</h1>
            <form id="login" method="POST" action="<c:url value='/login' />">
            <div class="iconUser"></div>
            <label for="name"></label>
            <input id="login" type="text" placeholder="Username" required name="name" value="${name}" />

            <div class="iconPassword"></div>
            <label for="password"></label>
            <input id="login" type="password" placeholder="Password" required name="password" />

            <input type="hidden" name="_token" value="${_token}" />
            <button id="login" type="submit">Enter</button>
            <h3 id="new"><a href="<c:url value='/users/new' />">Create New Account</a></h3>
            </form>
         </fieldset>
    </c:param>
</c:import>