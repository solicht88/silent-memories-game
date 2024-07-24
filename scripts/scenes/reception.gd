extends Node2D

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("timeline")

func _on_dialogic_signal(argument: String):
	if argument == "its a signal":
		print("knock knock")
