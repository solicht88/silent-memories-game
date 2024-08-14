extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
#@onready var player = $"../player"
@onready var pause = $"../CanvasLayer/PauseMenu"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	pause.pause()
	Dialogic.start(String(self.get_name()))
	Dialogic.timeline_ended.connect(_on_timeline_ended)

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	pause.unpause()
