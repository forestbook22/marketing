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
<label for="swot_date">日付</label><br />
<input type="date" name="swot_date" value="<fmt:formatDate value='${swot.swot_date}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="name">氏名</label><br />
<c:out value="${sessionScope.login_user.name}" />
<br />

<label for="frame"></label><br />
<input type="hidden" name="frame" value="SWOT" />

<label for="title">タイトル</label><br />
<c:out value="${sessionScope.users_title.title}" />
<br /><br />

<label for="strong">Strength:　目標達成にプラスとなる企業内部の特質は？</label><br />
<textarea name="strong" rows="1" cols="50">${swot.strong}</textarea>
<br /><br />

<label for="weak">Weakness:　目標達成の障害となる企業内部の特質は？</label><br />
<textarea name="weak" rows="1" cols="50">${swot.weak}</textarea>
<br /><br />

<label for="opp">Opportunity:　目標達成にプラスとなる外部の特質で市場拡大の可能性や競争優位の可能性は？</label><br />
<textarea name="opp" rows="1" cols="50">${swot.opp}</textarea>
<br /><br />

<label for="thre">Tread:　目標達成の障害となる外部の特質で市場縮小の可能性や競争激化の可能性は？</label><br />
<textarea name="thre" rows="1" cols="50">${swot.thre}</textarea>
<br /><br />

<select name="show_flag">
    <option value="0"<c:if test="${swot.show_flag == 0}"> selected</c:if>>公開</option>
    <option value="1"<c:if test="${swot.show_flag == 1}"> selected</c:if>>非公開</option>
</select>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>