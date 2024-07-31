extends Control

var save_file_path = "user:://save/"
var save_file_name = "SaveData.tres"
var save_data = SaveData.new()

@onready var player = $"../../player"
@onready var inv = $"../InventoryUI"

var is_open = false

func _ready():
	close()

func _input(event):
	if event.is_action_pressed("open_menu"):
		if is_open:
			unpause()
			close()
			inv.close()
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
	player._animation_player.stop()
	InteractionManager.can_interact = false

func unpause():
	player.can_move = true
	InteractionManager.can_interact = true

func _on_unpause_pressed():
	unpause()
	close()

func _on_inventory_pressed():
	visible = false
	inv.open()

func _on_exit_pressed():
	get_tree().quit()
