extends Control

@onready var transition = $Transition
@onready var can_press = true
@onready var save_menu = $CanvasLayer/SaveMenu
@onready var player = $player

func _ready():
	player.visible = false
	transition.play("fade_out")

func _on_new_game_pressed():
	if can_press:
		can_press = false
		transition.play("fade_in")
		await get_tree().create_timer(0.6).timeout
		SceneSwitcher.switch_scene("res://scenes/maps/daycare/reception.tscn", Vector2(635, 600))

func _on_continue_pressed():
	if can_press:
		save_menu.open()

func _on_quit_pressed():
	if can_press:
		can_press = false
		get_tree().quit()
