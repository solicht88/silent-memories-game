extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "on_interact")

func _on_interact():
	SceneSwitcher.switch_scene("res://scenes/maps/daycare/playroom.tscn")
