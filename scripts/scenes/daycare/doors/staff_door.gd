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
	if !player.saveData.staff_key:
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		Dialogic.start("locked_door")
	elif player.saveData.staff_open:
		transition.play("fade_in")
		await get_tree().create_timer(0.6).timeout
		SceneSwitcher.switch_scene("res://scenes/maps/daycare/staff_room.tscn", location.staff_room)
	else:
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		Dialogic.start("unlocked_door")
		player.saveData.staff_open = true
		Dialogic.VAR.doors.daycare.staff_open = true
		if Dialogic.VAR.doors.daycare.kitchen_open:
			inv.remove_slot("Staff Key")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	player.can_move = true
	InteractionManager.can_interact = true
