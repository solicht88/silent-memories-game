extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player = $"../player"
@onready var inv = $"../CanvasLayer/InventoryUI"
@onready var pause = $"../CanvasLayer/PauseMenu"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	pause.pause()
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("blue_chest")

func _on_dialogic_signal(argument: String):
	if argument == "unlocked_chest":
		inv.remove_slot("Blue Chest Key")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	Dialogic.signal_event.disconnect(_on_dialogic_signal)
	pause.unpause()
