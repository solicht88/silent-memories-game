extends Node2D

@onready var transition = $Transition
@onready var player = $player

var reception = Vector2(1220, 620)

# Called when the node enters the scene tree for the first time.
func _ready():
	player.can_move = false
	InteractionManager.can_interact = false
	transition.play("fade_out")
	await get_tree().create_timer(0.6).timeout
	player.can_move = true
	InteractionManager.can_interact = true
	player.saveData.CurRoom = "res://scenes/maps/daycare/kitchen.tscn"
