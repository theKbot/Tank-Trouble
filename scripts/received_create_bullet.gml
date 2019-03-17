//argument: buffer
var buffer = argument0;

//--Buffer order:
// 1: x
// 2: y
// 3: bullet speed
// 4: direction of bullet
// 5: owner name (client1, client2 or client3)
// 6: owner damage
//-- 

var xx = buffer_read(buffer, buffer_u16);
var yy = buffer_read(buffer, buffer_u16);
var spd = buffer_read(buffer, buffer_u16);
var dir = buffer_read(buffer, buffer_s32);
var _owner = buffer_read(buffer, buffer_u64);
var dmg = buffer_read(buffer, buffer_u16);
//show_debug_message(damage);
//assign values to client tank
with instance_create(xx,yy,obj_bulletStandard)
{
    speed = spd;
    direction = dir;
    owner = _owner;
    damage = dmg;
}
