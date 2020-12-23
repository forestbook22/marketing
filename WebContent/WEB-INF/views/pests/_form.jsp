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
<input type="date" name="date" value="<fmt:formatDate value='${pest.date}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="name">氏名</label><br />
<c:out value="${sessionScope.login_user.name}" />
<br />

<label for="frame"></label><br />
<input type="hidden" name="frame" value="4P" />

<label for="title">タイトル</label><br />
<c:out value="${sessionScope.users_title.title}" />
<br /><br />

<label for="poli">Politics:　商品・戦略に関係する政治的な制度などの変化は？</label><br />
<textarea name="poli" rows="1" cols="50">${pest.poli}</textarea>
<br /><br />

<label for="eco">Economy:　商品・戦略に関係する経済・金融的変化は？</label><br />
<textarea name="eco" rows="1" cols="50">${pest.eco}</textarea>
<br /><br />

<label for="soci">Society:　商品・戦略に関係する社会や人々の考え方の変化は？</label><br />
<textarea name="soci" rows="1" cols="50">${pest.soci}</textarea>
<br /><br />

<label for="tech">Technology:　商品・戦略に関する技術の変化や最近のトレンドは？</label><br />
<textarea name="tech" rows="1" cols="50">${pest.tech}</textarea>
<br /><br />

<select name="show_flag">
    <option value="0"<c:if test="${pest.show_flag == 0}"> selected</c:if>>公開</option>
    <option value="1"<c:if test="${pest.show_flag == 1}"> selected</c:if>>非公開</option>
</select>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>