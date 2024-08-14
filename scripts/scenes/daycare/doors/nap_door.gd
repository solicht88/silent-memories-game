extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var location = $".."
@onready var transition = $"../Transition"
@onready var player = $"../player"
@onready var inv = $"../CanvasLayer/InventoryUI"
@onready var pause = $"../CanvasLayer/PauseMenu"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	pause.pause()
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
		Dialogic.VAR.doors.daycare.nap_open = true

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	pause.unpause()
