///instance_find_directional(x, y, obj, direction, offangle, mindis, maxdis)

var i, instance, minid, mindis, dis;

minid = -1;
mindis = -1;
dis = -1;

for (i = 0; i < instance_number(argument2); i += 1)
{
    instance = instance_find(argument2, i);
    if (abs(angular_gap(point_direction(argument0, argument1, instance.x, instance.y), argument3)) <= argument4)
    {
        dis = point_distance(argument0, argument1, instance.x, instance.y);
        if ((dis >= argument5) && (dis <= argument6))
        {
            if ((dis < mindis) || (mindis == -1))
            {
                mindis = dis;
                minid = instance;
            }
        }
    }
}

return minid; 
