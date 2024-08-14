extends Node2D

@onready var transition = $Transition
@onready var player = $player
@onready var pause = $CanvasLayer/PauseMenu

var reception = Vector2(1220, 620)

# Called when the node enters the scene tree for the first time.
func _ready():
	pause.pause()
	transition.play("fade_out")
	await get_tree().create_timer(0.6).timeout
	pause.unpause()
	player.saveData.CurRoom = "res://scenes/maps/daycare/kitchen.tscn"
