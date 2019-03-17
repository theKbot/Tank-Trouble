//argument: buffer
var buffer = argument0;
var tank = argument1;

//--Buffer order:
// 1: id
// 2: tank x
// 3: tank y
//-- 

var tankx = buffer_read(buffer, buffer_s16);
var tanky = buffer_read(buffer, buffer_s16);
var tankdirection = buffer_read(buffer, buffer_s16);
var tankdir = buffer_read(buffer, buffer_s16);

//assign values to client tank
tank.x = tankx;
tank.y = tanky;
tank.direction = tankdirection;
tank.dir = tankdir;
