if fire {
	new_projectile(x,y,z+10,50,camcos,-camsin,camtan,color(random(255),random(255),random(255)),1,2,2,2,"if wait(fps*10) exit; instance_destroy();");
}