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
  ctx.fillText("${swot.strong}", 140, 205, 350);
  ctx.fillText("Weakness(弱み)", 525, 140);
  ctx.fillText("${swot.weak}", 560, 205, 350);
  ctx.fillText("Opportunity(機会)", 125, 290);
  ctx.fillText("${swot.opp}", 140, 375, 350);
  ctx.fillText("Thread(脅威)", 525, 290);
  ctx.fillText("${swot.thre}" ,560, 375, 350);

  ctx.stroke();
  }