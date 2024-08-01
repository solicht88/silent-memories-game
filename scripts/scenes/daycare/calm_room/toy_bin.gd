extends Node2D

@export var item: InvItem

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player = $"../player"
@onready var inv = $"../CanvasLayer/InventoryUI"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	player.can_move = false
	InteractionManager.can_interact = false
	inv.can_open = false
	if !player.saveData.nap_key:
		print("collected")
		player.collect(item)
		Dialogic.VAR.inventory.daycare.nap_key = false
		player.saveData.nap_key = true
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("toy_bin")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	player.can_move = true
	InteractionManager.can_interact = true
	inv.can_open = true
