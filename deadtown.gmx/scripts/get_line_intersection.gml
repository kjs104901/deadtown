var p0_x = argument0;
var p0_y = argument1;
var p1_x = argument2;
var p1_y = argument3;
var p2_x = argument4;
var p2_y = argument5;
var p3_x = argument6;
var p3_y = argument7;

//float *i_x, float *i_y)

var s02_x, s02_y, s10_x, s10_y, s32_x, s32_y, s_numer, t_numer, denom, t;
s10_x = p1_x - p0_x;
s10_y = p1_y - p0_y;
s32_x = p3_x - p2_x;
s32_y = p3_y - p2_y;

denom = s10_x * s32_y - s32_x * s10_y;
if (denom == 0)
    return 0; // Collinear
denomPositive = denom > 0;

s02_x = p0_x - p2_x;
s02_y = p0_y - p2_y;
s_numer = s10_x * s02_y - s10_y * s02_x;
if ((s_numer < 0) == denomPositive)
    return 0; // No collision

t_numer = s32_x * s02_y - s32_y * s02_x;
if ((t_numer < 0) == denomPositive)
    return 0; // No collision

if (((s_numer > denom) == denomPositive) || ((t_numer > denom) == denomPositive))
    return 0; // No collision

return 1;

