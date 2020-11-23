window.onload=()=>{
  const board = document.querySelector("#board");
  const ctx = board.getContext("2d");
  ctx.beginPath();
  //横線
  ctx.moveTo(25, 250);          // 始点
  ctx.lineTo(975, 250);        // 終点
  //縦線
  ctx.moveTo(500, 0);          // 始点
  ctx.lineTo(500, 500);        // 終点
  //Product
  ctx.font = "30px serif";
  ctx.fillText("Product", 50, 50);
  ctx.strokeRect(55,55,400,150);
  ctx.fillText("${fourp.product}", 70, 125, 350);
  //Price
  ctx.font = "30px serif";
  ctx.fillText("Price", 550, 50);
  ctx.strokeRect(555,55,400,150);
  ctx.fillText("${fourp.price}", 570, 125, 350);
  //Place
  ctx.font = "30px serif";
  ctx.fillText("Place", 50, 300);
  ctx.strokeRect(55,305,400,150);
  ctx.fillText("${fourp.place}", 70, 375, 350);
  //Promotion
  ctx.font = "30px serif";
  ctx.fillText("Promotion", 550, 300);
  ctx.strokeRect(555,305,400,150);
  ctx.fillText("${fourp.promotion}" ,570, 375, 350);

  ctx.strokeStyle = "Brack";  // 線の色
    ctx.lineWidth = 5;           // 線の太さ
    ctx.stroke();
  }