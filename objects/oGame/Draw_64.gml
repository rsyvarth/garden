/// @description Insert description here
// You can write your code in this editor

display_set_gui_size(720, 450);
draw_set_colour(c_black);
draw_rectangle(0, 400, 719, 449, false);
draw_set_colour(c_white);
draw_rectangle(0, 400, 719, 449, true);

draw_text_ext_transformed(0+120, 400+10, "This is some text. Please use WASD to move around. You may also use the arrow keys if you would prefer.", 20, 700, 0.7, 0.7, 0);
//draw_text(0+20, 400+10, "This is some text")

