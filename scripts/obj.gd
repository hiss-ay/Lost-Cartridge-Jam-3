extends Area2D

export var force_value = 150
export var score_value = 320

func _on_Kolba_body_entered(body):
	body.bump(self, force_value, score_value)
