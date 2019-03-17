//argument0 = width
//argument1 = height
//argument2 = removed random walls
//argument3 = amount of hubs
//argument4 = hub sizes

var w = argument0;
var h = argument1;
var removedWalls = argument2;
var hubs = argument3;
var hubSize;
var startX = 0
var startY = 0;
var curX = startX
var curY = startY;
var finished = false;
var stack = ds_stack_create();
var finished = false;
var neighbour;
var neighlist = ds_list_create();
var nodeLeft, nodeRight, nodeUp, nodeDown;
var gridSize = map_gridSize;

for (i = 0; i<w; i++)
{
    for (j = 0; j<h; j++)
    {
        Node = instance_create((i*gridSize)+gridSize/2, (j*gridSize)+gridSize/2, obj_node);
        grid[i,j] = Node.id
        grid[i,j].posX = i;
        grid[i,j].posY = j;
        grid[i,j].wallDist = gridSize/2;
    }
}

//tilføj første Node til stack
grid[startX, startY].visited = true;
ds_stack_push(stack,grid[startX, startY]);

while (!finished)
{
    neighbour = check_neighbour(grid, curX, curY);
    
    //Check if neighbour found.
    if (neighbour != noone){
        if (neighbour.posX>curX) {grid[curX,curY].wallRight = false; neighbour.wallLeft = false;}
        if (neighbour.posX<curX) {grid[curX,curY].wallLeft = false; neighbour.wallRight = false;}
        if (neighbour.posY>curY) {grid[curX,curY].wallDown = false; neighbour.wallUp = false;}
        if (neighbour.posY<curY) {grid[curX,curY].wallUp = false; neighbour.wallDown = false;}
    
        ds_stack_push(stack, neighbour);
    
        curX = neighbour.posX;
        curY = neighbour.posY;
    } 
    else //if no neighbour is found
    {
        with ds_stack_top(stack)
        {
            finished = true;
        }
        for (i = 0; i < obj_controller.map_sizeW-1; i++) {
            for (j = 0; j < obj_controller.map_sizeH-1; j++) {
            //show_debug_message("X: "+string(i)+"  Y: "+string(j));
                if (grid[i,j].finished == false)
                {
                    finished = false;
                }
            }
        }
        
        ds_stack_pop(stack);
        if (ds_stack_size(stack) == 0)
        {
            finished = true;
            //show_debug_message("Well damn..");
            
            for (i = 0; i < removedWalls; i++)
            {
                remove_random_wall(grid);
            }
            
            for (j = 0; j < hubs; j++)
            {
                show_debug_message(j);
                hubSize = argument4;
                create_hub(grid, hubSize);
            }
        }
        else {
            curX = ds_stack_top(stack).posX;
            curY = ds_stack_top(stack).posY;
        }
    }
}

return grid;    
