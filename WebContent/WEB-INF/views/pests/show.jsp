<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${pest != null}">
                <h2>PEST　詳細ページ</h2>

                <table id = "show">
                    <tbody>
                        <tr>
                            <th>Name</th>
                            <td><c:out value="${pest.user.name}" /></td>
                        </tr>
                        <tr>
                            <th>Date</th>
                            <td><fmt:formatDate value="${pest.date}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                        <tr>
                            <th>Title</th>
                            <td><c:out value="${pest.title.title}" /></td>
                        </tr>
                        <tr>
                            <th>Created_at</th>
                            <td>
                                <fmt:formatDate value="${pest.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>Update_at</th>
                            <td>
                                <fmt:formatDate value="${pest.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
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
                       //Politics
                       ctx.beginPath();
                       ctx.fillStyle = "#CC99CC"
                       ctx.fillRect(0,0,500, 75);
                       ctx.fill();
                       ctx.beginPath();
                       ctx.strokeStyle = "#CC99CC"
                       ctx.strokeRect(0,0,500, 250);
                       ctx.stroke();
                       //Economy
                       ctx.beginPath();
                       ctx.fillStyle = "#3399CC"
                       ctx.fillRect(500,0, 500, 75);
                       ctx.fill();
                       ctx.beginPath();
                       ctx.strokeStyle = "#3399CC"
                       ctx.strokeRect(500,0,500, 250);
                       ctx.stroke();
                       //Society
                       ctx.beginPath();
                       ctx.fillStyle = "#99CC00"
                       ctx.fillRect(500, 250, 500, 75);
                       ctx.fill();
                       ctx.beginPath();
                       ctx.strokeStyle = "#99CC00"
                       ctx.strokeRect(500, 250, 500, 250);
                       ctx.stroke();
                       //Technology
                       ctx.beginPath();
                       ctx.fillStyle = "#FF9933"
                       ctx.fillRect(0,250, 500, 75);
                       ctx.fill();
                       ctx.beginPath();
                       ctx.strokeStyle = "#FF9933"
                       ctx.strokeRect(0,250,500, 250);
                       ctx.stroke();
                       //文字
                       ctx.beginPath();
                       ctx.font = "bold 35px 'sans-serif'";
                       ctx.fillStyle="white";
                       ctx.fillText("Politics", 150, 50);
                       ctx.fillText("Economy", 640, 50);
                       ctx.fillText("Society", 650, 300);
                       ctx.fillText("Technology", 120, 300);
                       ctx.font = "20px 'sans-serif'";
                       ctx.fillStyle="white";
                       ctx.fillText("(政治)", 285, 50);
                       ctx.fillText("(経済)", 810, 50);
                       ctx.fillText("(社会)", 790, 300);
                       ctx.fillText("(技術)", 330, 300);
                       ctx.font = "30px 'sans-serif'";
                       ctx.fillStyle="black";
                       ctx.fillText("${pest.poli}", (500 - ctx.measureText( "${pest.poli}" ).width) / 2, 125, 400,150);
                       ctx.fillText("${pest.eco}",  (1500 - ctx.measureText( "${pest.eco}" ).width) / 2, 125, 400,150);
                       ctx.fillText("${pest.soci}" , (1500 - ctx.measureText("${pest.soci}").width) / 2, 375, 400,150);
                       ctx.fillText("${pest.tech}",  (500 - ctx.measureText("${pest.tech}").width) / 2, 375, 400,150);
                       ctx.fill();

                       ctx.beginPath();
                       ctx.strokeStyle = "white"
                       //横線
                       ctx.moveTo(380, 250);
                       ctx.lineTo(620, 250);
                       //縦線
                       ctx.moveTo(500, 130);
                       ctx.lineTo(500, 370);
                       ctx.stroke()
                    }
                   </script>
                <c:if test="${sessionScope.login_user.id == pest.user.id}">
                    <div id="point">
                    <h2>活用法</h2>
                        <h3><span id = "double">仮説施行で中長期視点</span></h3>
                        <p>積極的に概ね3～5年後の世の中のマクロトレンドついて仮説を立て、組織で共有し、3～5年後の世の中に対し、
                        現在取り組むべき戦略を構築しましょう。</p>
                        <h3><span id = "double">マクロ環境トレンド4つの関連性</span></h3>
                        <p>PEST分析では、マクロ環境の様々な事柄が関連し、業界に影響を与えますので、P、E、S、Tの各項目だけでなく、
                        各項目のつながりもみて、今後の業界動向を予測しましょう</p>
                        <h3><span id = "double">「変わったこと」と「変わってないこと」</span></h3>
                        <p>「何が変わったか、また将来変わっていくか」また逆に「何が変わっていないか、
                        将来も変わらなそうか」PEST分析では、このトレンドを見極めましょう。</p>
                        <h3><span id = "double">「一時的トレンド」と「中長期構造変化」</span></h3>
                        <p>目先の一時的なトレンドだけを追っても、事業の成功は望めません。PEST分析では、
                        「一時的なもの=中長期では変化がないもの」と「一時的ではなく、中長期の構造的に変化するもの」
                        をしっかり見極めましょう</p>
                    </div>
                    <p><a href="<c:url value="/pests/edit?id=${pest.id}" />">このフレームワークを編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
         <p><a href="<c:url value='/titles/show?id=${pest.title.id }' />">一覧に戻る</a></p>
    </c:param>
</c:import>