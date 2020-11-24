<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${threec != null}">
                <h2>3C分析　詳細ページ</h2>

                <table>
                    <tbody>
                        <tr>
                            <th>氏名</th>
                            <td><c:out value="${threec.user.name}" /></td>
                        </tr>
                        <tr>
                            <th>日付</th>
                            <td><fmt:formatDate value="${threec.threec_date}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                        <tr>
                            <th>タイトル</th>
                            <td><c:out value="${threec.title}" /></td>
                        </tr>
                        <tr>
                            <th>登録日時</th>
                            <td>
                                <fmt:formatDate value="${threec.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td>
                                <fmt:formatDate value="${threec.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <div id="canvas_wrapper">
                   <canvas id="board" width="1000" height="500"></canvas>
                </div>
                   <script>
                   window.onload=()=>{
                         const board = document.querySelector("#board");
                         const ctx = board.getContext("2d");
                         ctx.font = "30px serif";
                         ctx.fillStyle="midnightblue";
                         //三角形
                         ctx.beginPath();
                         ctx.moveTo(500, 125);
                         ctx.lineTo(325, 350);
                         ctx.moveTo(325, 350);
                         ctx.lineTo(675, 350);
                         ctx.moveTo(675, 350);
                         ctx.lineTo(500, 125);
                         ctx.stroke();
                         //Customer
                         ctx.beginPath();
                         ctx.arc(500, 125, 120, 0, Math.PI * 2, true);
                         ctx.fill();
                         //Company
                         ctx.beginPath();
                         ctx.arc(325, 350, 120, 0, Math.PI * 2, true);
                         ctx.fill();
                         //Competitor
                         ctx.beginPath();
                         ctx.arc(675, 350, 120, 0, Math.PI * 2, true);
                         ctx.fill();
                         //text
                         ctx.fillStyle = "white";
                         ctx.beginPath();
                         ctx.fillText("Customer", 440,75);
                         ctx.fillText("Company", 265, 300);
                         ctx.fillText("Competitor", 600, 300);
                         ctx.fill();
                         ctx.beginPath();
                         ctx.fillText("${threec.cus}", 440, 145, 350);
                         ctx.fillText("${threec.own}", 265, 375, 350);
                         ctx.fillText("${threec.compe}", 600, 375, 350);
                         ctx.fill();
                         }
                   </script>
                <c:if test="${sessionScope.login_user.id == threec.user.id}">
                    <p><a href="<c:url value="/threecs/edit?id=${threec.id}" />">このフレームワークを編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value="/threecs/index" />">一覧に戻る</a></p>
    </c:param>
</c:import>