/// @description Insert description here
// You can write your code in this editor

// Determine which directional buttons are pressed
var pressed_up    = keyboard_check(ord("W")) || keyboard_check(vk_up)
var pressed_left  = keyboard_check(ord("A")) || keyboard_check(vk_left)
var pressed_down  = keyboard_check(ord("S")) || keyboard_check(vk_down)
var pressed_right = keyboard_check(ord("D")) || keyboard_check(vk_right)

// Which directions are pressed, each is [-1, 0, 1]
// Two buttons in opposite directions at the same time cancel eachother out
var direction_vertical = pressed_down - pressed_up
var direction_horizontal = pressed_right - pressed_left

// Multiply our direction by our speed to determine velocity
velocity_vertical = direction_vertical * movement_speed
velocity_horizontal = direction_horizontal * movement_speed

// Determine whether the character is moving
var moving = (velocity_horizontal != 0 or velocity_vertical != 0)

// Determine if our state is moving or idle
if(state == "idle") {
	if (moving) {
		state = "moving"
	}
} else if (state == "moving") {
	if (!moving) {
		state = "idle"
	}
}

// Determine if we are moving up or down (or left or right in the future)
if (velocity_vertical < 0) {
	dir = "up"
}
if (velocity_vertical > 0) {
	dir = "down"
}

if ( place_free(x+(velocity_horizontal),y+(velocity_vertical)) ) {
    x += velocity_horizontal
	y += velocity_vertical
	depth = -y
}

var ui = instance_find(oUserInterface, 0)
var npc = instance_nearest(x,y, oNPCBase)
if(npc != noone && point_distance(x,y, npc.x, npc.y) < 50) {
	ui.open = true
	ui.text = npc.text
} else {
	ui.open = false
}


// Set the sprite based on whether we are moving/stopped and our direction
if(dir == "down") {
	if(state == "moving") {
		sprite_index = sCharFwdWalk;
	} else {
		sprite_index = sCharFwdIdle;
	}
} else if (dir == "up") {
	if(state == "moving") {
		sprite_index = sCharBckWalk;
	} else {
		sprite_index = sCharBckIdle;
	}
}


