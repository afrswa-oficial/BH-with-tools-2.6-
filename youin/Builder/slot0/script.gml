if fire {
	ghostx = round(client_ray_x(100));
	ghosty = round(client_ray_y(100));
	ghostz = round(client_ray_z(100));
	ghostblock = 1;
}
if place_brick and ghostblock {
	new_brick("",ghostx,ghosty,ghostz,xs,ys,zs,color(cr,cg,cb),1,0,brickID);
	brickID += 1;
}
if place_destroy {
	ghostblock = 0;
}

if pause = 4 {
if place_up {if flood = 0 or flood > 15 {ghostz += 1;} flood += 1;}
if place_down {if flood = 0 or flood > 15 {ghostz -= 1;} flood += 1;}
if place_forward {if flood = 0 or flood > 15 {ghostx += round(cos(degtorad(direction))); ghosty -= round(sin(degtorad(direction)));} flood += 1;}
if place_backward {if flood = 0 or flood > 15 {ghostx -= round(cos(degtorad(direction))); ghosty += round(sin(degtorad(direction)));} flood += 1;}
if place_left {if flood = 0 or flood > 15 {ghostx += round(cos(degtorad(direction+90))); ghosty -= round(sin(degtorad(direction+90)));} flood += 1;}
if place_right {if flood = 0 or flood > 15 {ghostx += round(cos(degtorad(direction-90))); ghosty -= round(sin(degtorad(direction-90)));} flood += 1;}
pause = 0;
}
pause += 1;

if keyboard_check_released(vk_numpad8) {flood = 0;}
if keyboard_check_released(vk_numpad4) {flood = 0;}
if keyboard_check_released(vk_numpad2) {flood = 0;}
if keyboard_check_released(vk_numpad6) {flood = 0;}
if keyboard_check_released(vk_up) {flood = 0;}
if keyboard_check_released(vk_down) {flood = 0;}

if keyboard_check_pressed(ord("N")) {dimension += 1;}
dimension = max(min(dimension,1),9);
if dimension == 1 {xs = 2; ys = 4; zs = 1;}
if dimension == 2 {xs = 1; ys = 1; zs = 1;}
if dimension == 3 {xs = 1; ys = 4; zs = 1;}
if dimension == 4 {xs = 1; ys = 2; zs = 1;}
if dimension == 5 {xs = 1; ys = 1; zs = 1/3;}
if dimension == 6 {xs = 2; ys = 2; zs = 1/3;}
if dimension == 7 {xs = 2; ys = 4; zs = 1/3;}
if dimension == 8 {xs = 4; ys = 4; zs = 1/3;}
if dimension == 9 {xs = 1; ys = 2; zs = 1/3;}

if keyboard_check_pressed(ord("B")) {brush += 1;}
brush = max(min(dimension,1),9);
if brush == 1 {cr = 255; cg = 0; cb = 0;}
if brush == 2 {cr = 0; cg = 255; cb = 0;}
if brush == 3 {cr = 0; cg = 0; cb = 255;}
if brush == 4 {cr = 255; cg = 255; cb = 255;}
if brush == 5 {cr = 20; cg = 20; cb = 20;}
if brush == 6 {cr = 128; cg = 0; cb = 255;}
if brush == 7 {cr = 255; cg = 255; cb = 0;}
if brush == 8 {cr = 255; cg = 0; cb = 255;}
if brush == 9 {cr = 0; cg = 255; cb = 255;}

if keyboard_check_pressed(ord("R")) {sxx = xs; xs = ys; ys = sxx;}
if keyboard_check_pressed(ord("T")) {sxx = xs; xs = zs; zs = sxx;}

client_3d(true);
if ghostblock {
	if al <= 0.2 {aldir = 1;}
	if al >= 0.8 {aldir = 0;}
	if aldir = 1 {al += 0.01;} else {al -= 0.01;}
	draw_set_alpha(al);
	d3d_light_define_ambient(color(cr,cg,cb))
	d3d_draw_block(ghostx-xs/2,ghosty-ys/2,ghostz,ghostx+xs/2,ghosty+ys/2,ghostz+zs,-1,-1,-1);
}
client_3d(false);
draw_text(10,room_height-130,string(xs)+"x"+string(ys)+"x"+string(zs)+"x");
draw_text(10,room_height-150,string(cr)+","+string("cg")+","+string("cb"));