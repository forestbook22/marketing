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
<input type="date" name="date" value="<fmt:formatDate value='${seg.date}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="name">氏名</label><br />
<c:out value="${sessionScope.login_user.name}" />
<br />

<label for="frame"></label><br />
<input type="hidden" name="frame" value="Segmentation" />

<label for="title">タイトル</label><br />
<c:out value="${sessionScope.users_title.title}" />
<br /><br />

<img src = "../picture/seg.png"/><br />
<p>STEP1:ニーズの違いが明確に分かれそうな変数を上から2つ選び、軸を選定</p>
変数は
<select name="y">
    <option value="0"<c:if test="${seg.y == 0}"> selected</c:if>>地方</option>
    <option value="1"<c:if test="${seg.y == 1}"> selected</c:if>>気候</option>
    <option value="2"<c:if test="${seg.y == 2}"> selected</c:if>>人口密度</option>
    <option value="3"<c:if test="${seg.y == 3}"> selected</c:if>>年齢</option>
    <option value="4"<c:if test="${seg.y == 4}"> selected</c:if>>性別</option>
    <option value="5"<c:if test="${seg.y == 5}"> selected</c:if>>家族構成</option>
    <option value="6"<c:if test="${seg.y == 6}"> selected</c:if>>所得</option>
    <option value="7"<c:if test="${seg.y == 7}"> selected</c:if>>職業</option>
    <option value="8"<c:if test="${seg.y == 8}"> selected</c:if>>ライフスタイル</option>
    <option value="9"<c:if test="${seg.y == 9}"> selected</c:if>>パーソナリティ</option>
    <option value="10"<c:if test="${seg.y == 10}"> selected</c:if>>使用率</option>
    <option value="11"<c:if test="${seg.y == 11}"> selected</c:if>>ベネフィット</option>
</select>
で、セグメンテーションは①<input type="text" name="y1" value="${seg.y1}" />
と②<input type="text" name="y2" value="${seg.y2}" />
<br /><br />

変数は
<select name="x">
    <option value="0"<c:if test="${seg.x == 0}"> selected</c:if>>地方</option>
    <option value="1"<c:if test="${seg.x == 1}"> selected</c:if>>気候</option>
    <option value="2"<c:if test="${seg.x == 2}"> selected</c:if>>人口密度</option>
    <option value="3"<c:if test="${seg.x == 3}"> selected</c:if>>年齢</option>
    <option value="4"<c:if test="${seg.x == 4}"> selected</c:if>>性別</option>
    <option value="5"<c:if test="${seg.x == 5}"> selected</c:if>>家族構成</option>
    <option value="6"<c:if test="${seg.x == 6}"> selected</c:if>>所得</option>
    <option value="7"<c:if test="${seg.x == 7}"> selected</c:if>>職業</option>
    <option value="8"<c:if test="${seg.x == 8}"> selected</c:if>>ライフスタイル</option>
    <option value="9"<c:if test="${seg.x == 9}"> selected</c:if>>パーソナリティ</option>
    <option value="10"<c:if test="${seg.x == 10}"> selected</c:if>>使用率</option>
    <option value="11"<c:if test="${seg.x == 11}"> selected</c:if>>ベネフィット</option>
</select>
で、セグメンテーションは③<input type="text" name="x1" value="${seg.x1}" />
と④<input type="text" name="x2" value="${seg.x2}" />
<br /><br />
<p>STEP2:選んだセグメンテーションで4象限を作る</p>
<label for="one">第1象限:　①と④の特徴を持つ人に名前を付けるとしたら？？</label><br />
<textarea name="one" rows="1" cols="50">${seg.one}</textarea>
<br /><br />

<label for="two">第2象限:　①と③の特徴を持つ人に名前を付けるとしたら？？</label><br />
<textarea name="two" rows="1" cols="50">${seg.two}</textarea>
<br /><br />

<label for="three">第3象限:　②と③の特徴を持つ人に名前を付けるとしたら？？</label><br />
<textarea name="three" rows="1" cols="50">${seg.three}</textarea>
<br /><br />

<label for="four">第4象限:　②と④の特徴を持つ人に名前を付けるとしたら？？</label><br />
<textarea name="four" rows="1" cols="50">${seg.four}</textarea>
<br /><br />

<select name="show_flag">
    <option value="0"<c:if test="${seg.show_flag == 0}"> selected</c:if>>公開</option>
    <option value="1"<c:if test="${seg.show_flag == 1}"> selected</c:if>>非公開</option>
</select>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>