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
   ctx.fillText("${fourp.product}", (500 - ctx.measureText( "${fourp.product}" ).width) / 2, 125, 400,150);
   //Price
   ctx.fillText("Price", 720, 50);
   ctx.strokeRect(555,55,400,150);
   ctx.fillText("${fourp.price}",  (1500 - ctx.measureText( "${fourp.price}" ).width) / 2, 125, 400,150);
   //Place
   ctx.fillText("Place", 200, 300);
   ctx.strokeRect(55,305,400,150);
   ctx.fillText("${fourp.place}",  (500 - ctx.measureText("${fourp.place}").width) / 2, 375, 400,150);
   //Promotion
   ctx.fillText("Promotion", 680, 300);
   ctx.strokeRect(555,305,400,150);
   ctx.fillText("${fourp.promotion}" , (1500 - ctx.measureText("${fourp.promotion}").width) / 2, 375, 400,150);
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
}