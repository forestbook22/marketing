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
<input type="date" name="date" value="<fmt:formatDate value='${target.date}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="name">氏名</label><br />
<c:out value="${sessionScope.login_user.name}" />
<br />

<label for="frame"></label><br />
<input type="hidden" name="frame" value="Segmentation" />

<label for="title">タイトル</label><br />
<c:out value="${sessionScope.users_title.title}" />
<br /><br />

<table id="target">
    <tbody>
        <tr id = "title">
            <th class="Segmentation">Segmentation</th>
            <th class="real">Realistic Scale</th>
            <th class="rate">Rate of Growth</th>
            <th class="rank">Rank</th>
            <th class="reach">Reach</th>
            <th class="rival">Rival</th>
            <th class="response">Response</th>
        </tr>
        <tr>
            <td class="Segmentation"></td>
            <td class="real">
                <select name="real">
                    <option value="0"<c:if test="${target.real == 0}"> selected</c:if>>×</option>
                    <option value="1"<c:if test="${target.real == 1}"> selected</c:if>>△</option>
                    <option value="2"<c:if test="${target.real == 2}"> selected</c:if>>〇</option>
                    <option value="3"<c:if test="${target.real == 3}"> selected</c:if>>◎</option>
                </select>
            </td>
            <td class="rate">
                <select name="rate">
                    <option value="0"<c:if test="${target.rate == 0}"> selected</c:if>>×</option>
                    <option value="1"<c:if test="${target.rate == 1}"> selected</c:if>>△</option>
                    <option value="2"<c:if test="${target.rate == 2}"> selected</c:if>>〇</option>
                    <option value="3"<c:if test="${target.rate == 3}"> selected</c:if>>◎</option>
                </select>
            </td>
            <td class="rank">
                <select name="rank">
                    <option value="0"<c:if test="${target.rank == 0}"> selected</c:if>>×</option>
                    <option value="1"<c:if test="${target.rank == 1}"> selected</c:if>>△</option>
                    <option value="2"<c:if test="${target.rank == 2}"> selected</c:if>>〇</option>
                    <option value="3"<c:if test="${target.rank == 3}"> selected</c:if>>◎</option>
                </select>
            </td>
            <td class="reach">
                <select name="reach">
                    <option value="0"<c:if test="${target.reach == 0}"> selected</c:if>>×</option>
                    <option value="1"<c:if test="${target.reach == 1}"> selected</c:if>>△</option>
                    <option value="2"<c:if test="${target.reach == 2}"> selected</c:if>>〇</option>
                    <option value="3"<c:if test="${target.reach == 3}"> selected</c:if>>◎</option>
                </select>
            </td>
            <td class="rival">
                <select name="rival">
                    <option value="0"<c:if test="${target.rival == 0}"> selected</c:if>>×</option>
                    <option value="1"<c:if test="${target.rival == 1}"> selected</c:if>>△</option>
                    <option value="2"<c:if test="${target.rival == 2}"> selected</c:if>>〇</option>
                    <option value="3"<c:if test="${target.rival == 3}"> selected</c:if>>◎</option>
                </select>
            </td>
            <td class="response">
            <select name="response">
                <option value="0"<c:if test="${target.response == 0}"> selected</c:if>>×</option>
                <option value="1"<c:if test="${target.response == 1}"> selected</c:if>>△</option>
                <option value="2"<c:if test="${target.response == 2}"> selected</c:if>>〇</option>
                <option value="3"<c:if test="${target.response == 3}"> selected</c:if>>◎</option>
            </select>
            </td>
        </tr>
    </tbody>
</table>
<br /><br />

<select name="show_flag">
    <option value="0"<c:if test="${target.show_flag == 0}"> selected</c:if>>公開</option>
    <option value="1"<c:if test="${target.show_flag == 1}"> selected</c:if>>非公開</option>
</select>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>