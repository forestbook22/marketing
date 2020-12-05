<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <fieldset>
            <h1 id="login">Create New Account</h1>
            <form id="login" method="POST" action="<c:url value='/users/create' />">
                <c:import url="_form.jsp" />
            </form>
        </fieldset>
    </c:param>
</c:import>