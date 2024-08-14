extends Node2D

@onready var transition = $Transition
@onready var player = $player
@onready var pause = $CanvasLayer/PauseMenu

var playroom = Vector2(640, 630)
var bathroom = Vector2(640, 550)
var staff_room = Vector2(1060, 400)
var kitchen = Vector2(290, 480)

func _ready():
	pause.pause()
	transition.play("fade_out")
	if player.saveData.enter_cutscene == false:
		player.saveData.enter_cutscene = true
		player._animation_player.play("start_cutscene")
		await get_tree().create_timer(4.5).timeout
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		Dialogic.start("start")
	else:
		await get_tree().create_timer(0.6).timeout
		pause.unpause()
		#Dialogic.signal_event.connect(_on_dialogic_signal)
		#Dialogic.start("timeline")
	player.saveData.CurRoom = "res://scenes/maps/daycare/reception.tscn"

'''
func _on_dialogic_signal(argument: String):
	if argument == "its a signal":
		print("knock knock")
'''

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	pause.unpause()
