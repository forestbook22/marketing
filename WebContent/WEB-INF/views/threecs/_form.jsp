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
<input type="date" name="date" value="<fmt:formatDate value='${threec.date}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="name">氏名</label><br />
<c:out value="${sessionScope.login_user.name}" />
<br />

<label for="frame"></label><br />
<input type="hidden" name="frame" value="3C" />

<label for="title">タイトル</label><br />
<c:out value="${sessionScope.users_title.title}" />
<br /><br />

<label for="cus">Customer:　顧客の性別・年齢・価値観・特徴は？</label><br />
<textarea name="cus" rows="1" cols="50">${threec.cus}</textarea>
<br /><br />

<label for="own">Company:　自社にある競合にはできない強みは？</label><br />
<textarea name="own" rows="1" cols="50">${threec.own}</textarea>
<br /><br />

<label for="compe">Competitor:　自社にはない競合の強みは？</label><br />
<textarea name="compe" rows="1" cols="50">${threec.compe}</textarea>
<br /><br />

<select name="show_flag">
    <option value="0"<c:if test="${threec.show_flag == 0}"> selected</c:if>>公開</option>
    <option value="1"<c:if test="${threec.show_flag == 1}"> selected</c:if>>非公開</option>
</select>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>