/// only for weapon and equipment
target = argument0 // 1:weapon 2:head 3:body 4:legs 5:feet
if pointer == -111 or 1 // kind check
{
    item_get(global.equip_weapon,1);
    global.equip_weapon = -1;
}
