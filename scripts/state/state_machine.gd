class_name StateMachine
extends Node

@export var initial_state := NodePath()
@onready var state: State = get_node(initial_state)

# Called when the node enters the scene tree for the first time.
func _ready():
	await owner.ready
	
	for child in get_children():
		child.state_machine = self
	state.enter()
	
func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	state.update(delta)
	
func _physics_process(delta: float) -> void:
	state.physics_update(delta)
	
func transition_to(state_name: String) -> void:
	if not has_node(state_name):
		print("didn't have node", state_name)
		return
	state.exit()
	
	state = get_node(state_name)
	state.enter()
