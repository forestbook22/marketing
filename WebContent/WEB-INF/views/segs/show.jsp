<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${seg != null}">
                <h2>セグメンテーション　詳細ページ</h2>

                <table id = "show">
                    <tbody>
                        <tr>
                            <th>Name</th>
                            <td><c:out value="${seg.user.name}" /></td>
                        </tr>
                        <tr>
                            <th>Title</th>
                            <td><c:out value="${seg.title.title}" /></td>
                        </tr>
                        <tr>
                            <th>Created_at</th>
                            <td>
                                <fmt:formatDate value="${seg.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>Update_at</th>
                            <td>
                                <fmt:formatDate value="${seg.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
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
                       var tategaki = function(context, text, x, y) {
                           var textList = text.split('\n');
                           var lineHeight = ctx.measureText("あ").width;
                           textList.forEach(function(elm, i) {
                             Array.prototype.forEach.call(elm, function(ch, j) {
                               ctx.fillText(ch, x-lineHeight*i, y+lineHeight*j);
                             });
                           });
                         };
                       var x = "${seg.x}";
                       if(x == 0){
                           x = "地方"
                       }
                       if(x == 1){
                           x = "気候"
                       }
                       if(x == 2){
                           x = "人口密度"
                       }
                       if(x == 3){
                           x = "年齢"
                       }
                       if(x == 4){
                           x = "性別"
                       }
                       if(x == 5){
                           x = "家族構成"
                       }
                       if(x == 6){
                           x = "所得"
                       }
                       if(x == 7){
                           x = "職業"
                       }
                       if(x = 8){
                           x = "ライフスタイル"
                       }
                       if(x == 9){
                           x = "パーソナリティ"
                       }
                       if(x == 10){
                           x = "使用率"
                       }
                       if(x == 11){
                           x = "ベネフィット"
                       }

                       var y = "${seg.y}";
                       if(y == 0){
                           y = "地方"
                       }
                       if(y == 1){
                           y = "気候"
                       }
                       if(y == 2){
                           y = "人口密度"
                       }
                       if(y == 3){
                           y = "年齢"
                       }
                       if(y == 4){
                           y = "性別"
                       }
                       if(y == 5){
                           y = "家族構成"
                       }
                       if(y == 6){
                           y = "所得"
                       }
                       if(y == 7){
                           y = "職業"
                       }
                       if(y == 8){
                           y = "ライフスタイル"
                       }
                       if(y == 9){
                           y = "パーソナリティ"
                       }
                       if(y == 10){
                           y = "使用率"
                       }
                       if(y == 11){
                           y = "ベネフィット"
                       }
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

                       //中の文字
                       ctx.beginPath();
                       ctx.fillStyle = "white"
                       ctx.fillText("${seg.one}", (1200 - ctx.measureText( "${seg.one}" ).width) / 2, 100, 400,150);
                       ctx.fillText("${seg.two}",  (800 - ctx.measureText( "${seg.two}" ).width) / 2, 100, 400,150);
                       ctx.fillText("${seg.three}",  (800 - ctx.measureText("${seg.three}").width) / 2, 300, 400,150);
                       ctx.fillText("${seg.four}" , (1200 - ctx.measureText("${seg.four}").width) / 2, 300, 400,150);
                       ctx.stroke();

                       //縦軸の文字
                       ctx.beginPath();
                       ctx.fillStyle = "black"
                       ctx.font = "15px serif";
                       tategaki(ctx, y, 220, 170);
                       ctx.font = "20px serif";
                       tategaki(ctx, "${seg.y1}", 250, 80);
                       tategaki(ctx, "${seg.y2}", 250, 300)
                       ctx.stroke();
                       //横軸の文字
                       ctx.beginPath();
                       ctx.fillStyle = "black"
                       ctx.font = "15px serif";
                       ctx.fillText(x, (900 - ctx.measureText( "${seg.x}" ).width) / 2, 480, 400,150);
                       ctx.font = "20px serif";
                       ctx.fillText("${seg.x1}",  (800 - ctx.measureText( "${seg.x1}" ).width) / 2, 450, 400,150);
                       ctx.fillText("${seg.x2}",  (1200 - ctx.measureText("${seg.x2}").width) / 2, 450, 400,150);
                       ctx.stroke();

                    }
                   </script>
                <c:if test="${sessionScope.login_user.id == seg.user.id}">
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
                    <p><a href="<c:url value="/segs/edit?id=${seg.id}" />">このフレームワークを編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
        <p><a href="<c:url value='/titles/show?id=${seg.title.id }' />">一覧に戻る</a></p>
    </c:param>
</c:import>