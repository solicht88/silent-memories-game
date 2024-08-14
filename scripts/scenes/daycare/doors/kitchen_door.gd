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
	if !player.saveData.staff_key:
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		Dialogic.start("locked_door")
	elif player.saveData.kitchen_open:
		transition.play("fade_in")
		await get_tree().create_timer(0.6).timeout
		SceneSwitcher.switch_scene("res://scenes/maps/daycare/kitchen.tscn", location.kitchen)
	else:
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		Dialogic.start("unlocked_door")
		player.saveData.kitchen_open = true
		Dialogic.VAR.doors.daycare.kitchen_open = true
		if player.saveData.staff_open:
			inv.remove_slot("Staff Key")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	pause.unpause()
