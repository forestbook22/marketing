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
<input type="date" name="date" value="<fmt:formatDate value='${fourp.date}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="name">氏名</label><br />
<c:out value="${sessionScope.login_user.name}" />
<br />

<label for="frame"></label><br />
<input type="hidden" name="frame" value="4P" />

<label for="title">タイトル</label><br />
<c:out value="${sessionScope.users_title.title}" />
<br /><br />

<label for="product">Product:「${choice}」に対し最も売上が見込め、企業の利益の源泉となる商品（品質・デザイン・ブランド名）は？</label><br />
<textarea name="product" rows="4" cols="30">${fourp.product}</textarea>
<br /><br />

<label for="price">Price:競合と比較したときの選択すべき価格帯は？</label><br />
<textarea name="price" rows="4" cols="30">${fourp.price}</textarea>
<br /><br />

<label for="place">Place:「${choice}」に対し最も有効な販売経路・場所は？</label><br />
<textarea name="place" rows="4" cols="30">${fourp.place}</textarea>
<br /><br />

<label for="promotion">Promotion:「${choice}」に認知してもらう最も効果的な方法は？</label><br />
<textarea name="promotion" rows="4" cols="30">${fourp.promotion}</textarea>
<br /><br />

<select name="show_flag">
    <option value="0"<c:if test="${fourp.show_flag == 0}"> selected</c:if>>公開</option>
    <option value="1"<c:if test="${fourp.show_flag == 1}"> selected</c:if>>非公開</option>
</select>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>