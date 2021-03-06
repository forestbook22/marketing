<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${fourp != null}">
                <h2>4P　詳細ページ</h2>

                <table id = "show">
                    <tbody>
                        <tr>
                            <th>Name</th>
                            <td><c:out value="${fourp.user.name}" /></td>
                        </tr>
                        <tr>
                            <th>Title</th>
                            <td><c:out value="${fourp.title.title}" /></td>
                        </tr>
                        <tr>
                            <th>Created_at</th>
                            <td>
                                <fmt:formatDate value="${fourp.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>Update_at</th>
                            <td>
                                <fmt:formatDate value="${fourp.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
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
                       ctx.font = "30px serif";
                       ctx.strokeStyle = "black"
                       //横線
                       ctx.moveTo(25, 250);          // 始点
                       ctx.lineTo(975, 250);        // 終点
                       //縦線
                       ctx.moveTo(500, 0);          // 始点
                       ctx.lineTo(500, 500);        // 終点
                       ctx.stroke()
                       ctx.beginPath();
                       ctx.strokeStyle = "crimson"
                       //Product
                       ctx.fillText("Product", 200, 50);
                       ctx.strokeRect(55,55,400,150);
                       //Price
                       ctx.fillText("Price", 720, 50);
                       ctx.strokeRect(555,55,400,150);
                       //Place
                       ctx.fillText("Place", 200, 300);
                       ctx.strokeRect(55,305,400,150);
                       //Promotion
                       ctx.fillText("Promotion", 680, 300);
                       ctx.strokeRect(555,305,400,150);
                       ctx.stroke();
                       //真ん中
                       ctx.beginPath();
                       ctx.fillStyle="crimson";
                       ctx.arc(500, 250, 80, 0, Math.PI * 2, true);
                       ctx.fill();
                       ctx.beginPath();
                       ctx.font = "60px 'sans-serif'";
                       ctx.fillStyle="white";
                       ctx.fillText("4P",460,270)
                       ctx.fill();
                       ctx.beginPath();
                       ctx.arc(500, 250, 100,( 110 * Math.PI) / 180 , (260 * Math.PI) / 180, false);
                       ctx.strokeStyle = "crimson";
                       ctx.lineWidth = 5;
                       ctx.stroke();
                       ctx.beginPath();
                       ctx.moveTo(500, 150);
                       ctx.lineTo(483, 140);
                       ctx.moveTo(483, 140);
                       ctx.lineTo(483, 160);
                       ctx.moveTo(483, 160);
                       ctx.lineTo(500, 150);
                       ctx.lineWidth = 1;
                       ctx.stroke();
                       ctx.beginPath();
                       ctx.arc(500, 250, 100,( 290 * Math.PI) / 180 , (80 * Math.PI) / 180, false);
                       ctx.lineWidth = 5;
                       ctx.stroke();
                       ctx.beginPath();
                       ctx.moveTo(500, 350);
                       ctx.lineTo(517, 340);
                       ctx.moveTo(517, 340);
                       ctx.lineTo(517, 360);
                       ctx.moveTo(517, 360);
                       ctx.lineTo(500, 350);
                       ctx.lineWidth = 1;
                       ctx.stroke();
                       var str = function(variable, x, y) {
                           var row_string_cnt =16; //一行あたりの文字数
                           //横幅と1行あたりの文字数から、文字サイズを算出
                             var font_size = Math.round(380 / row_string_cnt);
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
                       str("${product}", 70, 85);
                       str( "${price}", 570, 85)
                       str( "${place}", 570, 345);
                       str( "${promotion}", 70, 345);
                       ctx.fill();
                    }
                   </script>
                <c:if test="${sessionScope.login_user.id == fourp.user.id}">
                    <div id="point">
                    <h2>活用法</h2>
                        <h3><span id = "double">戦略に大きなズレがないか確認</span></h3>
                        <p>製品・価格・流通・販売促進それぞれがターゲットのニーズに合致し、
                        価値を感じる製品やサービスを提供するために最適かの「整合性」を確認！</p>
                        <h3><span id = "double">4Pをミックスし、今後の施策を考える</span></h3>
                        <p>複数のPをかけ合わせることで、自社に適した戦略をとることができる</p>
                        <p>ex)飲食物で、品質が良く（Product）、価格もやや高めだが（Price）、コンビニやスーパーで購入できる（Place）
                        ＝日常の贅沢を感じさせる商品としてのプロモーションへ</p>
                        <h3><span id = "double">3Cと組み合わせる</span></h3>
                        <p>4Pが主に自社の戦略を分析するのに対し、3C分析では市場・顧客や競合企業の分析など外部環境について分析する。
                        そこで、4P分析と3C分析を組み合わせることで、自社の戦略をより精度の高いものにすることができる！</p>
                    </div>
                    <p><a href="<c:url value="/fourps/edit?id=${fourp.id}" />">このフレームワークを編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
        <p><a href="<c:url value='/titles/show?id=${fourp.title.id }' />">一覧に戻る</a></p>
    </c:param>
</c:import>