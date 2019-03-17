//Define the start and end points
//argument 0 = start node
//argument 1 = goal node
//argument 2 = grid
//argument 3 = width in nodes
//argument 4 = height in nodes
startNode = argument0;
goalNode = argument1;
startX = startNode.posX;
startY = startNode.posY;
goalX = goalNode.posX;
goalY = goalNode.posY;
curX = startX;
curY = startY;
grid = argument2;
w = argument3;
h = argument4;

searching = true;
found = false;

//create datastructures
openList = ds_list_create();
closedList = ds_list_create();

//Algorithm

    //reset values for all nodes
for (i = 0; i < obj_controller.map_sizeW; i++){
    for (j = 0; j < obj_controller.map_sizeH; j++){
        grid[i,j].G = 0;
        grid[i,j].H = 0;
        grid[i,j].F = 0;
    }
}
while (found == false)
{
    AStar_process_node();
}

var path = noone;
if (found){
    path = path_add();
    var curNode = grid[curX, curY];
    while (curNode!=startNode){
        path_add_point(path,curNode.x,curNode.y,0);
        curNode = curNode.parent;
    }
    path_add_point(path, startNode.x, startNode.y, 0);
    path_reverse(path);
    path_set_closed(path, false);
}

//Post algorithm
return path;
