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
                            <th>Name</th>
                            <td><c:out value="${threec.user.name}" /></td>
                        </tr>
                        <tr>
                            <th>Date</th>
                            <td><fmt:formatDate value="${threec.threec_date}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                        <tr>
                            <th>Title</th>
                            <td><c:out value="${threec.title.title}" /></td>
                        </tr>
                        <tr>
                            <th>Created_at</th>
                            <td>
                                <fmt:formatDate value="${threec.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>Updated_at</th>
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
                         ctx.fillText("${threec.cus}", (1000 - ctx.measureText("${threec.cus}").width) / 2, 145, 350);
                         ctx.fillText("${threec.own}", (650 - ctx.measureText("${threec.own}").width) / 2, 375, 350);
                         ctx.fillText("${threec.compe}", (1350 - ctx.measureText("${threec.compe}").width) / 2, 375, 350);
                         ctx.fill();
                         }
                   </script>
                <c:if test="${sessionScope.login_user.id == threec.user.id}">
                    <div id="point">
                        <h2>活用法</h2>
                            <h3><span id = "double">自社が優位になる戦略的な計画を作り出すこと</span></h3>
                            <p>顧客ニーズを見極め、競争の激しいレッドオーシャンを戦略的に避け、自社の強みを活かし成長していくことが可能</p>
                            <h3><span id = "double">他社分析</span></h3>
                            <p>競合企業を分析し、彼らのコアの強み、マーケティング戦略、販売網、企業文化などから自社が優位になる戦略的な計画を作り出すこと</p>
                            <h3><span id = "double">消費者と自社を知る</span></h3>
                            <p>競合・消費者・自社の理解を通じて、成長を支える自社オリジナルの戦術を見つけることができる</p>
                            <p>上記のように4つをクロスして検討していき、より具体的な戦略に落とし込みます</p>
                    </div>
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