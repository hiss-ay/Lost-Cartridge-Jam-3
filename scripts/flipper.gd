extends Node2D

export var is_right_flipper = false
export var angle_y = -50
export var rotate_speed = 0.2

onready var tween = get_node("Tween")

var button_pressed = false

func _physics_process(delta):
	if is_right_flipper:
		button_pressed = Input.is_action_pressed("ui_right")
	else:
		button_pressed = Input.is_action_pressed("ui_left")
		
	if button_pressed:
		var r = Vector2(0, rad2deg(234))
		tween.interpolate_property(self, "rotation_degrees", angle_y, 0, rotate_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
		tween.start()
		
	pass 
