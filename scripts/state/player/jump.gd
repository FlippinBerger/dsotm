class_name Jump
extends PlayerState

@export var JUMP_VELOCITY = -800.0

func enter():
	if player.is_on_floor():
		player.animation_player.play("jump")
		player.velocity.y = JUMP_VELOCITY

func update(delta: float):
	if player.is_on_floor():
		state_machine.transition_to("Idle")
