extends Control

@onready var player = $".."

var is_open = false
var can_open = true

func _ready():
	close()

func _input(event):
	if can_open:
		if event.is_action_pressed("open_inv"):
			if is_open:
				close()
				player.can_move = true
				InteractionManager.can_interact = true
			else:
				player.can_move = false
				player._animation_player.stop()
				InteractionManager.can_interact = false
				open()

func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false
