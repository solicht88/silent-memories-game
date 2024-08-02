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
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	if player.saveData.pink_key && !player.saveData.staff_key:
		player.collect(item)
		Dialogic.VAR.inventory.daycare.staff_key = false
		player.saveData.staff_key = true
	Dialogic.start("pink_chest")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	inv.remove_slot("Pink Chest Key")
	player.can_move = true
	InteractionManager.can_interact = true
