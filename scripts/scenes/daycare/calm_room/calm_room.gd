extends Node2D

@onready var transition = $Transition
@onready var player = $player

var playroom = Vector2(50, 180)

# Called when the node enters the scene tree for the first time.
func _ready():
	player.can_move = false
	InteractionManager.can_interact = false
	transition.play("fade_out")
	await get_tree().create_timer(1).timeout
	player.can_move = true
	InteractionManager.can_interact = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
