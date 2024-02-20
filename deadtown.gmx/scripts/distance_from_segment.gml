var x0 = argument0;
var y0 = argument1;
var x1 = argument2;
var y1 = argument3;
var x2 = argument4;
var y2 = argument5;

var A = x0 - x1;
var B = y0 - y1;
var C = x2 - x1;
var D = y2 - y1;

var dot = A * C + B * D;
var len_sq = C * C + D * D;
var param = -1;

if (len_sq != 0) //in case of 0 length line
    param = dot / len_sq;

var xx, yy;

if (param < 0) {
  xx = x1;
  yy = y1;
}
else if (param > 1) {
  xx = x2;
  yy = y2;
}
else {
  xx = x1 + param * C;
  yy = y1 + param * D;
}

var dx = x - xx;
var dy = y - yy;
return sqrt(dx * dx + dy * dy);
