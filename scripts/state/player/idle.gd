class_name Idle
extends PlayerState
	
func handle_input(_event: InputEvent) -> void:
	pass
	
func update(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and player.is_on_floor():
		state_machine.transition_to("Jump")
		return
	
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		state_machine.transition_to("Walk")
		return
	
func enter() -> void:
	player.velocity = Vector2.ZERO
