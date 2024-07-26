extends Node2D

@onready var transition = $Transition
@onready var player = $player

var reception = Vector2(200, 200)
var calm_room = Vector2(1220, 480)
var nap_room = Vector2(50, 480)

# Called when the node enters the scene tree for the first time.
func _ready():
	#transition.get_node("ColorRect").color.a = 255
	transition.play("fade_out")
	await get_tree().create_timer(1).timeout
	player.can_move = true
	InteractionManager.can_interact = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
