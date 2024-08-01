extends Node2D

@onready var transition = $Transition
@onready var player = $player
@onready var inv = $CanvasLayer/InventoryUI

var reception = Vector2(200, 200)
var calm_room = Vector2(1220, 480)
var nap_room = Vector2(50, 480)

# Called when the node enters the scene tree for the first time.
func _ready():
	player.can_move = false
	InteractionManager.can_interact = false
	inv.can_open = false
	transition.play("fade_out")
	await get_tree().create_timer(0.6).timeout
	player.can_move = true
	InteractionManager.can_interact = true
	inv.can_open = true
	player.saveData.CurRoom = "res://scenes/maps/daycare/playroom.tscn"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
