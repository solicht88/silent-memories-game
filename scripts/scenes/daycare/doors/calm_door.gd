extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var location = $".."
@onready var transition = $"../Transition"
#@onready var player = $"../player"
@onready var pause = $"../CanvasLayer/PauseMenu"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	pause.pause()
	transition.play("fade_in")
	await get_tree().create_timer(0.6).timeout
	SceneSwitcher.switch_scene("res://scenes/maps/daycare/calm_room.tscn", location.calm_room)
