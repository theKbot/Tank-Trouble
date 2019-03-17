//argument0 = grid
var ran = ceil(random(4));
var grid = argument0;
var targetNodeX, targetNodeY; 
switch (ran)
{
    case 1: //right
    targetNodeX = round(random((obj_controller.map_sizeW-2)))
    targetNodeY = round(random(obj_controller.map_sizeH))
    /*while (grid[targetNodeX, targetNodeY].wallRight == false)
    {
        targetNodeX = round(random((obj_controller.map_sizeW-2)))
        targetNodeY = round(random(obj_controller.map_sizeH))
    }*/
    grid[@targetNodeX, targetNodeY].wallRight = false;
    grid[@targetNodeX+1, targetNodeY].wallLeft = false;
    break;
    
    case 2: //left
    targetNodeX = round(random((obj_controller.map_sizeW-2)))+1
    targetNodeY = round(random(obj_controller.map_sizeH))
    /*while (grid[targetNodeX, targetNodeY].wallLeft == false)
    {
        targetNodeX = round(random((obj_controller.map_sizeW-2)))+1
        targetNodeY = round(random(obj_controller.map_sizeH))
    }*/
    grid[@targetNodeX, targetNodeY].wallLeft = false;
    grid[@targetNodeX-1, targetNodeY].wallRight = false;
    break;
    
    case 3: //up
    targetNodeX = round(random((obj_controller.map_sizeW)))
    targetNodeY = round(random((obj_controller.map_sizeH-2)))+1
    /*while (grid[targetNodeX, targetNodeY].wallUp == false)
    {
        targetNodeX = round(random((obj_controller.map_sizeW)))
        targetNodeY = round(random((obj_controller.map_sizeH-2)))+1
    }*/
    grid[@targetNodeX, targetNodeY].wallUp = false;
    grid[@targetNodeX, targetNodeY-1].wallDown = false;
    break;
    
    case 4: //down
    targetNodeX = round(random((obj_controller.map_sizeW)))
    targetNodeY = round(random((obj_controller.map_sizeH-2)))
    /*while (grid[targetNodeX, targetNodeY].wallDown == false)
    {
        targetNodeX = round(random((obj_controller.map_sizeW)))
        targetNodeY = round(random((obj_controller.map_sizeH-2)))
    }*/
    grid[@targetNodeX, targetNodeY].wallDown = false;
    grid[@targetNodeX, targetNodeY+1].wallUp = false;
    break;
}
