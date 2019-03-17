var clientId = argument0;
//Send information about the map size in nodes
buffer_seek(send_buffer, buffer_seek_start,0);
buffer_write(send_buffer, buffer_string, clientId); //clientId
buffer_write(send_buffer, buffer_u8, 11) //id
buffer_write(send_buffer, buffer_u8, obj_controller.map_sizeW);
buffer_write(send_buffer, buffer_u8, obj_controller.map_sizeH);
network_send_udp(socket,remote_ip,remote_port,send_buffer,buffer_tell(send_buffer));

//Send all nodes in the map grid
var node;
for (i = 0; i<obj_controller.map_sizeW; i++)
{
    for (j = 0; j<obj_controller.map_sizeH; j++)
    {   
        node = obj_controller.grid[i,j];
        buffer_seek(send_buffer, buffer_seek_start,0);
        buffer_write(send_buffer, buffer_string, clientId); //clientId
        buffer_write(send_buffer, buffer_u8,10) //id
        buffer_write(send_buffer, buffer_u16, node.x);
        buffer_write(send_buffer, buffer_u16, node.y);
        buffer_write(send_buffer, buffer_bool, node.wallUp);
        buffer_write(send_buffer, buffer_bool, node.wallLeft);
        buffer_write(send_buffer, buffer_bool, node.wallDown);
        buffer_write(send_buffer, buffer_bool, node.wallRight);
        network_send_udp(socket,remote_ip,remote_port,send_buffer,buffer_tell(send_buffer));
    }
}
