extends Node2D

@export var item: InvItem

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player = $"../player"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	player.can_move = false
	InteractionManager.can_interact = false
	if !player.saveData.blue_key:
		player.collect(item)
		Dialogic.VAR.inventory.daycare.blue_key = false
		player.saveData.blue_key = true
	Dialogic.start("washroom_sink")
	Dialogic.timeline_ended.connect(_on_timeline_ended)

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	player.can_move = true
	InteractionManager.can_interact = true
