class_name Walk
extends PlayerState

func enter():
	player.animation_player.play("walk")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update(delta):
	if not (Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right")):
		state_machine.transition_to("Idle")
		
	if Input.is_action_just_pressed("ui_accept") and player.is_on_floor():
		state_machine.transition_to("Jump")
		return
