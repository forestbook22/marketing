<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>
    </div>
</c:if>
<label for="date">日付</label><br />
<input type="date" name="date" value="<fmt:formatDate value='${position.date}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="name">氏名</label><br />
<c:out value="${sessionScope.login_user.name}" />
<br />

<label for="frame"></label><br />
<input type="hidden" name="frame" value="4P" />

<label for="title">タイトル</label><br />
<c:out value="${sessionScope.users_title.title}" />
<br /><br />
<p>選択したターゲットである「${choice}」が最も重視する購買決定要因を2つ挙げると？？？</p>
①<input type = text name="x" value = "${position.x}">と
②<input type = text name="y" value = "${position.y}">
<br />

<p>①を2つに細分化すると？</p>
<input type = text name="x1" value = "${position.x1}">と
<input type = text name="x2" value = "${position.x2}">
<br /><br />

<p>②を2つに細分化すると？</p>
<input type = text name="y1" value = "${position.y1}">と
<input type = text name="y2" value = "${position.y2}">
<br /><br />

<select name="show_flag">
    <option value="0"<c:if test="${position.show_flag == 0}"> selected</c:if>>公開</option>
    <option value="1"<c:if test="${position.show_flag == 1}"> selected</c:if>>非公開</option>
</select>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>