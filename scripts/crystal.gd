extends RigidBody2D

signal _bump 

const CLAMP_VELOCITY = 4500.0
const CRYSTAL_ENTRY = Vector2(272, 146)

onready var score_text = get_tree().root.get_node('Zaun').get_node('HUD').get_node('Label')

var score = 0

func _ready():
	connect("bump", self, "_bump")
	
func _process(delta):
	if self.get_position().y > 220:
		new_crystal()
	
func _integrate_forces(state):
	var velocity = state.get_linear_velocity()
	if velocity.length() > CLAMP_VELOCITY:
		state.set_linear_velocity(velocity.clamped(CLAMP_VELOCITY))

func bump(body, force, score):
	var from_bumper = self.get_position() - body.get_position()
	self.apply_central_impulse(from_bumper.normalized() * force)
	self.score += score
	score_text.text = str(self.score)

func new_crystal():
	self.score = 0
	score_text.text = str(self.score)
	set_global_position(CRYSTAL_ENTRY)
