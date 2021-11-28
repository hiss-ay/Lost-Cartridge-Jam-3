extends Node2D

export var keycode = "ui_left"
export var snap_time = 0.25
export var snap_angle = 50

onready var intermediate_time = 0.0
onready var rb = $RigidBody2D

func _physics_process(delta):
	if Input.is_action_pressed(keycode):
		if intermediate_time < snap_time:
			intermediate_time += delta
			if intermediate_time > snap_time:
				intermediate_time = snap_time
			rb.set_rotation_degrees((intermediate_time / snap_time) * snap_angle)
	else:
		if intermediate_time > 0:
			intermediate_time -= delta
			if intermediate_time < 0:
				intermediate_time = 0
			rb.set_rotation_degrees((intermediate_time / snap_time) * snap_angle)
