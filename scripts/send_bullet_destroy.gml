var ID = argument0;
with obj_server
{
    buffer_seek(send_buffer, buffer_seek_start,0);
    buffer_write(send_buffer, buffer_string, "To all clients"); //clientId
    buffer_write(send_buffer, buffer_u8, 7) //id
    buffer_write(send_buffer, buffer_u32, ID); //bullet id
    network_send_udp(socket,remote_ip,remote_port,send_buffer,buffer_tell(send_buffer));
}
