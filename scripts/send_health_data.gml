var ID = argument0;
var hp = argument1;
//-- argument order:
// 1: id of client
// 2: hp of tank
//--

with obj_server
{
    buffer_seek(send_buffer, buffer_seek_start,0);
    buffer_write(send_buffer, buffer_string, ID); //clientId
    buffer_write(send_buffer, buffer_u8, 8) //id
    buffer_write(send_buffer, buffer_u8, hp) //id
    network_send_udp(socket,remote_ip,remote_port,send_buffer,buffer_tell(send_buffer));
}
