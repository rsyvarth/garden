/// @description Insert description here
// You can write your code in this editor

application_surface_draw_enable(false);
window_set_fullscreen(true);

global.Xoffset=(global.MonitorW-720)/2;
global.Yoffset=(global.MonitorH-450)/2;
surface_resize(application_surface,720,450)

if(global.MonitorW>=1440 && global.MonitorH>=900) {
	surface_resize(application_surface,1440,900)
	global.Xoffset=(global.MonitorW-1440)/2;
	global.Yoffset=(global.MonitorH-900)/2;
}
