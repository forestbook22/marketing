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
<c:choose>
    <c:when test="${choice != null}">
        <label for="date">日付</label><br />
        <input type="date" name="date" value="<fmt:formatDate value='${position.date}' pattern='yyyy-MM-dd' />" />
        <br /><br />

        <label for="name">氏名</label><br />
        <c:out value="${sessionScope.login_user.name}" />
        <br />

        <label for="frame"></label><br />
        <input type="hidden" name="frame" value="Positioning" />

        <label for="title">タイトル</label><br />
        <c:out value="${sessionScope.users_title.title}" />
        <br /><br />

        <label for="attri">特定の製品属性：品質や素材など競合商品と差別化できる要素は？？</label><br />
        <textarea name="attri" rows="4" cols="30">${position.attri}</textarea>
        <br /><br />

        <label for="benefit">提供するベネフィット：顧客のニーズに対して製品が満たす要素は？？</label><br />
        <textarea name="benefit" rows="4" cols="30">${position.benefit}</textarea>
        <br /><br />

        <label for="opp">製品が使用される機会：顧客が製品を使用する場面は？？</label><br />
        <textarea name="opp" rows="4" cols="30">${position.opp}</textarea>
        <br /><br />

        <label for="relation">競合製品との関係：競合製品と自社製品の関係性は？？</label><br />
        <textarea name="relation" rows="4" cols="30">${position.relation}</textarea>
        <br /><br />

        <label for="distance">競合製品と距離：自社製品独自の特性は？？</label><br />
        <textarea name="distance" rows="4" cols="30">${position.distance}</textarea>
        <br /><br />

        <label for="kind">製品の種類：自社の製品が含まれる種類やカテゴリーごとにポジショニングを検討する</label><br />
        <textarea name="kind" rows="4" cols="30">${position.kind}</textarea>
        <br /><br />

        <p>ポジショニングマップの縦・横軸設定</p>
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
        <button type="submit">次へ</button>
    </c:when>
    <c:otherwise>
        <p><a href="<c:url value='/titles/show?id=${sessionScope.users_title.id}' />">Targeting</a>を入力してください</p>
    </c:otherwise>
</c:choose>