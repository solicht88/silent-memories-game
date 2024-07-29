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
	player.collect(item)
	Dialogic.start("pink_chest")
	Dialogic.timeline_ended.connect(_on_timeline_ended)

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	player.can_move = true
	InteractionManager.can_interact = true
	inv.can_open = true
