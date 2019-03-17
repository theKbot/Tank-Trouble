var object = argument0;
var xx = object.x;
var yy = object.y;
var packageId = argument1;

with obj_server
{
    buffer_seek(send_buffer, buffer_seek_start,0);
    buffer_write(send_buffer, buffer_string, "To all clients"); //clientId
    buffer_write(send_buffer, buffer_u8, packageId) //id
    buffer_write(send_buffer, buffer_u16, xx);
    buffer_write(send_buffer, buffer_u16, yy);
    buffer_write(send_buffer, buffer_s16, object.direction);
    buffer_write(send_buffer, buffer_s16, object.dir);
    network_send_udp(socket,remote_ip,remote_port,send_buffer,buffer_tell(send_buffer));
}
