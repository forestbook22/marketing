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
                <canvas id="canvas" height="500" width="600"></canvas>
                <div id="canvas_warp" >
                    <canvas id="canvas2" height="350" width="600"></canvas>
                    <canvas id="canvas3" height="350" width="600"></canvas>
                </div>
                <input type="button" value="s" id="s">
                <input type="button" value="m" id="m">
                <input type="button" value="l" id="l"><br>
                <input type="button" value="clear" id="clear">
                <a id="download" href="#" download="canvas.jpg">ダウンロード</a>
                <div id="result"><img src=""></div>
                <script>
                   window.onload=()=>{
                       const board = document.querySelector("#board");
                       const ctx = board.getContext("2d");
                       //縦横線
                       ctx.beginPath();
                       ctx.moveTo(300, 50);
                       ctx.lineTo(300, 450);
                       ctx.moveTo(50, 250);
                       ctx.lineTo(550, 250);
                       ctx.stroke();
                       //三角形
                       ctx.beginPath();
                       ctx.moveTo(300, 450);
                       ctx.lineTo(330, 420);
                       ctx.lineTo(270, 420);
                       ctx.lineTo(300, 450);
                       ctx.closePath();
                       ctx.beginPath();
                       ctx.moveTo(300, 50);
                       ctx.lineTo(330, 80);
                       ctx.lineTo(270, 80);
                       ctx.lineTo(300, 50);
                       ctx.closePath();
                       ctx.beginPath();
                       ctx.moveTo(50, 250);
                       ctx.lineTo(80, 280);
                       ctx.lineTo(80, 220);
                       ctx.lineTo(50, 250);
                       ctx.closePath();
                       ctx.beginPath();
                       ctx.moveTo(550, 250);
                       ctx.lineTo(520, 280);
                       ctx.lineTo(520, 220);
                       ctx.lineTo(550, 250);
                       ctx.closePath();
                       /*
                        * 図形処理用オブジェクト
                        */
                        const pathObj = function (  callBack ) {
                            this.callBack = callBack;   // パスを作成する関数
                            this.moveX = 0;
                            this.moveY = 0;
                        };
                        pathObj.prototype={
                                // 図形の描画
                            draw( context , effect = false , eX = 0 , eY = 0){
                                const ctx = this.drawData( context , eX , eY );

                                if( effect ) ctx.strokeStyle = pathObjStrokeColor;
                                context.stroke();
                                context.restore();
                            },
                            setPos( eX , eY ){
                                this.moveX += eX;this.moveY += eY;
                            },
                            isIn( context , x , y ){
                                const ctx = this.drawData( context , 0 , 0 );
                                const result = ctx.isPointInStroke( x - this.moveX , y - this.moveY);
                                ctx.restore();
                                return  result;
                            },
                                // コンテキスト取得
                            drawData( context ,  eX , eY){
                                context.save();
                                context.translate( this.moveX + eX , this.moveY + eY );
                                context.beginPath();

                                    // パスをセット
                                this.callBack( context );
                                return context;
                            }
                        };
                        /*
                        * 図形処理用オブジェクトのコンテナ
                        */
                        const pathList = function ( canvas , effectCanvas ) {
                            this.canvas = canvas;
                            this.effectCanvas = effectCanvas;
                            this.context = this.canvas.getContext("2d");
                            this.effectContext = this.effectCanvas.getContext("2d");
                            this.path = [];
                            this.currentPath = null;
                            this.moveMode = false;
                            this.currentX = 0;
                            this.currentY = 0;
                        };
                        pathList.prototype={
                                // 図形処理用オブジェクト追加
                            add( callBack ){
                                this.path.push( new pathObj( callBack) );
                            },
                                // 全図形の描画
                            draw(){
                                this.context.clearRect(0,0,this.canvas.width,this.canvas.height);
                                this.path.forEach( e => e.draw( this.context ));
                            },
                            clearEffect(){
                                this.effectContext.clearRect(0,0,this.canvas.width,this.canvas.height);
                            },
                            drawEffect( x , y ){
                                this.clearEffect();
                                this.currentPath.draw(this.effectContext , true , x - this.currentX , y - this.currentY );
                            },
                            inStroke( x , y ){
                                    // 配列の最後＝上階層の図形
                                for( let i = this.path.length -1 ; i >= 0 ; i -- ){
                                    if( this.path[i].isIn( this.context , x , y ) ) return i;
                                }
                                return -1;
                            },
                            getPoint( e ){
                                const rect = e.target.getBoundingClientRect();
                                const [w,h] = [this.canvas.width / this.canvas.clientWidth , this.canvas.height / this.canvas.clientHeight];
                                return [ (e.clientX - rect.left) * w,(e.clientY - rect.top)*h];
                            },
                                // キャンバス上でのクリックイベント処理
                            clickEvent(){
                                    // マウスを押したときのイベント
                                this.effectCanvas.addEventListener('mousedown', e => {
                                    const [x,y] = this.getPoint(e);
                                    let index = this.inStroke( x , y );
                                    console.log( index );
                                    if( index  > -1 ){
                                        this.currentPath = this.path[index];
                                        this.currentX = x;
                                        this.currentY = y;
                                        this.moveMode = true;
                                    }
                                }, false);
                                    // マウスカーソルを移動したときのイベント
                                this.effectCanvas.addEventListener('mousemove', e => {
                                    if( !this.moveMode ) return;
                                    const [x,y] = this.getPoint(e);
                                    this.drawEffect( x , y );
                                }, false);
                                    // マウスボタンを離したときのイベント
                                this.effectCanvas.addEventListener('mouseup', e => {
                                    if( !this.moveMode ) return;
                                    this.moveMode=false;
                                    const [x,y] = this.getPoint(e);
                                    this.clearEffect();
                                    this.currentPath.setPos( x - this.currentX,y - this.currentY);
                                    this.currentPath=null;
                                    this.draw();
                                }, false);
                            }
                        };
                            // DOMが構築されるのを待つ
                        window.addEventListener( "DOMContentLoaded" , ()=> {
                            const cvs = document.getElementById( "canvas2" );
                            const cvs2 = document.getElementById( "canvas3" );
                            const pathListObj = new pathList( cvs , cvs2 );
                            paths.forEach( e=> pathListObj.add(e) );
                            pathListObj.draw();
                            pathListObj.clickEvent();
                        });
                        })();
                       //S
                       $("#s").click(function(){
                           ctx.arc(100, 100, 100, 0, Math.PI * 2, true);
                           setBgColor();
                       });
                       //M
                       $("#m").click(function(){
                           ctx.arc(100, 100, 125, 0, Math.PI * 2, true);
                           setBgColor();
                         });
                       //L
                       $("#l").click(function(){
                           ctx.arc(100, 100, 150, 0, Math.PI * 2, true);
                           setBgColor();
                         });
                        // 描画クリア
                       $("#clear").click(function(){
                           ctx.clearRect(0,0,500,500);
                           //縦横線
                           ctx.beginPath();
                           ctx.moveTo(300, 50);
                           ctx.lineTo(300, 450);
                           ctx.moveTo(50, 250);
                           ctx.lineTo(550, 250);
                           ctx.stroke();
                           //三角形
                           ctx.beginPath();
                           ctx.moveTo(300, 450);
                           ctx.lineTo(330, 420);
                           ctx.lineTo(270, 420);
                           ctx.lineTo(300, 450);
                           ctx.closePath();
                           ctx.beginPath();
                           ctx.moveTo(300, 50);
                           ctx.lineTo(330, 80);
                           ctx.lineTo(270, 80);
                           ctx.lineTo(300, 50);
                           ctx.closePath();
                           ctx.beginPath();
                           ctx.moveTo(50, 250);
                           ctx.lineTo(80, 280);
                           ctx.lineTo(80, 220);
                           ctx.lineTo(50, 250);
                           ctx.closePath();
                           ctx.beginPath();
                           ctx.moveTo(550, 250);
                           ctx.lineTo(520, 280);
                           ctx.lineTo(520, 220);
                           ctx.lineTo(550, 250);
                           ctx.closePath();
                           setBgColor();
                         });

                       // canvasを画像で保存
                       $("#download").click(function(){
                         canvas = document.getElementById('canvas');
                         var base64 = canvas.toDataURL("image/jpeg");
                         document.getElementById("download").href = base64;
                       });

                       function setBgColor(){
                              // canvasの背景色を設定(指定がない場合にjpeg保存すると背景が黒になる)
                              ctx.fillStyle = bgColor;
                              ctx.fillRect(0,0,cnvWidth,cnvHeight);
                            }
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
                    <form method="POST" enctype="multipart/form-data" action="../UploadServlet">
                    <input type="file" name="file"/><br />
                    <input type="submit" value="アップロード" />
                    </form>
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