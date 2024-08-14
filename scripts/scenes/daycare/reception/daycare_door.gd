extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var transition = $"../Transition"
@onready var player = $"../player"
@onready var inv = $"../CanvasLayer/InventoryUI"
@onready var pause = $"../CanvasLayer/PauseMenu"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	pause.pause()
	if !player.saveData.caretaker_key:
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		Dialogic.start("daycare_door")
	elif player.saveData.daycare_open:
		Dialogic.signal_event.connect(_on_dialogic_signal)
		transition.play("fade_in")
		await get_tree().create_timer(1).timeout
		Dialogic.start("demo_end")
	else:
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		Dialogic.start("daycare_door")
		player.saveData.daycare_open = true
		Dialogic.VAR.doors.daycare.daycare_open = true
		inv.remove_slot("Caretaker Key")

func _on_dialogic_signal(argument: String):
	if argument == "end":
		Dialogic.signal_event.disconnect(_on_dialogic_signal)
		get_tree().change_scene_to_file("res://scenes/title_screen/title_screen.tscn")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	pause.unpause()
