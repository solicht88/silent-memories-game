extends Control

func _ready():
	pass

func _on_new_game_pressed():
	SceneSwitcher.switch_scene("res://scenes/maps/daycare/reception.tscn", Vector2(635, 600))

func _on_continue_pressed():
	pass

func _on_quit_pressed():
	get_tree().quit()
