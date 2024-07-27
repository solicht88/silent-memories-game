extends Node2D

@onready var transition = $Transition
@onready var player = $player

var playroom = Vector2(640, 630)
var bathroom = Vector2(640, 550)
var staff_room = Vector2(1060, 400)
var kitchen = Vector2(290, 480)

func _ready():
	player.can_move = false
	InteractionManager.can_interact = false
	transition.play("fade_out")
	await get_tree().create_timer(1).timeout
	player.can_move = true
	InteractionManager.can_interact = true
	#Dialogic.signal_event.connect(_on_dialogic_signal)
	#Dialogic.start("timeline")

'''
func _on_dialogic_signal(argument: String):
	if argument == "its a signal":
		print("knock knock")
'''
