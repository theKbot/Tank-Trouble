//argument0 = grid
//argument1 = curX
//argument2 = curY

var grid = argument0;
var curX = argument1;
var curY = argument2;
var nodeLeft, nodeRight, nodeUp, nodeDown;
var neighlist = ds_list_create();
var Choose;

if (curX - 1 >= 0) {
    if (grid[curX - 1, curY].visited == false) {
        nodeLeft = grid[curX - 1, curY];
        ds_list_add(neighlist, nodeLeft);        
    }
}

if (curX + 1 <= obj_controller.map_sizeW-1) {
    if (grid[curX + 1,curY].visited == false) {
        nodeRight = grid[curX + 1, curY];
        ds_list_add(neighlist, nodeRight);
    }
}

if (curY - 1 >= 0) {
    if (grid[curX,curY - 1].visited == false) {
        nodeUp = grid[curX,curY - 1];
        ds_list_add(neighlist, nodeUp);
    }
}

if (curY + 1 <= obj_controller.map_sizeH-1) {
    if (grid[curX,curY + 1].visited == false) {
        nodeDown = grid[curX,curY + 1];
        ds_list_add(neighlist, nodeDown);
    }
}    

if (ds_list_size(neighlist) > 0) {
    ds_list_shuffle(neighlist);
    Choose = ds_list_find_value(neighlist, 0);
    Choose.visited = true;
    return Choose;
}
else {return noone;}
