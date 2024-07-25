extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player = $CharacterBody2D

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	player.speed = 0
	Dialogic.start("reception_book")
	await Dialogic.timeline_ended.connect(_on_timeline_ended)

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	player.speed = 300
