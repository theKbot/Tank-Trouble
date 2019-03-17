var objectName = argument0;
var xx = argument1;
var yy = argument2;
//show_debug_message(objectName);

with obj_server
{
    buffer_seek(send_buffer, buffer_seek_start,0);
    buffer_write(send_buffer, buffer_string, "To all clients"); //clientId
    buffer_write(send_buffer, buffer_u8, 12) //id
    buffer_write(send_buffer, buffer_u16, xx);
    buffer_write(send_buffer, buffer_u16, yy);
    buffer_write(send_buffer, buffer_string, objectName);
    network_send_udp(socket,remote_ip,remote_port,send_buffer,buffer_tell(send_buffer));
}
