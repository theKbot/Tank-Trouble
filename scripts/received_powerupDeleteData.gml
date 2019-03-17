var buffer = argument0;
var xx = buffer_read(buffer, buffer_u16);
var yy = buffer_read(buffer, buffer_u16);
var objectName = buffer_read(buffer, buffer_string);
//show_debug_message(objectName);

var inst = instance_position(xx,yy,asset_get_index(objectName));

if (inst != noone){ 
    with inst{
        instance_destroy();
    }
}

