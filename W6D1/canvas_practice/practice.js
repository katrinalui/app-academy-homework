document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext('2d');

  ctx.fillStyle = "#776F70";
  ctx.fillRect(10, 10, 200, 50);

  ctx.beginPath();
  ctx.arc(50, 50, 30, 0, 2 * Math.PI);
  ctx.strokeStyle = "#E36937";
  ctx.lineWidth = 2;
  ctx.stroke();
  ctx.fillStyle = "#E36937";
  ctx.fill();

  ctx.beginPath();
  ctx.arc(210, 35, 25, 0, Math.PI * 2, true);
  ctx.moveTo(227, 35);
  ctx.arc(210, 35, 17, 0, Math.PI, false);
  ctx.moveTo(200, 25);
  ctx.arc(198, 25, 2, 0, Math.PI * 2, true);  // Left eye
  ctx.moveTo(222, 25);
  ctx.arc(220, 25, 2, 0, Math.PI * 2, true);  // Right eye
  ctx.stroke();
});
