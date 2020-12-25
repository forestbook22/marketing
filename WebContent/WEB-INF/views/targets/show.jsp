<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${target != null}">
                <h2>セグメンテーション　詳細ページ</h2>

                <table id = "show">
                    <tbody>
                        <tr>
                            <th>Name</th>
                            <td><c:out value="${target.user.name}" /></td>
                        </tr>
                        <tr>
                            <th>Title</th>
                            <td><c:out value="${target.title.title}" /></td>
                        </tr>
                        <tr>
                            <th>Created_at</th>
                            <td>
                                <fmt:formatDate value="${target.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>Update_at</th>
                            <td>
                                <fmt:formatDate value="${target.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
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
                       ctx.beginPath();
                       ctx.font = "25px serif";
                       ctx.strokeStyle = "black"
                       //横線
                       ctx.beginPath();
                       ctx.moveTo(300, 0);
                       ctx.lineTo(700, 0);
                       ctx.moveTo(300, 200);
                       ctx.lineTo(700, 200);
                       ctx.moveTo(300, 400);
                       ctx.lineTo(700, 400);
                       ctx.stroke()
                       //縦線
                       ctx.beginPath();
                       ctx.moveTo(300, 0);
                       ctx.lineTo(300, 400);
                       ctx.moveTo(500, 0);
                       ctx.lineTo(500, 400);
                       ctx.moveTo(700, 0);
                       ctx.lineTo(700, 400);
                       ctx.stroke()

                       //第1象限
                       ctx.beginPath();
                       ctx.fillStyle = "#CC99CC"
                       ctx.fillRect(520,20,160, 160);
                       ctx.fill();
                       //第2象限
                       ctx.beginPath();
                       ctx.fillStyle = "#3399CC"
                       ctx.fillRect(320,20, 160, 160);
                       ctx.fill();
                       //第3象限
                       ctx.beginPath();
                       ctx.fillStyle = "#99CC00"
                       ctx.fillRect(320, 220, 160, 160);
                       ctx.fill();
                       //第4象限
                       ctx.beginPath();
                       ctx.fillStyle = "#FF9933"
                       ctx.fillRect(520 ,220, 160, 160);
                       ctx.fill();
                    }
                   </script>
                <c:if test="${sessionScope.login_user.id == target.user.id}">
                    <div id="point">
                    <h2>活用法</h2>
                        <h3><span id = "double"></span></h3>
                        <p></p>
                        <h3><span id = "double"></span></h3>
                        <p></p>
                        <p></p>
                        <h3><span id = "double"></span></h3>
                        <p></p>
                    </div>
                    <p><a href="<c:url value="/targets/edit?id=${target.id}" />">このフレームワークを編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
        <p><a href="<c:url value='/titles/show?id=${target.title.id }' />">一覧に戻る</a></p>
    </c:param>
</c:import>