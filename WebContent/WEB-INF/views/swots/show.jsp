<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${swot != null}">
                <h2>SWOT　詳細ページ</h2>

                <table>
                    <tbody>
                        <tr>
                            <th>氏名</th>
                            <td><c:out value="${swot.user.name}" /></td>
                        </tr>
                        <tr>
                            <th>日付</th>
                            <td><fmt:formatDate value="${swot.swot_date}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                        <tr>
                            <th>タイトル</th>
                            <td><c:out value="${swot.title}" /></td>
                        </tr>
                        <tr>
                            <th>登録日時</th>
                            <td>
                                <fmt:formatDate value="${swot.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td>
                                <fmt:formatDate value="${swot.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <canvas id="board" width="1000" height="500"></canvas>
                    <script>
                    window.onload=()=>{
                      const board = document.querySelector("#board");
                      const ctx = board.getContext("2d");
                      ctx.beginPath();
                      //横線
                      ctx.moveTo(25, 250);          // 始点
                      ctx.lineTo(975, 250);        // 終点
                      //縦線
                      ctx.moveTo(500, 0);          // 始点
                      ctx.lineTo(500, 500);        // 終点
                      //Strength
                      ctx.font = "30px serif";
                      ctx.fillText("Strength", 50, 50);
                      ctx.strokeRect(55,55,400,150);
                      ctx.fillText("${swot.strong}", 70, 125, 350);
                      //Weakness
                      ctx.font = "30px serif";
                      ctx.fillText("Weakness", 550, 50);
                      ctx.strokeRect(555,55,400,150);
                      ctx.fillText("${swot.weak}", 570, 125, 350);
                      //Opportunity
                      ctx.font = "30px serif";
                      ctx.fillText("Opportunity", 50, 300);
                      ctx.strokeRect(55,305,400,150);
                      ctx.fillText("${swot.opp}", 70, 375, 350);
                      //Thread
                      ctx.font = "30px serif";
                      ctx.fillText("Thread", 550, 300);
                      ctx.strokeRect(555,305,400,150);
                      ctx.fillText("${swot.thre}" ,570, 375, 350);

                      ctx.strokeStyle = "Brack";  // 線の色
                        ctx.lineWidth = 5;           // 線の太さ
                        ctx.stroke();
                      }
                    </script>
                <c:if test="${sessionScope.login_user.id == swot.user.id}">
                    <p><a href="<c:url value="/swots/edit?id=${swot.id}" />">このフレームワークを編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value="/swots/index" />">一覧に戻る</a></p>
    </c:param>
</c:import>