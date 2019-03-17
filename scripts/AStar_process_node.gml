//add to closed list
ds_list_add(closedList, grid[curX, curY]);
ds_list_delete(openList, ds_list_find_index(openList, grid[curX, curY]));
grid[curX, curY].processed = true;

//analyze adjacent nodes (up, right, down, left) for walls and if they're already in
//  closed list
//  and add them to the open list if so
neigs = ds_list_create();    
if (curX+1 < obj_controller.map_sizeW){
    if (!ds_list_find_index(closedList, grid[curX+1, curY]) && !ds_list_find_index(openList, grid[curX+1, curY])){
        if (grid[curX+1, curY].wallLeft == false  && grid[curX, curY].wallRight == false){
            ds_list_add(openList, grid[curX+1, curY]);
            ds_list_add(neigs, grid[curX+1, curY]);
        }
    }
}

if (curX-1 >= 0){
    if !ds_list_find_index(closedList, grid[curX-1, curY]) && !ds_list_find_index(openList, grid[curX-1, curY]){
        if (grid[curX-1, curY].wallRight == false  && grid[curX, curY].wallLeft == false){
            ds_list_add(openList, grid[curX-1, curY]);
            ds_list_add(neigs, grid[curX-1, curY]);
        }
    }
}

if (curY+1 < obj_controller.map_sizeH){
    if (!ds_list_find_index(closedList, grid[curX, curY+1]) && !ds_list_find_index(openList, grid[curX, curY+1])){
        if (grid[curX, curY+1].wallUp == false && grid[curX, curY].wallDown == false) {
            ds_list_add(openList, grid[curX, curY+1]);
            ds_list_add(neigs, grid[curX, curY+1]);
        }
    }
}

if (curY-1 >= 0){
    if !ds_list_find_index(closedList, grid[curX, curY-1]) && !ds_list_find_index(openList, grid[curX, curY-1]){
        if (grid[curX, curY-1].wallDown == false  && grid[curX, curY].wallUp == false) {
            ds_list_add(openList, grid[curX, curY-1]);
            ds_list_add(neigs, grid[curX, curY-1]);
        }
    }
}
//show_debug_message("Size: "+string(ds_list_size(openList)));
for (i = 0; i<ds_list_size(neigs); i++){
    nodeNeig = ds_list_find_value(neigs,i);
    //Set parents
    nodeNeig.parent = grid[curX, curY];
    //Set G
    if (nodeNeig.GisSet == false){
        nodeNeig.G = (grid[curX, curY].G+10);
        //DISTANCE TO GOAL
        nodeNeig.H = (abs((nodeNeig.posX-goalX))+abs(nodeNeig.posY-goalY))*10;
        nodeNeig.GisSet = true;
        //SUM OF ABOVE
        nodeNeig.F = nodeNeig.G+nodeNeig.H;
    }
}
ds_list_clear(neigs);

if (ds_list_size(openList)>0){
    //Find lowest F
    var lowest = ds_list_find_value(openList,0).F;
    var lowestNode = ds_list_find_value(openList,0);
    for (i = 1; i < ds_list_size(openList); i++){
        if (ds_list_find_value(openList, i).F < lowest){
            lowestNode = ds_list_find_value(openList, i);
            lowest = lowestNode.F;
        }
    }
    curX = lowestNode.posX;
    curY = lowestNode.posY;
    ds_list_delete(openList, ds_list_find_index(openList, lowestNode));
    //show_debug_message("Coords: "+string(curX)+", "+string(curY));
}
else
{
    
    found = false;
    searching = false;
}

if(curX == goalX && curY == goalY){
    searching=false;
    found=true;
    //show_debug_message("You found me :D");
}
