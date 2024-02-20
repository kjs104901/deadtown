var index = argument0;

if global.shop_db[index,4] <= global.money
{
    if global.shop_db[index,0] == 0
    {
        global.money -= global.shop_db[index,4]
        global.shop_db[index,5] += 1
        return 1;
    }
    else if global.shop_db[index,0] == 1
    {
        if global.shop_db[index,5] == 0
        {
            global.money -= global.shop_db[index,4]
            global.shop_db[index,5] = 1
            return 1;
        }
    }
    return 0;
}
