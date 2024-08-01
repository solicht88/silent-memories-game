extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var location = $".."
@onready var transition = $"../Transition"
@onready var player = $"../player"
@onready var inv = $"../CanvasLayer/InventoryUI"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	player.can_move = false
	InteractionManager.can_interact = false
	inv.can_open = false
	if !player.saveData.nap_key:
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		Dialogic.start("locked_door")
	elif player.saveData.nap_open:
		transition.play("fade_in")
		await get_tree().create_timer(0.6).timeout
		SceneSwitcher.switch_scene("res://scenes/maps/daycare/nap_room.tscn", location.nap_room)
	else:
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		Dialogic.start("unlocked_door")
		inv.remove_slot("Nap Room Key")
		player.saveData.nap_open = true

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	player.can_move = true
	InteractionManager.can_interact = true
	inv.can_open = true
