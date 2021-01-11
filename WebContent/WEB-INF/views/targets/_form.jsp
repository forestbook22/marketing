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
    <c:when test="${seg != null}">
         <label for="date">日付</label><br />
        <input type="date" name="date" value="<fmt:formatDate value='${target.date}' pattern='yyyy-MM-dd' />" />
        <br /><br />

        <label for="name">氏名</label><br />
        <c:out value="${sessionScope.login_user.name}" />
        <br />

        <label for="frame"></label><br />
        <input type="hidden" name="frame" value="Targeting" />

        <label for="title">タイトル</label><br />
        <c:out value="${sessionScope.users_title.title}" />
        <br /><br />

        <table id="target">
            <tbody>
                <tr id = "title">
                    <th class="Segmentation">Segmentation</th>
                    <th class="real">Realistic Scale<br>(十分な市場規模<br>があるか)</th>
                    <th class="rate">Rate of Growth<br>(これからニーズ<br>が増えそうであるか)</th>
                    <th class="rank">Rank<br>(口コミ波及の発信源<br>となるターゲットか)</th>
                    <th class="reach">Reach<br>(チャネルやメディアを<br>通して到達可能であるか)</th>
                    <th class="rival">Rival<br>(強い競合が<br>存在しないか)</th>
                    <th class="response">Response<br>(アクションに対する<br>反応は測定可能か)</th>
                </tr>
                <tr>
                    <td class="Segmentation">①${seg.one}</td>
                    <td class="real">
                        <select name="real1">
                            <option value="0"<c:if test="${target.real1 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.real1 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.real1 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.real1 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.real1 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="rate">
                        <select name="rate1">
                            <option value="0"<c:if test="${target.rate1 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.rate1 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.rate1 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.rate1 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.rate1 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="rank">
                        <select name="rank1">
                            <option value="0"<c:if test="${target.rank1 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.rank1 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.rank1 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.rank1 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.rank1 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="reach">
                        <select name="reach1">
                            <option value="0"<c:if test="${target.reach1 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.reach1 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.reach1 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.reach1 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.reach1 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="rival">
                        <select name="rival1">
                            <option value="0"<c:if test="${target.rival1 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.rival1 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.rival1 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.rival1 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.rival1 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="response">
                        <select name="response1">
                            <option value="0"<c:if test="${target.response1 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.response1 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.response1 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.response1 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.response1 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="Segmentation">②${seg.two}</td>
                    <td class="real">
                        <select name="real2">
                            <option value="0"<c:if test="${target.real2 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.real2 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.real2 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.real2 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.real2 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="rate">
                        <select name="rate2">
                            <option value="0"<c:if test="${target.rate2 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.rate2 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.rate2 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.rate2 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.rate2 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="rank">
                        <select name="rank2">
                            <option value="0"<c:if test="${target.rank2 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.rank2 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.rank2 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.rank2 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.rank2 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="reach">
                        <select name="reach2">
                            <option value="0"<c:if test="${target.reach2 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.reach2 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.reach2 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.reach2 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.reach2 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="rival">
                        <select name="rival2">
                            <option value="0"<c:if test="${target.rival2 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.rival2 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.rival2 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.rival2 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.rival2 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="response">
                        <select name="response2">
                            <option value="0"<c:if test="${target.response2 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.response2 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.response2 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.response2 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.response2 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="Segmentation">③${seg.three}</td>
                    <td class="real">
                        <select name="real3">
                            <option value="0"<c:if test="${target.real3 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.real3 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.real3 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.real3 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.real3 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="rate">
                        <select name="rate3">
                            <option value="0"<c:if test="${target.rate3 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.rate3 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.rate3 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.rate3 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.rate3 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="rank">
                        <select name="rank3">
                            <option value="0"<c:if test="${target.rank3 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.rank3 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.rank3 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.rank3 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.rank3 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="reach">
                        <select name="reach3">
                            <option value="0"<c:if test="${target.reach3 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.reach3 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.reach3 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.reach3 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.reach3 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="rival">
                        <select name="rival3">
                            <option value="0"<c:if test="${target.rival3 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.rival3 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.rival3 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.rival3 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.rival3 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="response">
                        <select name="response3">
                            <option value="0"<c:if test="${target.response3 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.response3 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.response3 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.response3 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.response3 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="Segmentation">④${seg.four}</td>
                    <td class="real">
                        <select name="real4">
                            <option value="0"<c:if test="${target.real4 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.real4 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.real4 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.real4 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.real4 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="rate">
                        <select name="rate4">
                            <option value="0"<c:if test="${target.rate4 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.rate4 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.rate4 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.rate4 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.rate4 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="rank">
                        <select name="rank4">
                            <option value="0"<c:if test="${target.rank4 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.rank4 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.rank4 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.rank4 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.rank4 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="reach">
                        <select name="reach4">
                            <option value="0"<c:if test="${target.reach4 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.reach4 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.reach4 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.reach4 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.reach4 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="rival">
                        <select name="rival4">
                            <option value="0"<c:if test="${target.rival4 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.rival4 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.rival4 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.rival4 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.rival4 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                    <td class="response">
                        <select name="response4">
                            <option value="0"<c:if test="${target.response4 == 0}"> selected</c:if>></option>
                            <option value="1"<c:if test="${target.response4 == 1}"> selected</c:if>>×</option>
                            <option value="2"<c:if test="${target.response4 == 2}"> selected</c:if>>△</option>
                            <option value="3"<c:if test="${target.response4 == 3}"> selected</c:if>>〇</option>
                            <option value="4"<c:if test="${target.response4 == 4}"> selected</c:if>>◎</option>
                        </select>
                    </td>
                </tr>
            </tbody>
        </table>
        <br /><br />

        以上の結果から、
        <select name="choice">
            <option value="0"<c:if test="${target.choice == 0}"> selected</c:if>></option>
            <option value="1"<c:if test="${target.choice == 1}"> selected</c:if>>${seg.one}</option>
            <option value="2"<c:if test="${target.choice == 2}"> selected</c:if>>${seg.two}</option>
            <option value="3"<c:if test="${target.choice == 3}"> selected</c:if>>${seg.three}</option>
            <option value="4"<c:if test="${target.choice == 4}"> selected</c:if>>${seg.four}</option>
        </select>
        をターゲットとして選択
        <br /><br />

        <select name="show_flag">
            <option value="0"<c:if test="${target.show_flag == 0}"> selected</c:if>>公開</option>
            <option value="1"<c:if test="${target.show_flag == 1}"> selected</c:if>>非公開</option>
        </select>
        <br /><br />

        <input type="hidden" name="_token" value="${_token}" />
        <button type="submit">登録</button>
    </c:when>
    <c:otherwise>
        <p><a href="<c:url value='/titles/show?id=${sessionScope.users_title.id}' />">Segmentation</a>を入力してください</p>
    </c:otherwise>
</c:choose>