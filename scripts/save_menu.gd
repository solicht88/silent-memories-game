extends Control

@onready var player = $"../../player"
@onready var transition = $"../../Transition"

var is_open = false

func _ready():
	close()

func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false

func _on_save_file_1_pressed():
	player.save_file_name = "SaveData.tres"

func _on_save_file_2_pressed():
	pass

func _on_save_file_3_pressed():
	pass

func _on_save_file_4_pressed():
	pass # Replace with function body.

func _on_save_pressed():
	player.save_data()

func _on_load_pressed():
	transition.play("fade_in")
	await get_tree().create_timer(0.6).timeout
	player.load_data()
