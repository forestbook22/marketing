<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${position != null}">
                <h2>Positioning　詳細ページ</h2>

                <table id = "show">
                    <tbody>
                        <tr>
                            <th>Name</th>
                            <td><c:out value="${position.user.name}" /></td>
                        </tr>
                        <tr>
                            <th>Title</th>
                            <td><c:out value="${position.title.title}" /></td>
                        </tr>
                        <tr>
                            <th>Created_at</th>
                            <td>
                                <fmt:formatDate value="${position.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>Update_at</th>
                            <td>
                                <fmt:formatDate value="${position.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <div id="canvas_wrapper">
                   <canvas id="board" width="1000" height="500"></canvas>
                </div>
                <img src = "../uploaded/${position.user.id}_${position.title.id}.jpg"/>
                 <p>注：更新されない場合は画面左上の更新ボタンを押してください</p>
                <script>
                   window.onload=()=>{
                       const board = document.querySelector("#board");
                       const ctx = board.getContext("2d");
                       //属性
                       ctx.beginPath();
                       ctx.fillStyle = "#CC99CC"
                       ctx.fillRect(50,0,300, 75);
                       ctx.fill();
                       ctx.beginPath();
                       ctx.strokeStyle = "#CC99CC"
                       ctx.strokeRect(50,0,300, 250);
                       ctx.stroke();
                       //ベネフィット
                       ctx.beginPath();
                       ctx.fillStyle = "#3399CC"
                       ctx.fillRect(350,0, 300, 75);
                       ctx.fill();
                       ctx.beginPath();
                       ctx.strokeStyle = "#3399CC"
                       ctx.strokeRect(350,0,300, 250);
                       ctx.stroke();
                       //機会
                       ctx.beginPath();
                       ctx.fillStyle = "#99CC00"
                       ctx.fillRect(650, 0, 300, 75);
                       ctx.fill();
                       ctx.beginPath();
                       ctx.strokeStyle = "#99CC00"
                       ctx.strokeRect(650, 0, 300, 250);
                       ctx.stroke();
                       //関係
                       ctx.beginPath();
                       ctx.fillStyle = "#FFFF00"
                       ctx.fillRect(50,250, 300, 75);
                       ctx.fill();
                       ctx.beginPath();
                       ctx.strokeStyle = "#FFFF00"
                       ctx.strokeRect(50,250,300, 250);
                       ctx.stroke();
                       //距離
                       ctx.beginPath();
                       ctx.fillStyle = "#FF9933"
                       ctx.fillRect(350,250, 300, 75);
                       ctx.fill();
                       ctx.beginPath();
                       ctx.strokeStyle = "#FF9933"
                       ctx.strokeRect(350,250,300, 250);
                       ctx.stroke();
                       //種類
                       ctx.beginPath();
                       ctx.fillStyle = "#FF0000"
                       ctx.fillRect(650,250, 300, 75);
                       ctx.fill();
                       ctx.beginPath();
                       ctx.strokeStyle = "#FF0000"
                       ctx.strokeRect(650,250, 300, 250);
                       ctx.stroke();
                       //文字
                       ctx.beginPath();
                       ctx.font = "bold 25px 'sans-serif'";
                       ctx.fillStyle="white";
                       ctx.fillText("特定の製品属性", 120, 50);
                       ctx.fillText("提供するベネフィット", 380, 50);
                       ctx.fillText("製品が使用される機会", 680, 50);
                       ctx.fillText("競合製品との関係", 100, 300);
                       ctx.fillText("競合製品との距離", 400, 300);
                       ctx.fillText("製品の種類", 740, 300);
                       ctx.font = "20px 'sans-serif'";
                       ctx.fill();

                       //入力文字表示
                       var str = function(variable, x, y) {
                           var row_string_cnt =11; //一行あたりの文字数
                           //横幅と1行あたりの文字数から、文字サイズを算出
                             var font_size = Math.round(290 / row_string_cnt);
                           //入力文字を1文字毎に配列化
                           var aryText = variable.split('');
                           //出力用の配列を用意
                           var aryRow = [];
                           aryRow[0] = '';
                           var row_cnt = 0;
                         //入力1文字毎にループ　改行コードもしくは折り返しで配列の添え字を足す
                           for(var i = 0; i < aryText.length; i++){
                               var text = aryText[i];
                               if(aryRow[row_cnt].length >= row_string_cnt){
                                   row_cnt++;
                                   aryRow[row_cnt] = '';
                               }
                               if(text == "z"){
                                   row_cnt++;
                                   aryRow[row_cnt] = '';
                                   text = '';
                               }
                               aryRow[row_cnt] += text;
                           }
                         //文字の表示　y軸とx軸をループする
                           for(var i = 0; i < aryRow.length; i++){
                               aryStr = aryRow[i].split('');
                               for(var j = 0; j < aryStr.length; j++){
                                   ctx.fillText(aryStr[j], x + (j * font_size), y + (i * (font_size + 5)) + 10);
                               }
                           }

                         };
                       ctx.beginPath();
                       ctx.textAlign = 'left';
                       ctx.font = "25px 'px meiryo'";
                       ctx.fillStyle="black";
                       str("${attri}", 60, 110);
                       str( "${benefit}", 360, 110)
                       str( "${opp}", 660, 110);
                       str( "${relation}", 60, 360);
                       str( "${distance}", 360, 360);
                       str( "${kind}", 660, 360);
                       ctx.fill();
                    }
                   </script>
                <c:if test="${sessionScope.login_user.id == position.user.id}">
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
                    <p><a href="<c:url value="/positions/edit?id=${position.id}" />">このフレームワークを編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
        <p><a href="<c:url value='/titles/show?id=${position.title.id }' />">一覧に戻る</a></p>
    </c:param>
</c:import>