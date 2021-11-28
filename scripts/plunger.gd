extends Node2D

export var full_extension = 50
export var pull_time = 1.0
export var release_time = 0.05
export var keycode = "ui_plunger"

var release_speed = 0.0

func _physics_process(delta):
	var y = $RigidBody2D.get_position().y
	if Input.is_action_pressed(keycode):
		if y < full_extension:
			y += (full_extension / pull_time) * delta
			if y > full_extension:
				y = full_extension
			$RigidBody2D.set_position(Vector2(0, y))
	else:
		if y > 0.0:
			if release_speed == 0.0:
				release_speed = y / release_time
			y -= release_speed * delta
			if y <= 0.0:
				y = 0.0
				release_speed = 0.0
			$RigidBody2D.set_position(Vector2(0, y))
