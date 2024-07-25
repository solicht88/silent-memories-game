extends Node2D

var playroom = Vector2(640, 630)

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("timeline")

func _on_dialogic_signal(argument: String):
	if argument == "its a signal":
		print("knock knock")
