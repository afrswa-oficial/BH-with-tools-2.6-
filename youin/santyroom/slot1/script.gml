if fire {
	proj_script = "if wait(fps*5) exit;
num = instance_number(obj_brick);
for (i = 0; i < num; i += 1) {obj[i] = instance_find(obj_brick,i);}
for (i = 0; i < num; i += 1){
    if (point_distance(obj[i].x,obj[i].y,x,y) > 10) {instance_deactivate_object(obj[i])}
    }
with obj_brick {
    if ((z-other.z)^2)^0.5 < 10 {
        kill();
        GmnBodySetVelocity(brick,vel_dir_x(x,y,z,other.x,other.y,other.z)*50,vel_dir_y(x,y,z,other.x,other.y,other.z)*50,vel_dir_z(x,y,z,other.x,other.y,other.z)*50);
        }
    }
instance_activate_object(obj_brick);
proj_script = 'if wait(fps*0.5) exit; instance_destroy();'
new_projectile(x,y,z,0,0,0,0,color(255,0,0),1,5,5,5,proj_script);
instance_destroy();"
	new_projectile(xfrom,yfrom,zfrom,50,camcos,-camsin,camtan,color(30,30,30),1,2,2,2,proj_script);
}