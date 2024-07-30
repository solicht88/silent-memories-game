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
	if !Dialogic.VAR.inventory.daycare.staff_key:
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		Dialogic.start("locked_door")
	elif Dialogic.VAR.doors.daycare.staff_open:
		transition.play("fade_in")
		await get_tree().create_timer(1).timeout
		SceneSwitcher.switch_scene("res://scenes/maps/daycare/staff_room.tscn", location.staff_room)
	else:
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		Dialogic.start("unlocked_door")
		inv.remove_slot("Staff Key")
		Dialogic.VAR.doors.daycare.staff_open = true

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	player.can_move = true
	InteractionManager.can_interact = true
	inv.can_open = true
