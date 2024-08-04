extends Control

@onready var player = $"../../player"
@onready var transition = $"../../Transition"
@onready var _animation = $AnimationPlayer

var is_open = false

func _ready():
	close()

func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false
	#player.save_file_name = "SaveData.tres"
	#player.save_inv_name = "InvData.tres"

func _on_save_file_1_pressed():
	player.save_file_name = "SaveData.tres"
	#player.save_inv_name = "InvData.tres"

func _on_save_file_2_pressed():
	player.save_file_name = "SaveData2.tres"
	#player.save_inv_name = "InvData2.tres"

func _on_save_file_3_pressed():
	player.save_file_name = "SaveData3.tres"
	#player.save_inv_name = "InvData3.tres"

func _on_save_file_4_pressed():
	player.save_file_name = "SaveData4.tres"
	#player.save_inv_name = "InvData4.tres"

func _on_save_pressed():
	player.save_data()
	_animation.play("save")

func _on_load_pressed():
	close()
	transition.play("fade_in")
	await get_tree().create_timer(0.6).timeout
	player.load_data()
