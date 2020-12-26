<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${target != null}">
                <h2>Targeting　詳細ページ</h2>

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
                       var real1 = "${target.real1}";
                       if(real1 == 1){
                           real1 = "×"
                       }
                       if(real1 == 2){
                           real1 = "△"
                       }
                       if(real1 == 3){
                           real1 = "〇"
                       }
                       if(real1 == 4){
                           real1 = "◎"
                       }
                       var real2 = "${target.real2}";
                       if(real2 == 1){
                           real2 = "×"
                       }
                       if(real2 == 2){
                           real2 = "△"
                       }
                       if(real2 == 3){
                           real2 = "〇"
                       }
                       if(real2 == 4){
                           real2 = "◎"
                       }
                       var real3 = "${target.real3}";
                       if(real3 == 1){
                           real3 = "×"
                       }
                       if(real3 == 2){
                           real3 = "△"
                       }
                       if(real3 == 3){
                           real3 = "〇"
                       }
                       if(real3 == 4){
                           real3 = "◎"
                       }
                       var real4 = "${target.real4}";
                       if(real4 == 1){
                           real4 = "×"
                       }
                       if(real4 == 2){
                           real4 = "△"
                       }
                       if(real4 == 3){
                           real4 = "〇"
                       }
                       if(real4 == 4){
                           real4 = "◎"
                       }
                       var rank1 = "${target.rank1}";
                       if(rank1 == 1){
                           rank1 = "×"
                       }
                       if(rank1 == 2){
                           rank1 = "△"
                       }
                       if(rank1 == 3){
                           rank1 = "〇"
                       }
                       if(rank1 == 4){
                           rank1 = "◎"
                       }
                       var rank2 = "${target.rank2}";
                       if(rank2 == 1){
                           rank2 = "×"
                       }
                       if(rank2 == 2){
                           rank2 = "△"
                       }
                       if(rank2 == 3){
                           rank2 = "〇"
                       }
                       if(rank2 == 4){
                           rank2 = "◎"
                       }
                       var rank3 = "${target.rank3}";
                       if(rank3 == 1){
                           rank3 = "×"
                       }
                       if(rank3 == 2){
                           rank3 = "△"
                       }
                       if(rank3 == 3){
                           rank3 = "〇"
                       }
                       if(rank3 == 4){
                           rank3 = "◎"
                       }
                       var rank4 = "${target.rank4}";
                       if(rank4 == 1){
                           rank4 = "×"
                       }
                       if(rank4 == 2){
                           rank4 = "△"
                       }
                       if(rank4 == 3){
                           rank4 = "〇"
                       }
                       if(rank4 == 4){
                           rank4 = "◎"
                       }
                       var rate1 = "${target.rate1}";
                       if(rate1 == 1){
                           rate1 = "×"
                       }
                       if(rate1 == 2){
                           rate1 = "△"
                       }
                       if(rate1 == 3){
                           rate1 = "〇"
                       }
                       if(rate1 == 4){
                           rate1 = "◎"
                       }
                       var rate2 = "${target.rate2}";
                       if(rate2 == 1){
                           rate2 = "×"
                       }
                       if(rate2 == 2){
                           rate2 = "△"
                       }
                       if(rate2 == 3){
                           rate2 = "〇"
                       }
                       if(rate2 == 4){
                           rate2 = "◎"
                       }
                       var rate3 = "${target.rate3}";
                       if(rate3 == 1){
                           rate3 = "×"
                       }
                       if(rate3 == 2){
                           rate3 = "△"
                       }
                       if(rate3 == 3){
                           rate3 = "〇"
                       }
                       if(rate3 == 4){
                           rate3 = "◎"
                       }
                       var rate4 = "${target.rate4}";
                       if(rate4 == 1){
                           rate4 = "×"
                       }
                       if(rate4 == 2){
                           rate4 = "△"
                       }
                       if(rate4 == 3){
                           rate4 = "〇"
                       }
                       if(rate4 == 4){
                           rate4 = "◎"
                       }
                       var reach1 = "${target.reach1}";
                       if(reach1 == 1){
                           reach1 = "×"
                       }
                       if(reach1 == 2){
                           reach1 = "△"
                       }
                       if(reach1 == 3){
                           reach1 = "〇"
                       }
                       if(reach1 == 4){
                           reach1 = "◎"
                       }
                       var reach2 = "${target.reach2}";
                       if(reach2 == 1){
                           reach2 = "×"
                       }
                       if(reach2 == 2){
                           reach2 = "△"
                       }
                       if(reach2 == 3){
                           reach2 = "〇"
                       }
                       if(reach2 == 4){
                           reach2 = "◎"
                       }
                       var reach3 = "${target.reach3}";
                       if(reach3 == 1){
                           reach3 = "×"
                       }
                       if(reach3 == 2){
                           reach3 = "△"
                       }
                       if(reach3 == 3){
                           reach3 = "〇"
                       }
                       if(reach3 == 4){
                           reach3 = "◎"
                       }
                       var reach4 = "${target.reach4}";
                       if(reach4 == 1){
                           reach4 = "×"
                       }
                       if(reach4 == 2){
                           reach4 = "△"
                       }
                       if(reach4 == 3){
                           reach4 = "〇"
                       }
                       if(reach4 == 4){
                           reach4 = "◎"
                       }
                       var rival1 = "${target.rival1}";
                       if(rival1 == 1){
                           rival1 = "×"
                       }
                       if(rival1 == 2){
                           rival1 = "△"
                       }
                       if(rival1 == 3){
                           rival1 = "〇"
                       }
                       if(rival1 == 4){
                           rival1 = "◎"
                       }
                       var rival2 = "${target.rival2}";
                       if(rival2 == 1){
                           rival2 = "×"
                       }
                       if(rival2 == 2){
                           rival2 = "△"
                       }
                       if(rival2 == 3){
                           rival2 = "〇"
                       }
                       if(rival2 == 4){
                           rival2 = "◎"
                       }
                       var rival3 = "${target.rival3}";
                       if(rival3 == 1){
                           rival3 = "×"
                       }
                       if(rival3 == 2){
                           rival3 = "△"
                       }
                       if(rival3 == 3){
                           rival3 = "〇"
                       }
                       if(rival3 == 4){
                           rival3 = "◎"
                       }
                       var rival4 = "${target.rival4}";
                       if(rival4 == 1){
                           rival4 = "×"
                       }
                       if(rival4 == 2){
                           rival4 = "△"
                       }
                       if(rival4 == 3){
                           rival4 = "〇"
                       }
                       if(rival4 == 4){
                           rival4 = "◎"
                       }
                       var response1 = "${target.response1}";
                       if(response1 == 1){
                           response1 = "×"
                       }
                       if(response1 == 2){
                           response1 = "△"
                       }
                       if(response1 == 3){
                           response1 = "〇"
                       }
                       if(response1 == 4){
                           response1 = "◎"
                       }
                       var response2 = "${target.response2}";
                       if(response2 == 1){
                           response2 = "×"
                       }
                       if(response2 == 2){
                           response2 = "△"
                       }
                       if(response2 == 3){
                           response2 = "〇"
                       }
                       if(response2 == 4){
                           response2 = "◎"
                       }
                       var response3 = "${target.response3}";
                       if(response3 == 1){
                           response3 = "×"
                       }
                       if(response3 == 2){
                           response3 = "△"
                       }
                       if(response3 == 3){
                           response3 = "〇"
                       }
                       if(response3 == 4){
                           response3 = "◎"
                       }
                       var response4 = "${target.response4}";
                       if(response4 == 1){
                           response4 = "×"
                       }
                       if(response4 == 2){
                           response4 = "△"
                       }
                       if(response4 == 3){
                           response4 = "〇"
                       }
                       if(response4 == 4){
                           response4 = "◎"
                       }
                       var choice = "${target.choice}";
                       var x = 125;
                       var y = null;
                       if( choice == 1){
                           y = 160;
                       }
                       if( choice == 2){
                           y = 220
                       }
                       if( choice == 3){
                           y = 280
                       }
                       if( choice == 4){
                           y = 340
                       }
                       ctx.beginPath();
                       ctx.fillStyle = "navy"
                       ctx.fillRect(125, 100, 750, 60);
                       ctx.fill();

                       ctx.beginPath();
                       ctx.font = "25px serif";
                       ctx.strokeStyle = "black"
                       //横線
                       ctx.beginPath();
                       ctx.moveTo(125, 100);
                       ctx.lineTo(875, 100);
                       ctx.moveTo(125, 160);
                       ctx.lineTo(875, 160);
                       ctx.moveTo(125, 220);
                       ctx.lineTo(875, 220);
                       ctx.moveTo(125, 280);
                       ctx.lineTo(875, 280);
                       ctx.moveTo(125, 340);
                       ctx.lineTo(875, 340);
                       ctx.moveTo(125, 400);
                       ctx.lineTo(875, 400);
                       ctx.stroke()
                       //縦線
                       ctx.beginPath();
                       ctx.moveTo(125, 100);
                       ctx.lineTo(125, 400);
                       ctx.moveTo(275, 100);
                       ctx.lineTo(275, 400);
                       ctx.moveTo(375, 100);
                       ctx.lineTo(375, 400);
                       ctx.moveTo(475, 100);
                       ctx.lineTo(475, 400);
                       ctx.moveTo(575, 100);
                       ctx.lineTo(575, 400);
                       ctx.moveTo(675, 100);
                       ctx.lineTo(675, 400);
                       ctx.moveTo(775, 100);
                       ctx.lineTo(775, 400);
                       ctx.moveTo(875, 100);
                       ctx.lineTo(875, 400);
                       ctx.stroke()

                       //題
                       ctx.beginPath();
                       ctx.font = "20px serif";
                       ctx.fillStyle = "white";
                       ctx.fillText("Segmentation", 140, 135);
                       ctx.fillText("Real", 305, 135);
                       ctx.fillText("Rate", 405, 135);
                       ctx.fillText("Rank", 505, 135);
                       ctx.fillText("Reach", 600, 135);
                       ctx.fillText("Rival", 700, 135);
                       ctx.fillText("Response", 785, 135);
                       ctx.fill();
                       //第1象限
                       ctx.beginPath();
                       ctx.fillStyle = "#CC99CC"
                       ctx.fillRect(125, 160, 150, 60);
                       ctx.fill();
                       //第2象限
                       ctx.beginPath();
                       ctx.fillStyle = "#3399CC"
                       ctx.fillRect(125, 220, 150, 60);
                       ctx.fill();
                       //第3象限
                       ctx.beginPath();
                       ctx.fillStyle = "#99CC00"
                       ctx.fillRect(125, 280, 150, 60);
                       ctx.fill();
                       //第4象限
                       ctx.beginPath();
                       ctx.fillStyle = "#FF9933"
                       ctx.fillRect(125, 340, 150, 60);
                       ctx.fill();
                       //Segmentation
                       ctx.beginPath();
                       ctx.fillStyle = "white";
                       ctx.font = "15px serif";
                       ctx.fillText("${seg.one}", (400 - ctx.measureText( "${seg.one}" ).width) / 2, 190, 400,150);
                       ctx.fillText("${seg.two}",  (400 - ctx.measureText( "${seg.two}" ).width) / 2, 250, 400,150);
                       ctx.fillText("${seg.three}",  (400 - ctx.measureText("${seg.three}").width) / 2, 310, 400,150);
                       ctx.fillText("${seg.four}" , (400 - ctx.measureText("${seg.four}").width) / 2, 370, 400,150);
                       ctx.fill();
                       //Real
                       ctx.beginPath();
                       ctx.font = "20px serif";
                       ctx.fillStyle = "black";
                       ctx.fillText(real1, 315, 190);
                       ctx.fillText(real2, 315, 250);
                       ctx.fillText(real3, 315, 310);
                       ctx.fillText(real4, 315, 370);
                       ctx.fill();
                       //Rate
                       ctx.beginPath();
                       ctx.font = "20px serif";
                       ctx.fillText(rate1, 415, 190);
                       ctx.fillText(rate2, 415, 250);
                       ctx.fillText(rate3, 415, 310);
                       ctx.fillText(rate4, 415, 370);
                       ctx.fill();
                       //Rank
                       ctx.beginPath();
                       ctx.font = "20px serif";
                       ctx.fillText(rank1, 515, 190);
                       ctx.fillText(rank2, 515, 250);
                       ctx.fillText(rank3, 515, 310);
                       ctx.fillText(rank4, 515, 370);
                       ctx.fill();
                       //Reach
                       ctx.beginPath();
                       ctx.font = "20px serif";
                       ctx.fillText(reach1, 615, 190);
                       ctx.fillText(reach2, 615, 250);
                       ctx.fillText(reach3, 615, 310);
                       ctx.fillText(reach4, 615, 370);
                       ctx.fill();
                       //Rival
                       ctx.beginPath();
                       ctx.font = "20px serif";
                       ctx.fillText(rival1, 715, 190);
                       ctx.fillText(rival2, 715, 250);
                       ctx.fillText(rival3, 715, 310);
                       ctx.fillText(rival4, 715, 370);
                       ctx.fill();
                       //Response
                       ctx.beginPath();
                       ctx.font = "20px serif";
                       ctx.fillText(response1, 815, 190);
                       ctx.fillText(response2, 815, 250);
                       ctx.fillText(response3, 815, 310);
                       ctx.fillText(response4, 815, 370);
                       ctx.fill();

                       //選択
                       ctx.strokeStyle = "red"
                       ctx.lineWidth = 8;
                       ctx.strokeRect(x, y, 750, 60);
                       ctx.stroke();
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