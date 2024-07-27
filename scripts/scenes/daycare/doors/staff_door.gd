extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var location = $".."
@onready var transition = $"../Transition"
@onready var player = $"../player"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	player.can_move = false
	InteractionManager.can_interact = false
	transition.play("fade_in")
	await get_tree().create_timer(1).timeout
	SceneSwitcher.switch_scene("res://scenes/maps/daycare/staff_room.tscn", location.staff_room)
