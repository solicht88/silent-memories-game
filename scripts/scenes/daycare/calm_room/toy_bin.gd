extends Node2D

@export var item: InvItem

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player = $"../player"
@onready var pause = $"../CanvasLayer/PauseMenu"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	pause.pause()
	if !player.saveData.nap_key:
		player.collect(item)
		Dialogic.VAR.inventory.daycare.nap_key = false
		player.saveData.nap_key = true
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("toy_bin")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	pause.unpause()
