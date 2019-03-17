var xx = argument0;
var yy = argument1;
var ID = argument2;
with obj_server
{
    buffer_seek(send_buffer, buffer_seek_start,0);
    buffer_write(send_buffer, buffer_string, "To all clients"); //clientId
    buffer_write(send_buffer, buffer_u8, 6) //id
    buffer_write(send_buffer, buffer_u32, ID); //bullet id
    buffer_write(send_buffer, buffer_u16, xx);
    buffer_write(send_buffer, buffer_u16, yy);
    network_send_udp(socket,remote_ip,remote_port,send_buffer,buffer_tell(send_buffer));
}
