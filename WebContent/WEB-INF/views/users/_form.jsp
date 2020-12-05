<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>

 <div class="iconUser"></div>
 <label for="name"></label>
 <input id="login" type="text" placeholder="Username" required name="name" value="${name}" />

 <div class="iconPassword"></div>
 <label for="password"></label>
 <input id="login" type="password" placeholder="Password" required name="password" />
 <label for="admin_flag"></label><input type="hidden" name="admin_flag" value=0 />
 <input type="hidden" name="_token" value="${_token}" />
 <button id="login" type="submit">Create</button>
 <h3 id="new"><a href="<c:url value='/login' />">Go Back to Login page</a></h3>
