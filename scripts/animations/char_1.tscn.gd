extends CharacterBody2D

@export var speed = 300

@onready var _animation_player = $AnimationPlayer

func get_input():
	var input_direction = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	if Input.is_action_pressed("walk_right") || Input.is_action_pressed("walk_left"):
		input_direction.y = 0
	elif Input.is_action_pressed("walk_up") || Input.is_action_pressed("walk_down"):
		input_direction.x = 0
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()

func _process(_delta):
	if Input.is_action_pressed("walk_right") && Input.is_action_pressed("walk_left"):
		_animation_player.stop()
	elif Input.is_action_pressed("walk_up") && Input.is_action_pressed("walk_down"):
		_animation_player.stop()
	elif Input.is_action_pressed("walk_left"):
		_animation_player.play("walk_left")
	elif Input.is_action_pressed("walk_right"):
		_animation_player.play("walk_right")
	elif Input.is_action_pressed("walk_up"):
		_animation_player.play("walk_up")
	elif Input.is_action_pressed("walk_down"):
		_animation_player.play("walk_down")
	else:
		_animation_player.stop()
