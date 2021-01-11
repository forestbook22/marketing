<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <c:choose>
            <c:when test="${users_title != null}">
                <h2>${users_title.title}　詳細ページ</h2>
                <table id = "show">
                    <tbody>
                        <tr>
                            <th>マクロ環境分析(PEST分析)</th>
                            <c:choose>
                                <c:when test="${pest != null}">
                                    <td><a href="<c:url value='/pests/show?id=${pest.id}' />">詳細</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/pests/edit?id=${pest.id}' />">編集</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="<c:url value="/pests/new"/>">新規登録</a></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </tbody>
                </table>
                <c:choose>
                    <c:when test="${pest != null}">
                        <br />
                        <div id="canvas_wrapper">
                            <canvas id="pest" width="1000" height="500"></canvas>
                        </div>
                        <br />
                    </c:when>
                </c:choose>
                <table>
                    <tbody>
                        <tr>
                            <th>業界環境分析(3C分析)</th>
                            <c:choose>
                                <c:when test="${threec != null}">
                                    <td><a href="<c:url value='/threecs/show?id=${threec.id}' />">詳細</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/threecs/edit?id=${threec.id}' />">編集</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="<c:url value="/threecs/new"/>">新規登録</a></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </tbody>
                </table>
                <c:choose>
                    <c:when test="${threec != null}">
                        <br />
                        <div id="canvas_wrapper">
                            <canvas id="threec" width="1000" height="500"></canvas>
                        </div>
                        <br />
                    </c:when>
                </c:choose>
                <table>
                    <tbody>
                        <tr>
                            <th>戦略目標(SWOT分析)</th>
                            <c:choose>
                                <c:when test="${swot != null}">
                                <td><a href="<c:url value='/swots/show?id=${swot.id}' />">詳細</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/swots/edit?id=${swot.id}' />">編集</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="<c:url value="/swots/new"/>">新規登録</a></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </tbody>
                </table>
                <c:choose>
                    <c:when test="${swot != null}">
                        <br />
                        <div id="canvas_wrapper">
                            <canvas id="swot" width="1000" height="500"></canvas>
                        </div>
                        <br />
                    </c:when>
                </c:choose>
                <table>
                    <tbody>
                        <tr>
                            <th>市場細分化(Segmentation)</th>
                            <c:choose>
                                <c:when test="${seg != null}">
                                <td><a href="<c:url value='/segs/show?id=${seg.id}' />">詳細</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/segs/edit?id=${seg.id}' />">編集</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="<c:url value="/segs/new"/>">新規登録</a></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </tbody>
                </table>
                <c:choose>
                    <c:when test="${seg != null}">
                        <br />
                        <div id="canvas_wrapper">
                            <canvas id="seg" width="1000" height="500"></canvas>
                        </div>
                        <br />
                    </c:when>
                </c:choose>
                <table>
                    <tbody>
                        <tr>
                            <th>適切な市場や顧客グループの選択(Targeting)</th>
                            <c:choose>
                                <c:when test="${target != null}">
                                    <td><a href="<c:url value='/targets/show?id=${target.id}' />">詳細</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/targets/edit?id=${target.id}' />">編集</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="<c:url value="/targets/new"/>">新規登録</a></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </tbody>
                </table>
                <c:choose>
                    <c:when test="${target != null}">
                        <br />
                        <div id="canvas_wrapper">
                            <canvas id="target" width="1000" height="500"></canvas>
                        </div>
                        <br />
                    </c:when>
                </c:choose>
                <table>
                    <tbody>
                        <tr>
                            <th>差別化戦略(Positioning)</th>
                            <c:choose>
                                <c:when test="${position != null}">
                                <td><a href="<c:url value='/positions/show?id=${position.id}' />">詳細</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/positions/edit?id=${position.id}' />">編集</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="<c:url value="/positions/new"/>">新規登録</a></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </tbody>
                </table>
                <c:choose>
                    <c:when test="${position != null}">
                        <br />
                        <div id="canvas_wrapper">
                            <canvas id="position" width="1000" height="500"></canvas>
                        </div>
                        <br />
                        <div id = "map">
                            <img src = "../uploaded/${position.user.id}_${position.title.id}.jpg"/>
                        </div>
                        <br />
                        <p>注：更新されない場合は画面左上の更新ボタンを押してください</p>
                        <p>(それでも表示されない場合はキャッシュの消去とハード再読み込みをしてください)</p>
                    </c:when>
                </c:choose>
                <table>
                    <tbody>
                        <tr>
                            <th>具体的施策(4P分析)</th>
                            <c:choose>
                                <c:when test="${fourp != null}">
                                    <td><a href="<c:url value='/fourps/show?id=${fourp.id}' />">詳細</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/fourps/edit?id=${fourp.id}' />">編集</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="<c:url value="/fourps/new"/>">新規登録</a></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </tbody>
                </table>
                <c:choose>
                    <c:when test="${fourp != null}">
                        <br />
                        <div id="canvas_wrapper">
                            <canvas id="fourp" width="1000" height="500"></canvas>
                        </div>
                        <br />
                    </c:when>
                </c:choose>
                <br>
                <c:if test="${sessionScope.login_user.id == users_title.user.id}">
                    <p><a href="<c:url value='/titles/edit?id=${users_title.id}' />">タイトル名を編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
        <p><a href="<c:url value="/" />">タイトル一覧に戻る</a></p>
        <script>
        window.addEventListener('load', function() {
            const board = document.querySelector("#pest");
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

            //入力文字表示
            var str = function(variable, x, y) {
                var row_string_cnt =18; //一行あたりの文字数
                  var font_size = Math.round(450 / row_string_cnt);
                var aryText = variable.split('');
                var aryRow = [];
                aryRow[0] = '';
                var row_cnt = 0;
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
            str("${poli}", 20, 125);
            str( "${eco}", 520, 125)
            str( "${soci}", 520, 375);
            str( "${tech}", 20, 375);
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
            })
         window.addEventListener('load', function() {
                 const board = document.querySelector("#threec");
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
             })
        window.addEventListener('load', function() {
            const board = document.querySelector("#swot");
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
            ctx.beginPath();
            ctx.font = "30px serif";
            ctx.lineWidth = 2;
            ctx.strokeStyle = 'black';

            //プラス要因
            ctx.fillText("プラス要因", 250, 75);
            ctx.strokeRect(120, 20, 400, 390);
            //マイナス面
            ctx.fillText("マイナス要因", 630, 75);
            ctx.strokeRect(520, 20, 400, 390);
            //内部環境
            var text = "内部環境";
            tategaki(ctx, text, 40, 150);
            ctx.strokeRect(0, 110, 920, 150);
            //外部環境
            var text = "外部環境";
            tategaki(ctx, text, 40, 310);
            ctx.strokeRect(0, 260, 920, 150);
            //Strength
            ctx.fillStyle = 'red';
            ctx.fillRect(120,110,400,150);
            //Weakness
            ctx.fillStyle = 'blue';
            ctx.fillRect(520,110,400,150);
            //Opportunity
            ctx.fillStyle = 'orange';
            ctx.fillRect(120,260,400,150);
            //Thread
            ctx.fillStyle = 'blueviolet';
            ctx.fillRect(520,260,400,150);
            //Text
            ctx.fillStyle = 'white';
            ctx.fillText("Strength(強み)", 125, 140);
            ctx.fillText("Weakness(弱み)", 525, 140);
            ctx.fillText("Opportunity(機会)", 125, 290);
            ctx.fillText("Thread(脅威)", 525, 290);

            ctx.stroke();

          //入力文字表示
            var str = function(variable, x, y) {
                var row_string_cnt =16;
                  var font_size = Math.round(380 / row_string_cnt);
                var aryText = variable.split('');
                var aryRow = [];
                aryRow[0] = '';
                var row_cnt = 0;
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
            ctx.fillStyle="white";
            str("${strong}", 125, 180);
            str( "${weak}", 525, 180)
            str( "${opp}", 125, 330);
            str( "${thre}", 525, 330);
            ctx.fill();
            })
        window.addEventListener('load', function() {
            const board = document.querySelector("#seg");
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
         })
         window.addEventListener('load', function() {
            const board = document.querySelector("#target");
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
         })
        window.addEventListener('load', function() {
            const board = document.querySelector("#position");
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
         })
        window.addEventListener('load', function() {
            const board = document.querySelector("#fourp");
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
         })
        </script>
    </c:param>
</c:import>