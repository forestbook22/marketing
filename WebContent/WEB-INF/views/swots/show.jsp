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
                <div id="canvas_wrapper">
                <canvas id="board" width="1000" height="450"></canvas>
                </div>
                <div id="point">
                <h2>活用法</h2>
                    <h3><span id = "double">戦略目標の導出</span></h3>
                    <p>SWOT分析の最終目標は「集めた事実を解釈して、マーケティング戦略を立てること」です。
                    SWOT分析では、この4つの視点から導き出されたメッセージを俯瞰することによって、
                    自社にとって重点的に投資をすべき「戦略目標」を絞り込むことができます。（複数でもOK！！）</p>
                    <h3><span id = "double">自社の競争優位性や、重大なリスクの存在を明確にすること</span></h3>
                    <p>外部環境・内部環境と強み弱みを俯瞰してみることで今まで見えてこなかった競争優位やリスクを明確にできます</p>
                    <h3><span id = "double">クロスさせ、より具体的な戦略へ</span></h3>
                    <p>WOT分析から導きだされる強み・弱み・機会・脅威は、それぞれに関係しており、
                    独立して存在するものではありません。そのため、この4つを組み合わせたクロス分析を行うことが重要です。</p>
                    <ul>
                        <li>　　・強みと機会を組み合わせて強みをビジネスチャンスに活かすためにどうするか</li>
                        <li>　　・強みと脅威を組み合わせて強みをどう活用すれば脅威を回避できるか</li>
                        <li>　　・弱みと機会を組み合わせて機会を逃さないために弱みをどうカバーするか</li>
                        <li>　　・弱みと脅威を組み合わせて弱みをどうカバーすれば脅威を回避できるか</li>
                    </ul>
                    <p>上記のように4つをクロスして検討していき、より具体的な戦略に落とし込みます</p>
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
                          ctx.fillText("${swot.strong}",  (600 - ctx.measureText("${swot.strong}").width) / 2, 205, 400,150);
                          ctx.fillText("Weakness(弱み)", 525, 140);
                          ctx.fillText("${swot.weak}", (1400 - ctx.measureText("${swot.weak}").width) / 2, 205,  400,150);
                          ctx.fillText("Opportunity(機会)", 125, 290);
                          ctx.fillText("${swot.opp}", (600 - ctx.measureText("${swot.opp}").width) / 2, 375,  400,150);
                          ctx.fillText("Thread(脅威)", 525, 290);
                          ctx.fillText("${swot.thre}" ,(1400 - ctx.measureText("${swot.thre}").width) / 2, 375,  400,150);

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