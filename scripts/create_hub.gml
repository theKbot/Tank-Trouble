var grid = argument0;
var hubSize = argument1;
startHubX = ceil(random(obj_controller.map_sizeW-(hubSize+1)));
startHubY = ceil(random(obj_controller.map_sizeH-(hubSize+1)));
show_debug_message("X: "+string(startHubX)+"  Y: "+string(startHubY));
for (k = startHubX; k < startHubX+hubSize; k++){
    for (h = startHubY; h < startHubY+hubSize; h++){
            grid[@k, h].wallUp = false;
            grid[@k, h].wallDown = false;
            grid[@k, h].wallLeft = false;
            grid[@k, h].wallRight = false;
    }
    
}
