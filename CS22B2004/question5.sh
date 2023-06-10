z#!/bin/bash


read -p "Enter the number of rows on workspace:" rows
read -p "Enter the number of columns on workspace:" cols
declare -A workspace

create_workspace() {
    for ((i=0; i<rows; i++)); do
        for ((j=0; j<cols; j++)); do
            workspace[$i,$j]=1  # 1 represents free space
        done
    done
    display_workspace
}


insert_obstacle() {
    local row=$1
    local col=$2
   
    workspace["$row,$col"]=0  # 0 represents an obstacle
}

move_robot() {
    local current_row=$1
    local current_col=$2
    read -p "Enter the new row of the robot:" new_row
    read -p "Enter the new column of the robot:" new_col
    # Update the new position of the robot
    workspace[$current_row,$current_col]=1
    if [ "${workspace["$new_row,$new_col"]}" -ne 0 ]; then 
    	#echo "entering if"
    	workspace["$new_row,$new_col"]='R' 
	a=$new_row
	b=$new_col
	fi
    display_workspace
}

display_workspace() {
    for ((i=0; i<rows; i++)); do
        for ((j=0; j<cols; j++)); do
            echo -n "${workspace[$i,$j]} "
        done
        echo
    done
    echo
}
echo "Before putting any obstacle"
create_workspace
echo "After inserting obstacle at desired position"
insert_obstacle 1 2
display_workspace

insert_obstacle 3 4
display_workspace
echo "Moving the robot wherever there is no obstacle"
move_robot 0 0
