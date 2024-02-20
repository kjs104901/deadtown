for (i=0; i<global.tip_number*3; i++)
{
    ran1 = irandom_range(0,global.tip_number-1)
    ran2 = irandom_range(0,global.tip_number-1)
    
    temp = global.tip_info[ran1,0]
    global.tip_info[ran1,0] = global.tip_info[ran2,0]
    global.tip_info[ran2,0] = temp
    
    temp = global.tip_info[ran1,1]
    global.tip_info[ran1,1] = global.tip_info[ran2,1]
    global.tip_info[ran2,1] = temp
    
    temp = global.tip_info[ran1,2]
    global.tip_info[ran1,2] = global.tip_info[ran2,2]
    global.tip_info[ran2,2] = temp
    
    temp = global.tip_info[ran1,3]
    global.tip_info[ran1,3] = global.tip_info[ran2,3]
    global.tip_info[ran2,3] = temp
}
