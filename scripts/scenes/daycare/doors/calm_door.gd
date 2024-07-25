extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var location = $".."

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	SceneSwitcher.switch_scene("res://scenes/maps/daycare/calm_room.tscn", location.calm_room)
