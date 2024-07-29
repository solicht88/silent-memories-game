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
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("pink_chest")
	Dialogic.timeline_ended.connect(_on_timeline_ended)

func _on_dialogic_signal(argument: String):
	if argument == "obtained_key":
		player.collect(item)

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	Dialogic.signal_event.disconnect(_on_dialogic_signal)
	player.can_move = true
	InteractionManager.can_interact = true
	inv.can_open = true
