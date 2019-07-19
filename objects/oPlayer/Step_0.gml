key_left = keyboard_check(vk_left) || gamepad_axis_value(0, gp_axislh) < -0.5;
key_right = keyboard_check(vk_right) || gamepad_axis_value(0, gp_axislh) > 0.5
key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);

var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x, y+1,oWall)) && (key_jump)
{
	vsp = -16;
}

if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;