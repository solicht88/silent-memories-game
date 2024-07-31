extends Control

@onready var player = $"../../player"

var is_open = false

func _input(event):
	if event.is_action_pressed("open_menu"):
		if is_open:
			unpause()
			close()
		else:
			pause()
			open()

func open():
	visible = true
	is_open = true
	
func close():
	visible = false
	is_open = false

func pause():
	player.can_move = false
	InteractionManager.can_interact = false

func unpause():
	player.can_move = true
	InteractionManager.can_interact = true
