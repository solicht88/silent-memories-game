extends Node2D

@export var item: InvItem

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player = $"../player"
@onready var inv = $"../CanvasLayer/InventoryUI"
@onready var pause = $"../CanvasLayer/PauseMenu"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	pause.pause()
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	if player.saveData.pink_key && !player.saveData.staff_key:
		player.collect(item)
		Dialogic.VAR.inventory.daycare.staff_key = false
		player.saveData.staff_key = true
	Dialogic.start("pink_chest")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	inv.remove_slot("Pink Chest Key")
	pause.unpause()
